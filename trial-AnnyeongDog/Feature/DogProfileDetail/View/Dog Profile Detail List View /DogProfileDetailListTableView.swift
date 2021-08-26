//
//  DogProfileDetailListTableView.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit

class DogProfileDetailListTableView: UIView {

    @IBOutlet weak var dogProfileDetailListTableView: UITableView!
    
    
    func setup(){
        
        dogProfileDetailListTableView.register(DogProfileDetailTextField.nib(), forCellReuseIdentifier: DogProfileDetailTextField.identifier)
        
        dogProfileDetailListTableView.register(DogImageCell.nib(), forCellReuseIdentifier: DogImageCell.identifier)
        
        dogProfileDetailListTableView.register(MedicalRecordsButton.nib(), forCellReuseIdentifier: MedicalRecordsButton.identifier)
        
        dogProfileDetailListTableView.separatorColor = .clear
        
    }
    
}
