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
        
    var dogName = ""
    var dogType = ""
    var dogWeight = ""
    var dogColor = ""
    var dogAlergy = ""
    var dogDOb = ""
    var dogGender = ""
    var dogPhoto: UIImage?
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: language.saveButtonTitle, style: .plain, target: self, action: #selector( fetchToFirebase))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
    
     
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            dogProfileDetail.DogProfileTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        dogProfileDetail.DogProfileTableView.contentInset = .zero
    }
    
    @objc func fetchToFirebase(){
        
        guard let saveDogPhoto = dogPhoto else { return }
        
        viewModel.saveDatatoFirebase(dogsName: dogName, dogDOB: dogDOb,dogGender: dogGender, dogBreed: dogType, dogWeight: dogWeight, dogColor: dogColor, dogAllergy: dogAlergy, photo: saveDogPhoto)
        
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // MARK: - Back button
    @objc func backButtonTapped(){
        let alert = UIAlertController(title:language.alertTitleCancel, message: language.alertMessageCancel, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: language.noTitleCancel, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: language.yesTitleCancel, style: .destructive,handler: { action in
            
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        self.present(alert, animated: true)
    }
    
}
