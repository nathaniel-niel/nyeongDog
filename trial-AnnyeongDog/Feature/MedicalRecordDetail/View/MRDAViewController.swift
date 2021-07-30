//
//  MRDAViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 30/07/21.
//

import UIKit

class MRDAViewController: UIViewController {

    @IBOutlet weak var mrdaTable: UITableView!
    
    let ViewModel = MRDViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        //setup delegate
        mrdaTable.delegate = self
        mrdaTable.dataSource = self
        
        //register XIB cell
        mrdaTable.register(MRDTableViewCell.nib(), forCellReuseIdentifier: MRDTableViewCell.identifier)
        mrdaTable.register(LargeTextFieldTableViewCell.nib(), forCellReuseIdentifier: LargeTextFieldTableViewCell.identifier)
        
        //Moving Content that is located under the keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisapear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    var isExpand: Bool = false
    
    // table view will expand size by + 300
    @objc func keyboardAppear(){
        
        if !isExpand{
            self.mrdaTable.contentSize = CGSize(width: self.view.frame.width, height: self.mrdaTable.frame.height +  300)
            isExpand = true
        }
    }
    
    // table view will back to normal size by - 300
    @objc func keyboardDisapear(){
        
        if isExpand{
            self.mrdaTable.contentSize = CGSize(width: self.view.frame.width, height: self.mrdaTable.frame.height -  300)
            isExpand = false
        }
    }

    private func setup(){
        self.navigationItem.title = "Medical Record"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(alertView))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(didSaveButtonTapped))
    }
    
    //Function View
    @objc private func alertView(){
        let alert = UIAlertController(title: "Unchanged Changes", message: "You have unsaved change, are you sure you want to cancel?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler:{ action in self.dismissModal() }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // Function to dismiss modal view
    @objc private func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    
    // Function to flow after save // not yet save data
    @objc private func didSaveButtonTapped(){
        let storyboard = UIStoryboard(name: "MRD", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "mrd")

        let navVc = UINavigationController(rootViewController: vc)

        self.present(navVc, animated: false, completion: nil)
        
    }

    
}

extension MRDAViewController: UITableViewDelegate{
    
}
extension MRDAViewController: UITableViewDataSource{
   
    
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
                let cell =  mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Date", placeholder: ViewModel.dataSource[0].date)
                return cell
            default:
                fatalError()
            }
        case 1:
            switch indexPath.row {
            case 0:
                let cell =  mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Veterinarian", placeholder: ViewModel.dataSource[0].veterinarian)
                return cell
                
            case 1:
                let cell =  mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Diagnosis", placeholder: ViewModel.dataSource[0].diagnosis)
                return cell
                
            case 2:
                let cell =  mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Vaccine", placeholder: ViewModel.dataSource[0].vaccine)
                return cell
                
            default:
                fatalError()
            }
        case 2:
            switch indexPath.row {
            case 0:
                let cell =  mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Medicine", placeholder: ViewModel.dataSource[0].medicine)
                return cell
            case 1:
                let cell =  mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Vaccine Type", placeholder: ViewModel.dataSource[0].vaccineType)
                return cell
            case 2:
                let cell =  mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
                 
                cell.configure(title: "Dosage", placeholder: ViewModel.dataSource[0].dosage)
                return cell
                
            default:
                fatalError()
            }
        case 3:
            switch indexPath.row {
            case 0:
                
                let largeCell = mrdaTable.dequeueReusableCell(withIdentifier: LargeTextFieldTableViewCell.identifier, for: indexPath) as! LargeTextFieldTableViewCell
                
                largeCell.configuration(description: ViewModel.dataSource[indexPath.row].description)
                
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

