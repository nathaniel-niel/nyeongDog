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
        
        
        setup()
        
        
    }
    
    // MARK: Functions
    
    func setup(){
        self.navigationItem.title = "Dog Profile"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc func backButtonTapped(){
        let alert = UIAlertController(title: "Unsaved Changes", message: "You have unsaved changes, are you sure you want to cancel?.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive,handler: { action in
            
            // back to dog profile view
            let storyboard = UIStoryboard(name: "Storyboard_name", bundle: nil)
            
            let vc = storyboard.instantiateViewController(identifier: "Storyboard_Identifier")
            self.navigationController?.popToViewController(vc, animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    
    @objc func saveButtonTapped(){
        
        //call function to update data to firebase from class DatabaseManager
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
