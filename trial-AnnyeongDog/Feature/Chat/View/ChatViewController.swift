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
    @IBOutlet weak var chatView: UIView!
    
    
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
        
        //MARK: -Message TextField Configuration
        messageTextField.delegate = self
        messageTextField.autocorrectionType = .no
        
        //MARK: -Keyboard Notification Center
        let center: NotificationCenter = NotificationCenter.default;
        //        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        //        center.addObserver(self, selector: #selector(self.keyboardNotification(notification: )), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillChange(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillChange(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        //        center.addObserver(self, selector: #selector(keyboardWillChange(notification: )), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        //
        //
    }
    
    deinit {
        let center: NotificationCenter = NotificationCenter.default;
        center.removeObserver(self)
    }
    @objc func keyboardWillChange(notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            //MARK: Put the textfield precisely above the keyboard
            view.frame.origin.y = isKeyboardShowing ? -keyboardFrame!.height : 0
        }
        
        //        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
        //                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        //                }, completion: nil)
    }
    
    //    @objc func keyboardNotification(notification: NSNotification) {
    //        if let userInfo = notification.userInfo {
    //            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    //            let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue ?? 0
    //            let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
    //            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
    //            let animationCurve: UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
    //
    //            UIView.animate(withDuration: duration, delay: TimeInterval(0), options: animationCurve, animations: {self.view.layoutIfNeeded()}, completion: nil)
    //        }
    //    }
    //    //MARK: -Function Keyboard is Called
    //    @objc func keyboardDidShow(notification: Notification) {
    //        let info: NSDictionary = notification.userInfo! as NSDictionary
    //        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    //        let keyboardY = self.view.frame.size.height - keyboardSize.height
    //
    //        let editingTextFieldY: CGFloat! = self.messageTextField.frame.origin.y
    //        if editingTextFieldY > keyboardY - 60 {
    //            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
    //                self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.bounds.width, height: self.view.bounds.height)
    //            }, completion: nil)
    //        }
    //
    //    }
    //    //MARK: -Function Keyboard is Dismissed
    //    @objc func keyboardWillHide(notification: Notification) {
    //        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
    //            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
    //        }, completion: nil)
    //    }
    
    
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
        return messages.count
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
        //MARK: If return button is tapped, keyboard will be dismissed
        //        self.view.endEditing(true)
        textField.resignFirstResponder()
        print(textField.text)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageTextField.endEditing(true)
    }
}
