//
//  MRDAViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 30/07/21.
//

import UIKit
import Firebase
import FirebaseAuth

class MRDAViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var mrdaTable: UITableView!
    
    let ViewModel = MRDViewModel()
    var date: String = ""
    var vet: String = ""
    var diagnosis: String = ""
    var vaccine: String = ""
    var medicine: String = ""
    var vaccineType: String = ""
    var dosage: String = ""
    //    var text7: String = ""
    var isExpand: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        //MARK: -Setup Delegate
        mrdaTable.delegate = self
        mrdaTable.dataSource = self
        
        //MARK: -Register XIB cell
        mrdaTable.register(MRDTableViewCell.nib(), forCellReuseIdentifier: MRDTableViewCell.identifier)
        mrdaTable.register(LargeTextFieldTableViewCell.nib(), forCellReuseIdentifier: LargeTextFieldTableViewCell.identifier)
        
        //MARK: -Moving Content that is located under the keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisapear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        
    }
    
    
    
    //MARK: -Table view will expand size by + 300
    @objc func keyboardAppear(){
        
        if !isExpand{
            self.mrdaTable.contentSize = CGSize(width: self.view.frame.width, height: self.mrdaTable.frame.height +  300)
            isExpand = true
        }
    }
    
    //MARK: -Table view will back to normal size by - 300
    @objc func keyboardDisapear(){
        
        if isExpand{
            self.mrdaTable.contentSize = CGSize(width: self.view.frame.width, height: self.mrdaTable.frame.height -  300)
            isExpand = false
        }
    }
    
    //MARK: -Setup Navigation Bar
    private func setup(){
        self.navigationItem.title = "Medical Record"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(alertView))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(didSaveButtonTapped))
    }
    
    //MARK: -Display Alert
    @objc private func alertView(){
        let alert = UIAlertController(title: "Unchanged Changes", message: "You have unsaved change, are you sure you want to cancel?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler:{ action in self.dismissModal() }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: -Dismiss Modal
    @objc private func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Save Medical Record
    @objc private func didSaveButtonTapped(){
        let storyboard = UIStoryboard(name: "MRD", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mrd")
        
        let navVc = UINavigationController(rootViewController: vc)
        
        self.present(navVc, animated: false, completion: nil)
        
    
        DataManipulation.sharedData.insertDataToMedicalRecord(with: UserControl.shared.user?.uid ?? "unknown", with: 0, with: MRDModel(id: 0, date: date, veterinarian: vet, diagnosis: diagnosis, vaccine: vaccine, medicine: medicine, vaccineType: vaccineType, dosage: dosage))
        
        
    }
}

extension MRDAViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
        //        case 3:
        //            return 1
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
        cell.contenTextField.delegate = self
        cell.contenTextField.autocorrectionType = .no
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.configure(title: "Tanggal", placeholder: ViewModel.dataSource[0].date, tag: 0)
                return cell
            default:
                fatalError()
            }
        case 1:
            switch indexPath.row {
            case 0:
                
                cell.configure(title: "Dokter Hewan", placeholder: ViewModel.dataSource[0].veterinarian,tag: 1)
                return cell
            case 1:
                
                cell.configure(title: "Tipe Vaksin", placeholder: ViewModel.dataSource[0].diagnosis, tag: 2)
                return cell
           
            default:
                fatalError()
            }
        case 2:
            switch indexPath.row {
            case 0:
                cell.configure(title: "Diagnosa", placeholder: ViewModel.dataSource[0].medicine, tag: 3)
                return cell
            case 1:
                
                
                cell.configure(title: "Obat", placeholder: ViewModel.dataSource[0].vaccineType, tag: 4)
                return cell
            case 2:
                
                
                cell.configure(title: "Dosis", placeholder: ViewModel.dataSource[0].dosage, tag: 5)
                return cell
            default:
                fatalError()
            }

        default:
            fatalError()
        }
        
        
    }
    
    //MARK: - Read data from text field
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.addTarget(self, action: #selector(valueTextFieldChanged), for: .editingChanged)
        return true
    }
    
    @objc func valueTextFieldChanged(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            date = textField.text ?? "no value"
        case 1:
            vet = textField.text ?? "no value"
        case 2:
            diagnosis = textField.text ?? "no value"
        case 3:
            vaccine = textField.text ?? "no value"
        case 4:
            medicine = textField.text ?? "no value"
        case 5:
            vaccineType = textField.text ?? "no value"

        default:
            print("not yet developed")
        }
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Waktu"
        case 1:
            return "Detail"
        case 2:
            return "Riwayat Kesehatan"
        //        case 3:
        //
        //            return "Description"
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

