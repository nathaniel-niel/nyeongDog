//
//  ChatViewController.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 05/08/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var chatView: UIView!
    
    
    //MARK: - Calling Facetime Methods
    var facetimeCall = FacetimeVideoCall()
    let db = Firestore.firestore()
    var dbCollection = DatabaseCollectionName()
    
    var vetProfile: VetProfile?
    var messages: [Messages] = []
    let ViewModel = VetListViewModel()
//    var chatViewCell: ChatViewCell?
    
    //MARK: -Constraints

    
    //MARK: - App Life Cycle
    
//    override func viewWillAppear(_ animated: Bool) {
//        vetProfileLoadFromModel()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        //MARK: Register xib cell
        chatTableView.register(ChatViewCell.nib(), forCellReuseIdentifier: ChatViewCell.identifier)
        chatTableView.register(PrescriptionViewCell.nib(), forCellReuseIdentifier: PrescriptionViewCell.identifier)
        
        //MARK: Message TextField Configuration
        messageTextField.delegate = self
        messageTextField.autocorrectionType = .no
        
        getMessage()
//        vetProfile?.vetName.text = ViewModel.vetNameList[UserControl.shared.indexPath].vetName
        //MARK: Keyboard Notification Center
        let center: NotificationCenter = NotificationCenter.default;
        center.addObserver(self, selector: #selector(keyboardWillChange(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillChange(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        let center: NotificationCenter = NotificationCenter.default;
        center.removeObserver(self)
    }
    

    
    //MARK: -Function keyboard dismiss
    
    @objc func keyboardWillChange(notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            //MARK: Put the textfield precisely above the keyboard
            view.frame.origin.y = isKeyboardShowing ? -keyboardFrame!.height : 0
        }
    }
    
    //MARK: -Setup navigation and tabbar
    func setup() {
        //MARK: Customize Back Button
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackButton))
        
        //MARK: Customize Vet Profile
        let profileVet = UIBarButtonItem(customView: VetProfile.init())
        self.navigationItem.leftBarButtonItems = [backButton, profileVet]
        
        //MARK: Customize Video Call Button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "video"), style: .plain, target: self, action: #selector(didTapVideoButton))
        
        self.navigationItem.largeTitleDisplayMode = .never
        //MARK: Hide tab bar in chat
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: -Send Button Logic
    @IBAction func sendButtonPressed(_ sender: UIButton) {
//        messageTextField.endEditing(true)
        sendPressed()
        print("x")
        messageTextField.endEditing(true)
        print(messageTextField.text)
        
    }
    
    //MARK: -Vet Profile : Load name from model
//    func vetProfileLoadFromModel() {
//        vetProfile.objectModel = vetListModel
//    }
    
    //MARK: -If the message are ready to sent to Firebase
   
    func sendPressed(completion: @escaping() -> Void){
        if let messageBody = messageTextField.text,  let messageSender = Auth.auth().currentUser?.email{
            
            db.collection(dbCollection.collectionName).addDocument(data: [
                dbCollection.senderField : messageSender,
                dbCollection.bodyField : messageBody,
                dbCollection.dateField: Date().timeIntervalSince1970
                
            ]) { (error) in
                if let a = error {
                    print(a)
                }else{
                    print(messageBody)
                    completion()
                }
            }
            
        }
    }
    //MARK: -Logic to send and or retrieving a message to Firebase
    
    func getMessage(){
        
        db.collection(dbCollection.collectionName)
            .order(by: dbCollection.dateField )
            .addSnapshotListener{ (querrySnapshot, error) in
                
                self.messages = []
                
                if let e = error{
                    print(e)
                }
                else{
                    
                    
                    if let snapshotDocuments = querrySnapshot?.documents{
                        
                        for doc in snapshotDocuments{
                            
                            let data = doc.data()
                            print(data)
                            
                            if let sender = data[self.dbCollection.senderField] as? String, let messageBody = data[self.dbCollection.bodyField] as? String{
                                let newMessage = Messages(sender: sender, body: messageBody)
                                self.messages.append(newMessage)
                                
                                DispatchQueue.main.async {
                                    self.chatTableView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
                                }
                                
                                
                            }
                        }
                        
                    }
                }
            }
        
    }
    
    
    //MARK: -Back Button Logic
    @objc func didTapBackButton() {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    //MARK: -Logic Video Call Button
    @objc func didTapVideoButton() {
        facetimeCall.fetchFacetime()
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let messageCell =  messages[indexPath.row]
        let cell = chatTableView.dequeueReusableCell(withIdentifier: ChatViewCell.identifier, for: indexPath) as! ChatViewCell
        
        let size = CGSize(width: 250, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: messageCell.body).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)], context: nil)
        
        //MARK: If it's not the current user, the cell will show different color
        if messageCell.sender == Auth.auth().currentUser?.email {
            
            cell.messageBubble.backgroundColor = UIColor(named: "bubble-0")
            cell.messageLabel.text = messages[indexPath.row].body
            cell.messageLabel.textColor = .white
//            cell.trailingMessageBubbleConstraint.constant = 200
        }
        else{
            
            cell.messageBubble.backgroundColor = UIColor(named: "bubble-1")
            cell.messageLabel.text = messages[indexPath.row].body
            cell.messageLabel.textColor = .black
//            cell.leadingMessageBubbleConstraint.constant = 100
        }
        

        return cell
    }
    
    
    
}

extension ChatViewController: UITextFieldDelegate {
    //MARK: If return button is tapped, keyboard will be dismissed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //        self.view.endEditing(true)
        
        messageTextField.endEditing(true)
        
        textField.resignFirstResponder()
//        print(textField.text)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageTextField.endEditing(true)
    }
    
    //MARK: If return button is tapped, keyboard will be dismissed, the text field will be empty and it will send the text to Firebase
    func textFieldDidEndEditing(_ textField: UITextField) {
        sendPressed(completion: {
            textField.text = ""
        })
        
        
        
    }
    
    
    
}
