//
//  MRDViewController.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 29/07/21.
//

import UIKit

class MedicalRecordDetailEditViewController: UIViewController{
    
    
    // MARK: - UI Components Declaration
    @IBOutlet weak var MRDEtable: UITableView!
    
    // MARK: - Variables Declaration
    var dogId: String = ""
    var isExpand: Bool = false
    
    // MARK: - Object Declaration
    var mrdModel: MRDModel?
    let viewModel = MedicalRecordViewModel()
    
    // MARK: App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

       //  disable dismiss modal
        self.isModalInPresentation = true

        setup()

    }
    
    //MARK: - Setup UI Components
    
    private func setup(){
        self.navigationItem.title = language.navTitleMedicalRecord
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: language.cancelButtonTitle, style: .plain, target: self, action: #selector(alertView))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: language.saveButtonTitle, style: .plain, target: self, action: #selector(didSaveButtonTapped))
        
        // Disable dismiss modal
        self.isModalInPresentation = true
        
        // Setup table view delegate and data source
        MRDEtable.delegate = self
        MRDEtable.dataSource = self
        
        
        // Table view heigh adjustment when keyboard showed up
        adjustTableViewHeightWhenKeyboardShowedUp()
        
        // Register XIB table view cell
        MRDEtable.register(MRDTableViewCell.nib(), forCellReuseIdentifier: MRDTableViewCell.identifier)
        MRDEtable.register(DescriptionTextViewCell.nib(), forCellReuseIdentifier: DescriptionTextViewCell.identifier)
        MRDEtable.register(DeleteButton.nib(), forCellReuseIdentifier: DeleteButton.identifier)
        
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
        alertViewDelete(dogId: dogId, mrdId: mrdModel?.id ?? "no data")
        
    }
    
    
    // MARK: - Display Alert
    
    // func to show alert when back button tapped
    @objc private func alertView(){
        let alert = UIAlertController(title: language.alertTitleCancel, message: language.alertMessageCancel, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: language.noTitleCancel, style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: language.yesTitleCancel, style: UIAlertAction.Style.destructive, handler:{ action in
                                        self.dismiss(animated: true, completion: nil) }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // Function to Alert delete
    func alertViewDelete(dogId: String, mrdId: String){
        let alert = UIAlertController(title: language.alertTitleDeleteMedicalRecord, message: language.alertMessageDeleteMedicalRecord, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: language.noTitleCancel, style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: language.yesTitleCancel, style: UIAlertAction.Style.destructive, handler:{ action in self.deleteAction() }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - save button (belum ke save ke database)
    @objc private func didSaveButtonTapped(){
        dismiss(animated: true, completion: nil)

        guard let mrd = mrdModel else{return}
        viewModel.updateData(dogId: dogId, model: mrd )
    }
    
    //Function to cancelaction
    private func deleteAction(){
        
        self.dismiss(animated: true, completion: nil)
     
        viewModel.deleteData(dogId: dogId, mrId: mrdModel?.id ?? "no data")
    }
    
}

