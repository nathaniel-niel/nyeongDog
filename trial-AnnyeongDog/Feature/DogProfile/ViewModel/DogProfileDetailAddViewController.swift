//
//  DogProfileDetailAddViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 03/08/21.
//

import UIKit

class DogProfileDetailAddViewController: UIViewController {

    //MARK: UI Components Declaration
    @IBOutlet weak var dogsTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var allergyTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // MARK: Object Declaration
    var genderModel = GenderModel()
    var prepareForMedical = PrepareForMedical()
    var pickerView = UIPickerView()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        
        genderTextField.inputView = pickerView
        
        print("testing 1234")
        
        navigationItem.largeTitleDisplayMode = .never
        setup()
        
        
    }
    
    // MARK: Functions to Navigation Bar
    
    func setup(){
        self.navigationItem.title = "Dog Profile"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped))
    }
    
    //MARK: - Scroll function
    func updateUI(){
        
        scrollView.contentSize = CGSize(width: self.view.frame.width - 40, height: self.view.frame.height - 80)
        
        navigationItem.largeTitleDisplayMode = .never
        
        makeRounded()
    }
    
    //MARK: - Dog profile rounded
    func makeRounded() {
        
        dogImage.layer.borderWidth = 1
        dogImage.layer.masksToBounds = false
        dogImage.layer.borderColor = UIColor.black.cgColor
        dogImage.layer.cornerRadius = dogImage.frame.height/2
        dogImage.clipsToBounds = true
    }
    
    // MARK: - Back button
    @objc func backButtonTapped(){
        let alert = UIAlertController(title: "Unsaved Changes", message: "You have unsaved changes, are you sure you want to cancel?.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive,handler: { action in
            
            // back to dog profile view
            let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
            
            let vc = storyboard.instantiateViewController(identifier: "DogProfileListViewController")
            self.navigationController?.pushViewController(vc, animated: false)
        }))
        self.present(alert, animated: true)
    }
    
    // MARK: - Save button (belum bisa simpen data)
    @objc func saveButtonTapped(){
        let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "DogProfileListViewController")
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
//    @IBAction func MedicalRecordButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "MedicalRecordsFilledState", bundle: nil)
//
//        let vc = storyboard.instantiateViewController(identifier: "medicalRecordsFilled")
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}

    

// Picker buat Keyboard Gender

extension DogProfileDetailAddViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
