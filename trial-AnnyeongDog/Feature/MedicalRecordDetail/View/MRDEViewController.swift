//
//  MRDViewController.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 29/07/21.
//

import UIKit

class MRDEViewController: UIViewController/*, deletedelegate*/{

    let ViewModel = MRDViewModel()
    var date: String = ""
    var vet: String = ""
    var diagnosis: String = ""
    var vaccine: String = ""
    var medicine: String = ""
    var vaccineType: String = ""
    var dosage: String = ""
    var dogId: String = ""
    var mrdId: String = ""
    @IBOutlet weak var MRDEtable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(mrdId)
        //MARK: - Disable dismiss modal
        self.isModalInPresentation = true
        
        setup()
        
        //setup delegate
        MRDEtable.delegate = self
        MRDEtable.dataSource = self
        
        //register XIB cell
        MRDEtable.register(MRDTableViewCell.nib(), forCellReuseIdentifier: MRDTableViewCell.identifier)
//        MRDEtable.register(LargeTextFieldTableViewCell.nib(), forCellReuseIdentifier: LargeTextFieldTableViewCell.identifier)
        MRDEtable.register(DeleteButtonTableViewCell.nib(), forCellReuseIdentifier: DeleteButtonTableViewCell.identifier)
        
        //Moving Content that is located under the keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisapear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    var isExpand: Bool = false
    
    // table view will expand size by + 300
    @objc func keyboardAppear(){
        
        if !isExpand{
            self.MRDEtable.contentSize = CGSize(width: self.view.frame.width, height: self.MRDEtable.frame.height +  300)
            isExpand = true
        }
    }
    
    //MARK: - Delete Button
    
    @IBAction func deleteDidTapped(_ sender: Any) {
        alertViewDelete(dogId: dogId, mrdId: mrdId)
        
    }
    
    
    
    // table view will back to normal size by - 300
    @objc func keyboardDisapear(){
        
        if isExpand{
            self.MRDEtable.contentSize = CGSize(width: self.view.frame.width, height: self.MRDEtable.frame.height -  300)
            isExpand = false
        }
    }

    private func setup(){
        self.navigationItem.title = "Medical Record"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(alertView))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(didSaveButtonTapped))
    }
    
    
    // Function to Alert cancel
    @objc private func alertView(dogId: String, mrdId: String){
        let alert = UIAlertController(title: "Unchanged Changes", message: "You have unsaved change, are you sure you want to cancel?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler:{ action in self.cancelaction(dogId: dogId, mrdId: mrdId) }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Function to Alert delete
    func alertViewDelete(dogId: String, mrdId: String){
        let alert = UIAlertController(title: "Delete Dog Profile", message: "Once you delete this, you won't be able to return it. Do you want to proceed?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler:{ action in self.cancelaction(dogId: dogId, mrdId: mrdId) }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - save button (belum ke save ke database)
    @objc private func didSaveButtonTapped(){
        dismiss(animated: true, completion: nil)
        DataManipulation.sharedData.updateDataToMedicalRecord(with: UserControl.shared.user?.uid ?? "unknown", with: dogId, with: MRDModel(id: mrdId, date: date, veterinarian: vet, diagnosis: diagnosis, vaccine: vaccine, medicine: medicine, vaccineType: vaccineType, dosage: dosage))
    }
    
    //Function to cancelaction
    private func cancelaction(dogId: String, mrdId: String){
        
        self.dismiss(animated: true, completion: nil)
        
        DataManipulation.sharedData.deleteDataToMedicalRecord(with: UserControl.shared.user?.uid ?? "unknown", with: dogId, with: mrdId)
        
    }

    
    
}

//MARK: - buat section
extension MRDEViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
//MARK: - buat baris dalam section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
        cell.contenTextField.delegate = self
        cell.contenTextField.autocorrectionType = .no
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.configure(title: "Tanggal", placeholder: date, tag: 0)
                return cell
            default:
                fatalError()
            }
        case 1:
            switch indexPath.row {
            case 0:
                
                cell.configure(title: "Dokter Hewan", placeholder: vet,tag: 1)
                return cell
            case 1:
                
                cell.configure(title: "Tipe Vaksin", placeholder: vaccineType, tag: 2)
                return cell
           
            default:
                fatalError()
            }
        case 2:
            switch indexPath.row {
            case 0:
                cell.configure(title: "Diagnosa", placeholder: diagnosis, tag: 3)
                return cell
            case 1:
                
                
                cell.configure(title: "Obat", placeholder: medicine, tag: 4)
                return cell
            case 2:
                
                
                cell.configure(title: "Dosis", placeholder: dosage, tag: 5)
                return cell
            default:
                fatalError()
            }
//        case 3:
//            switch indexPath.row {
//            case 0:
//                let deletebutton =  MRDEtable.dequeueReusableCell(withIdentifier: DeleteButtonTableViewCell.identifier) as! DeleteButtonTableViewCell
//
//                deletebutton.delegate = self
//
//                return deletebutton
//
//            default:
//                fatalError()
//            }
        default:
            fatalError()
        }
        
        
    }
}
    
    //MARK: - Read data from text field
    extension  MRDEViewController: UITextFieldDelegate{
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
            vaccineType = textField.text ?? "no value"
        case 3:
            diagnosis = textField.text ?? "no value"
        case 4:
            medicine = textField.text ?? "no value"
        case 5:
            dosage = textField.text ?? "no value"

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


//// DeleteButtonDelegate //perlu di benerin alur waktu yes
//extension MRDEViewController: deletedelegate{
//    func deleteAlert() {
//        let alert = UIAlertController(title: "Delete Dog Profile", message: "Once you delete this, you won't be able to return it. Do you want to proceed?", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
//        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler: {action in self.cancelaction()}))
//        self.present(alert, animated: true, completion: nil)
//    }
//}

