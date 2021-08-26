//
//  DogProfileDetailEditVC.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit

class DogProfileDetailEditVC: UIViewController {

    @IBOutlet var dogProfileDetailEditTableView: DogProfileDetailEditView!
    
    //MARK: - Object Declaration
    var genderModel = GenderModel()
    var dogsModel = DogsModel()
    var viewModel = DogProfileDetailEditViewCOntrollerViewModel()
    
    var dogsDOBPicker = UIPickerView()
    var genderPicker = UIPickerView()
    
    var stringPickerGender: String = ""
    var stringPickerDOB: String = ""
    
    
    //MARK: -Temporary variables
    var id: String?
    var dogName: String?
    var dob: String?
    var gender: String?
    var breed: String?
    var weight: String?
    var color: String?
    var alergen: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogProfileDetailEditTableView.dogProfileEditTableView.delegate = self
        
        dogProfileDetailEditTableView.dogProfileEditTableView.dataSource = self
      
        dogProfileDetailEditTableView.setup()
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
            dogProfileDetailEditTableView.dogProfileEditTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        dogProfileDetailEditTableView.dogProfileEditTableView.contentInset = .zero
    }
    
    @objc func fetchToFirebase(){
     
        
        viewModel.editFirebase(id: id, Name: dogName, dob: dob, gender: gender, breed: breed, weight: weight, color: color, allergy: alergen)
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    // MARK: - Back button
    @objc func backButtonTapped(){
        let alert = UIAlertController(title: language.alertTitleCancel, message: language.alertMessageCancel, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: language.noTitleCancel, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: language.yesTitleCancel, style: .destructive,handler: { action in
            
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        self.present(alert, animated: true)
    }

}
