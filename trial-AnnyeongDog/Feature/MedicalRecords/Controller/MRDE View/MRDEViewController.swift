//
//  MRDViewController.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 29/07/21.
//

import UIKit

class MRDEViewController: UIViewController{
    
    
    // MARK: - UI Components Declaration
    @IBOutlet weak var MRDEtable: UITableView!
    
    // MARK: Variables Declaration
    var date: String = ""
    var vet: String = ""
    var diagnosis: String = ""
    var vaccine: String = ""
    var medicine: String = ""
    var vaccineType: String = ""
    var dosage: String = ""
    var dogId: String = ""
    var mrdId: String = ""
    var isExpand: Bool = false
    
    // MARK: App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Disable dismiss modal
        self.isModalInPresentation = true
        
        setup()
        
        // Setup table view delegate and data source
        MRDEtable.delegate = self
        MRDEtable.dataSource = self
        
        
    }
    
    
    //MARK: - Setup UI Components
    
    private func setup(){
        self.navigationItem.title = "Medical Record"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(alertView))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(didSaveButtonTapped))
        
        // Disable dismiss modal
        self.isModalInPresentation = true
        
        // Table view heigh adjustment when keyboard showed up
        adjustTableViewHeightWhenKeyboardShowedUp()
        
        // Register XIB table view cell
        registerTableViewCell()
        
    }
    
    // MARK: - Register Table View Cell
    
    func registerTableViewCell(){
        MRDEtable.register(MRDTableViewCell.nib(), forCellReuseIdentifier: MRDTableViewCell.identifier)
        MRDEtable.register(DescriptionTextViewCell.nib(), forCellReuseIdentifier: DescriptionTextViewCell.identifier)
    }
    
    // MARK: - Table View Height Adjustment
    func adjustTableViewHeightWhenKeyboardShowedUp(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisapear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // table view will expand size by + 300
    @objc func keyboardAppear(){
        
        if !isExpand{
            self.MRDEtable.contentSize = CGSize(width: self.view.frame.width, height: self.MRDEtable.frame.height +  300)
            isExpand = true
        }
    }
    
    // table view will back to normal size by - 300
    @objc func keyboardDisapear(){
        
        if isExpand{
            self.MRDEtable.contentSize = CGSize(width: self.view.frame.width, height: self.MRDEtable.frame.height -  300)
            isExpand = false
        }
    }
    
    //MARK: - Delete Button
    
    @IBAction func deleteDidTapped(_ sender: UIButton) {
        alertViewDelete(dogId: dogId, mrdId: mrdId)
        
    }
    
    
    // MARK: - Display Alert
    @objc private func alertView(){
        let alert = UIAlertController(title: "Unchanged Changes", message: "You have unsaved change, are you sure you want to cancel?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler:{ action in
                                        self.dismiss(animated: true, completion: nil) }))
        
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

