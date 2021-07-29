//
//  MRDViewController.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 29/07/21.
//

import UIKit

class MRDViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        //setup delegate
        table.delegate = self
        table.dataSource = self
        
        //register XIB cell
        table.register(MRDTableViewCell.nib(), forCellReuseIdentifier: MRDTableViewCell.identifier)
        table.register(LargeTextFieldTableViewCell.nib(), forCellReuseIdentifier: LargeTextFieldTableViewCell.identifier)
        
        //Moving Content that is located under the keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisapear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    var isExpand: Bool = false
    
    // table view will expand size by + 300
    @objc func keyboardAppear(){
        
        if !isExpand{
            self.table.contentSize = CGSize(width: self.view.frame.width, height: self.table.frame.height +  300)
            isExpand = true
        }
    }
    
    // table view will back to normal size by - 300
    @objc func keyboardDisapear(){
        
        if isExpand{
            self.table.contentSize = CGSize(width: self.view.frame.width, height: self.table.frame.height -  300)
            isExpand = false
        }
    }

    private func setup(){
        self.navigationItem.title = "Medical Record"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(dismissModal))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didEditButtonTapped))
    }
    
    
    // Function to dismiss modal view
    @objc private func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    
    // Function to go show modally edit page
    @objc private func didEditButtonTapped(){
//        let storyboard = UIStoryboard(name: "storyboardName", bundle: nil)
//
//        let vc = storyboard.instantiateViewController(identifier: "storyBoardIdentifier")
//
//        let navVc = UINavigationController(rootViewController: vc)
//
//        self.present(navVc, animated: true, completion: nil)
        
    }

    
}

extension MRDViewController: UITableViewDelegate{
    
}
extension MRDViewController: UITableViewDataSource{
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 3
        case 3:
            return 1
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell =  table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Date", placeholder: "MM//DD/YYY")
                return cell
            default:
                fatalError()
            }
        case 1:
            switch indexPath.row {
            case 0:
                let cell =  table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Veterinarian", placeholder: "Vet name")
                return cell
                
            case 1:
                let cell =  table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Diagnosis", placeholder: "Diagnosis")
                return cell
                
            case 2:
                let cell =  table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Vaccine", placeholder: "Vaccine")
                return cell
                
            default:
                fatalError()
            }
        case 2:
            switch indexPath.row {
            case 0:
                let cell =  table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Medicine", placeholder: "Medicine")
                return cell
            case 1:
                let cell =  table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Vaccine Type", placeholder: "Vaccine type")
                return cell
            case 2:
                let cell =  table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Dosage", placeholder: "Dosage")
                return cell
                
            default:
                fatalError()
            }
        case 3:
            switch indexPath.row {
            case 0:
                
                let largeCell = table.dequeueReusableCell(withIdentifier: LargeTextFieldTableViewCell.identifier, for: indexPath) as! LargeTextFieldTableViewCell
                
                largeCell.configuration(description: "hello world")
                
                return largeCell
            default:
                fatalError()
            }
        default:
            fatalError()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Time"
        case 1:
            return "Details"
        case 2:
            return "Medical History"
        case 3:
            
            return "Description"
        default:
            fatalError()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.allowsSelection = false
        tableView.deselectRow(at: indexPath, animated: false)
        
        
    }
     
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section != 3{
            return 45
            
        }
        else{
            return 100
        }
        
        
    }

}
