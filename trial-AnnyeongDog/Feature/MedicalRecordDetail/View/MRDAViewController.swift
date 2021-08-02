//
//  MRDAViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 30/07/21.
//

import UIKit

class MRDAViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var mrdaTable: UITableView!
    
    let ViewModel = MRDViewModel()
    var text0: String = ""
    var text1: String = ""
    var text2: String = ""
    var text3: String = ""
    var text4: String = ""
    var text5: String = ""
    var text6: String = ""
    var text7: String = ""
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
        //        let storyboard = UIStoryboard(name: "MRD", bundle: nil)
        //
        //        let vc = storyboard.instantiateViewController(identifier: "mrd")
        //
        //        let navVc = UINavigationController(rootViewController: vc)
        //
        //        self.present(navVc, animated: false, completion: nil)
        

        print(text0)
        print(text1)
        print(text2)
        print(text3)
        print(text4)
        print(text5)
        print(text6)
        print(text7)
        
    }
    
    
}

//extension MRDAViewController: UITableViewDelegate{
//
//}
extension MRDAViewController: UITableViewDataSource, UITableViewDelegate{
    
    
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
        let cell = mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
        
        
        
        cell.contenTextField.delegate = self
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.configure(title: "Date", placeholder: ViewModel.dataSource[0].date, tag: 0)
                
            default:
                fatalError()
            }
        case 1:
            switch indexPath.row {
            case 0:
                
                cell.configure(title: "Veterinarian", placeholder: ViewModel.dataSource[0].veterinarian,tag: 1)
                
            case 1:
                
                cell.configure(title: "Diagnosis", placeholder: ViewModel.dataSource[0].diagnosis, tag: 2)
                
            case 2:
                
                cell.configure(title: "Vaccine", placeholder: ViewModel.dataSource[0].vaccine, tag: 3)
                
            default:
                fatalError()
            }
        case 2:
            switch indexPath.row {
            case 0:
                
                
                cell.configure(title: "Medicine", placeholder: ViewModel.dataSource[0].medicine, tag: 4)
                
            case 1:
                
                
                cell.configure(title: "Vaccine Type", placeholder: ViewModel.dataSource[0].vaccineType, tag: 5)
                
            case 2:
                
                
                cell.configure(title: "Dosage", placeholder: ViewModel.dataSource[0].dosage, tag: 6)
                
            default:
                fatalError()
            }
        case 3:
            switch indexPath.row {
            case 0:
                let largeCell = mrdaTable.dequeueReusableCell(withIdentifier: LargeTextFieldTableViewCell.identifier) as! LargeTextFieldTableViewCell
                
                largeCell.largeTextField.delegate = self
                largeCell.configuration(description: ViewModel.dataSource[indexPath.row].description, tag: 7)
                
                return largeCell
            default:
                fatalError()
            }
        default:
            fatalError()
        }
        return cell
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
        return true
    }
    
    @objc func valueChanged(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            text0 = textField.text ?? "no value"
        case 1:
            text1 = textField.text ?? "no value"
        case 2:
            text2 = textField.text ?? "no value"
        case 3:
            text3 = textField.text ?? "no value"
        case 4:
            text4 = textField.text ?? "no value"
        case 5:
            text5 = textField.text ?? "no value"
        case 6:
            text6 = textField.text ?? "no value"
        case 7:
            text7 = textField.text ?? "no value"
//        case 0:
//            text1 = textField.text ?? "no value"
//        case 0:
//            text1 = textField.text ?? "no value"
//        case 0:
//            text1 = textField.text ?? "no value"
//        case 0:
//            text1 = textField.text ?? "no value"
//        case 0:
//            text1 = textField.text ?? "no value"
//        case 0:
//            text1 = textField.text ?? "no value"
        default:
            print("not yet developed")
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

