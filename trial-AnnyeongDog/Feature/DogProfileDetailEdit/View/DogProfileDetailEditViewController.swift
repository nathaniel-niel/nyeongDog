//
//  DogProfileDetailEditViewController.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 30/07/21.
//

import UIKit

class DogProfileDetailEditViewController: UIViewController {
    
    
    //MARK: UI Components Declaration
    @IBOutlet weak var dogsTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var allergyTextField: UITextField!
    
    
    // MARK: Object Declaration
    var genderModel = GenderModel()
    var prepareForMedical = PrepareForMedical()
    var pickerView = UIPickerView()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        
        genderTextField.inputView = pickerView
        
        print("testing 1234")
        
        navigationItem.largeTitleDisplayMode = .never
        setup()
        
        
    }
    
    // MARK: Functions
    
    func setup(){
        self.navigationItem.title = "Dog Profile"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
    }
    
    @objc func backButtonTapped(){
        let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "DogProfileListViewController")
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    @objc func editButtonTapped(){
        let storyboard = UIStoryboard(name: "DogProfileDetail", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "DogProfileDetail")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func MedicalRecordButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MedicalRecordsFilledState", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "medicalRecordsFilled")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


    
    
    

// Picker buat Keyboard Gender

extension DogProfileDetailEditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
    }
    
}
