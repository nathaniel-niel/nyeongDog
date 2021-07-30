//
//  DogProfileDetailViewController.swift
//  Annyeong Dog
//
//  Created by Azka Kusuma on 28/07/21.
//

import UIKit
import Firebase

class DogProfileDetailViewController: UIViewController {
    
    var genderModel = GenderModel()
    var prepareForMedical = PrepareForMedical()
    
    
    @IBOutlet weak var dogsTextField: UITextField!
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var allergyTextField: UITextField!
    @IBOutlet weak var medicalRecordsUI: UIButton!
    
    
    var pickerView = UIPickerView()
    var genderDogs = ""
    var dogsModel: DogProfileData?
    var helper: Helper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
      
        delegate()
        updateUI()
   }
    
    @IBAction func medicalRecordsPressed(_ sender: UIButton) {
        
        if prepareForMedical.statement(){
            self.navigationController?.pushViewController(prepareForMedical.navigateToMedicalRecords(), animated: true)
            
        }else{
            self.navigationController?.pushViewController(prepareForMedical.navigateToMedicalRecordsEmpty(), animated: true)
        }
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        let currentUser = Firebase.Auth.auth().currentUser
        
        DataManipulation.sharedData.uploadDogsProfileDataToDatabase(with: UserModel(id: currentUser!.uid, email: (currentUser?.email)!), with: dogsModel!)
        }
    
    
    func delegate(){
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        dogsTextField.delegate = self
        genderTextField.delegate = self
        breedTextField.delegate = self
        weightTextField.delegate = self
        colorTextField.delegate = self
        allergyTextField.delegate = self
        
    }
    func updateUI(){
        
        genderTextField.inputView = pickerView
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.3733734488, green: 0.4266925454, blue: 0.6893113852, alpha: 1)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func editButtonLogic(){
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editDogProfileNiel))
        
        
        self.navigationItem.rightBarButtonItem = editButton
        
    }
    
    @objc func editDogProfileNiel(){
        
        print("go to niel")
    }
    
}

extension DogProfileDetailViewController: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
   
        dogsModel = DogProfileData(dogName: dogsTextField.text!, DOB: dateOfBirth.date , gender: genderDogs, breed: breedTextField.text!, weight: weightTextField.text!, color: colorTextField.text!, allergy: allergyTextField.text!, dogID: helper?.dogID() ?? 0)
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
}

// Picker buat Keyboard Gender

extension DogProfileDetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderModel.genderArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderModel.genderArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genderModel.genderArray[row]
        genderDogs = genderModel.genderArray[row]
        
        
    }
    
    
    
}
