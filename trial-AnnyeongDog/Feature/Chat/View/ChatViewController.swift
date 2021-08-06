//
//  ChatViewController.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 05/08/21.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: UITableView!
    var messages: [Messages] = [
        Messages(sender: "novi", body: "Hey"),
        Messages(sender: "vivi", body: "Hello nov")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        
        //MARK: -Register xib cell
        chatTableView.register(ChatViewCell.nib(), forCellReuseIdentifier: ChatViewCell.identifier)
        chatTableView.register(PrescriptionViewCell.nib(), forCellReuseIdentifier: PrescriptionViewCell.identifier)
    }
    
    
    func setupNavigation() {
        //MARK: -Customize Back Button
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackButton))
        
        //MARK: -Customize Vet Profile
        let profileVet = UIBarButtonItem(customView: VetProfile.init())
        
        self.navigationItem.leftBarButtonItems = [backButton, profileVet]
        
        //MARK: -Customize Video Call Button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "video"), style: .plain, target: self, action: #selector(didTapVideoButton))
    }
    
    //MARK: Back Button Logic
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: -Logic Video Call Button
    @objc func didTapVideoButton() {
        
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
