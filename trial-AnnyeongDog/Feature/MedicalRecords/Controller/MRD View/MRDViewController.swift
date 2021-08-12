//
//  MRDViewController.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 29/07/21.
//

import UIKit

class MRDViewController: UIViewController{
    
    // MARK: UI Component Declaration
    @IBOutlet weak var table: UITableView!
    
    
    // MARK: Variable declaration
    var date: String = ""
    var vet: String = ""
    var diagnosis: String = ""
    var vaccine: String = ""
    var medicine: String = ""
    var vaccineType: String = ""
    var dosage: String = ""
    var desc: String = ""
    var dogId: String = ""
    var mrdId: String = ""
    
    var mrdModel : [MRDModel] = []
    var isExpand: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
  
        // Setup table view delegate and data source
        table.delegate = self
        table.dataSource = self

    }
    
    // MARK: - Setup UI components
    
    private func setup(){
        // Navigation controller
        self.navigationItem.title = "Medical Record"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didEditButtonTapped))
        
        // Table view heigh adjustment when keyboard showed up
        adjustTableViewHeightWhenKeyboardShowedUp()
        
        // Register XIB table view cell
        registerTableViewCell()
    }
    
    // MARK: - Register Table View Cell
    
    func registerTableViewCell(){
        table.register(MRDTableViewCell.nib(), forCellReuseIdentifier: MRDTableViewCell.identifier)
        table.register(DescriptionTextViewCell.nib(), forCellReuseIdentifier: DescriptionTextViewCell.identifier)
    }
    
    // MARK: - Table View Height Adjustment

    func adjustTableViewHeightWhenKeyboardShowedUp(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisapear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
   
    
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

    
    // MARK: - Navigation Button
    
    // Function to dismiss modal view
    @objc private func backButtonTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    // Function to go show modally edit page
    @objc private func didEditButtonTapped(){
        let storyboard = UIStoryboard(name: "MRDE", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "MRDEStoryboard") as! MRDEViewController
        vc.dogId = dogId
        vc.mrdId = mrdId
        vc.date = date
        vc.vet = vet
        vc.diagnosis = diagnosis
        vc.vaccine = vaccine
        vc.medicine = medicine
        vc.vaccineType = vaccineType
        vc.dosage = dosage
        print(mrdId)
        
        let navVc = UINavigationController(rootViewController: vc)
        
        self.present(navVc, animated: false, completion: nil)
        
    }

}

