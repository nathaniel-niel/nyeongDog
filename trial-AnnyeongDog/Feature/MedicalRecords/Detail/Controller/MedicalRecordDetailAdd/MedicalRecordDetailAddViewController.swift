//
//  MRDAViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 30/07/21.
//

import UIKit
import Firebase
import FirebaseAuth

class MedicalRecordDetailAddViewController: UIViewController {
    
    // MARK: - UI Components Declaration
    @IBOutlet weak var mrdaTable: UITableView!
    
    // MARK: Object Declaration
    let helper = Helper()
    var mrdModel: MRDModel?
    
    // MARK: Variables Declaration
    var date: String = ""
    var vet: String = ""
    var diagnosis: String = ""
    var vaccine: String = ""
    var medicine: String = ""
    var vaccineType: String = ""
    var dosage: String = ""
    var desc: String = ""
    var isExpand: Bool = false
    var dogId: String?
   
    
    
    // MARK: App Life Cyc;e
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
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
        mrdaTable.register(MRDTableViewCell.nib(), forCellReuseIdentifier: MRDTableViewCell.identifier)
        mrdaTable.register(DescriptionTextViewCell.nib(), forCellReuseIdentifier: DescriptionTextViewCell.identifier)
        
        // Setup table view delegate and data source
        mrdaTable.delegate = self
        mrdaTable.dataSource = self
    }
    
    
    // MARK: - Table View Height Adjustment

    func adjustTableViewHeightWhenKeyboardShowedUp(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisapear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
   
    
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
    
    
    //MARK: - Display Alert
    
    // function to show alert when back button tapped
    @objc private func alertView(){
        let alert = UIAlertController(title: "Unchanged Changes", message: "You have unsaved change, are you sure you want to cancel?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler: { act in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Action Function
    
    @objc private func didSaveButtonTapped(){
        self.dismiss(animated: true, completion: nil)
        DataManipulation.sharedData.insertDataToMedicalRecord(with: UserControl.shared.user?.uid ?? "unknown", with: dogId ?? "no data", with: MRDModel(id: helper.generateUniqueID(length: 6), date: date, veterinarian: vet, diagnosis: diagnosis, vaccine: vaccine, medicine: medicine, vaccineType: vaccineType, dosage: dosage,description: desc))
    }
}





