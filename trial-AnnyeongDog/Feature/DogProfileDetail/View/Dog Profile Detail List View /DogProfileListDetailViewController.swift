//
//  DogProfileListDetailViewController.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit

class DogProfileListDetailViewController: UIViewController{
    
    @IBOutlet var dogProfileDetailTableView: DogProfileDetailListTableView!
    
    
    var viewModel = DogProfileListDetailViewControllerViewModel()
    //MARK: - Temporary variables
    var id: String?
    var dogName: String?
    var dob: String?
    var gender: String?
    var breed: String?
    var weight: String?
    var color: String?
    var alergen: String?
    var dogPhoto: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: language.editButtonTitle, style: .plain, target: self, action: #selector(editButtonTapped))
        
        dogProfileDetailTableView.dogProfileDetailListTableView.delegate = self
        dogProfileDetailTableView.dogProfileDetailListTableView.dataSource = self
        dogProfileDetailTableView.setup()
        
    }
    
    //MARK: - edit button did tapped
    @objc func editButtonTapped(){
        let storyboard = UIStoryboard(name: "DogProfileDetail", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "xibDogEdit")  as! DogProfileDetailEditVC
        
        vc.id = id
        vc.dogName = dogName
        vc.dob = dob
        vc.gender = gender
        vc.breed = breed
        vc.weight = weight
        vc.color = color
        vc.alergen = alergen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

