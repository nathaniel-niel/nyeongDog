//
//  MRDViewController.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 29/07/21.
//

import UIKit

class MedicalRecordDetailViewcontroller: UIViewController{
    
    // MARK: - UI Component Declaration
    @IBOutlet weak var table: UITableView!
    
    // MARK: - Object Declaration
    var mrdModel : MRDModel?
    
    //MARK: - Variable Declaration
    var isExpand: Bool = false
    var dogId: String?
    
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
  
    }
    
    // MARK: - Setup UI components
    
    private func setup(){
        // Navigation controller
        self.navigationItem.title = "Medical Record"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didEditButtonTapped))
        
        // Setup table view delegate and data source
        table.delegate = self
        table.dataSource = self
        
        // Table view heigh adjustment when keyboard showed up
        adjustTableViewHeightWhenKeyboardShowedUp()
        
        // Register XIB table view cell
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

    
    // MARK: - Action Function
    
    // Function to dismiss modal view
    @objc private func backButtonTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    // Function to go show modally edit page
    @objc private func didEditButtonTapped(){
        let storyboard = UIStoryboard(name: "MedicalRecordDetailEdit", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "MRDEStoryboard") as! MedicalRecordDetailEditViewController
        vc.dogId = dogId ?? "no data"
        vc.mrdModel = mrdModel
        
        let navVc = UINavigationController(rootViewController: vc)
        
        self.present(navVc, animated: false, completion: nil)
        
    }

}

