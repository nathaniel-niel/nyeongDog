//
//  DogProfileDetailViewController.swift
//  Annyeong Dog
//
//  Created by Azka Kusuma on 28/07/21.
//

import UIKit

class DogProfileDetailViewController: UIViewController {
    
    var genderModel = GenderModel()
    var prepareForMedical = PrepareForMedical()
    
    @IBOutlet weak var dogsTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var allergyTextField: UITextField!
    @IBOutlet weak var medicalRecordsUI: UIButton!
    
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        
        genderTextField.inputView = pickerView
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.3733734488, green: 0.4266925454, blue: 0.6893113852, alpha: 1)
        
        updateUI()
        
    }
    
    @IBAction func medicalRecordsPressed(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(prepareForMedical.navigateToMedicalRecords(), animated: true)
        
    }
    
    func updateUI(){
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
    }
    
}
