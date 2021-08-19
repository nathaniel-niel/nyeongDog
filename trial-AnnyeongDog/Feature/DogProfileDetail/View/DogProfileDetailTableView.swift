//
//  DogProfileDetailTableVIewViewController.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 19/08/21.
//

import UIKit

class DogProfileDetailTableView: UIViewController{
    
    @IBOutlet var dogProfileDetail: DogProfileDetailView!
    
    var viewModel = DogProfileDetailAddViewControllerViewModel()
    var genderModel = GenderModel()
    var dogsModel = DogsModel()
    
    var dogsDOBPicker = UIPickerView()
    var genderPicker = UIPickerView()
    
    var stringPickerGender: String = ""
    var stringPickerDOB: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogProfileDetail.DogProfileTableView.delegate = self
        dogProfileDetail.DogProfileTableView.dataSource = self
        dogProfileDetail.setup()
        uiPickerView()
    }
    
    func uiPickerView(){
        
        dogsDOBPicker.tag = 1
        dogsDOBPicker.delegate = self
        dogsDOBPicker.dataSource = self
        
        
        genderPicker.tag = 2
        genderPicker.delegate = self
        genderPicker.dataSource = self

        
    }
}
