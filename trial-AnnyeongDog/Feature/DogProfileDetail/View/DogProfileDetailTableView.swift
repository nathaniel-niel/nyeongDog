//
//  DogProfileDetailTableVIewViewController.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 19/08/21.
//

import UIKit

class DogProfileDetailTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var dogProfileDetail: DogProfileDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dogProfileDetail.DogProfileTableView.delegate = self
        dogProfileDetail.DogProfileTableView.dataSource = self
        dogProfileDetail.setup()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let dogImageCell = dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogImageCell.identifier, for: indexPath) as! DogImageCell
            return dogImageCell
        
        default:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
           
           
            cell.textFieldLabel.text = "Testing"
            return cell
            
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 219
        default:
            return 92
        }
    }

  

}
