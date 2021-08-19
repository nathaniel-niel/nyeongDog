//
//  DogProfileDetailView.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 19/08/21.
//

import UIKit

class DogProfileDetailView: UIView {

    @IBOutlet weak var DogProfileTableView: UITableView!
    
    func setup(){
        
        DogProfileTableView.register(DogProfileDetailTextField.nib(), forCellReuseIdentifier: DogProfileDetailTextField.identifier)
        
        DogProfileTableView.register(DogImageCell.nib(), forCellReuseIdentifier: DogImageCell.identifier)
        
    }
    
}
