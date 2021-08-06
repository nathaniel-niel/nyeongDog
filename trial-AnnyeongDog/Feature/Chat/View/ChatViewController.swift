//
//  ChatViewController.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 05/08/21.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    //MARK: - Calling Facetime Methods
    var facetimeCall = FacetimeVideoCall()
    
    var messages: [Messages] = [
        Messages(sender: "novi", body: "Hey"),
        Messages(sender: "vivi", body: "Hello nov")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        //MARK: -Register xib cell
        chatTableView.register(ChatViewCell.nib(), forCellReuseIdentifier: ChatViewCell.identifier)
        chatTableView.register(PrescriptionViewCell.nib(), forCellReuseIdentifier: PrescriptionViewCell.identifier)
        
        messageTextField.delegate = self
        
//        let center: NotificationCenter = NotificationCenter.default;
//        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
//    func keyboardDidShow(notification: Notification) {
//        let info: NSDictionary = notification.userInfo! as NSDictionary
//        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        let keyboardY = self.view.frame.size.height - keyboardSize.height
//        
//        let editingTextFieldY: CGFloat! = self.messageTextField.frame.origin.y
//        
//        if editingTextFieldY > keyboardY - 60 {
//            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOption, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
//        }
//        
//    }
    
//    func keyboardWillHide(notification: Notification) {
//        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
//            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
//        }, completion: nil)
//    }
    
    
    func setup() {
        //MARK: -Customize Back Button
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackButton))
        
        //MARK: -Customize Vet Profile
        let profileVet = UIBarButtonItem(customView: VetProfile.init())
        
        self.navigationItem.leftBarButtonItems = [backButton, profileVet]
        
        //MARK: -Customize Video Call Button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "video"), style: .plain, target: self, action: #selector(didTapVideoButton))
    
        
        self.navigationItem.largeTitleDisplayMode = .never
        //MARK: -Hide tab bar in chat
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: Back Button Logic
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: -Logic Video Call Button
    @objc func didTapVideoButton() {
        
        facetimeCall.fetchFacetime()
        
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: ChatViewCell.identifier, for: indexPath) as! ChatViewCell
        
        switch indexPath.row {
        
        case 0 :
            cell.messageLabel.text = messages[indexPath.row].body
        case 1 :
            cell.messageLabel.text = messages[indexPath.row].body
        case 2 :
            let prescriptionCell = chatTableView.dequeueReusableCell(withIdentifier: PrescriptionViewCell.identifier) as! PrescriptionViewCell
            
        default :
            print("Error")
        }
        return cell
    }
 
}
extension ChatViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text)
        return true
    }
}
