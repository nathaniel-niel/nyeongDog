//
//  DogProfileDetailEditView.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit

class DogProfileDetailEditView: UIView {

    @IBOutlet weak var dogProfileEditTableView: UITableView!
    
    func setup(){
        
        dogProfileEditTableView.register(DogProfileDetailTextField.nib(), forCellReuseIdentifier: DogProfileDetailTextField.identifier)
        
        dogProfileEditTableView.register(DogImageCell.nib(), forCellReuseIdentifier: DogImageCell.identifier)
        
        dogProfileEditTableView.register(DeleteButton.nib(), forCellReuseIdentifier: DeleteButton.identifier)
        
        dogProfileEditTableView.separatorColor = .clear
        
        dogProfileEditTableView.allowsSelection = false
        
        
    }
}
