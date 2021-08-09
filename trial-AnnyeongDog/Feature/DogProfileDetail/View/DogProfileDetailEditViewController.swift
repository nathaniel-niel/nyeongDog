//
//  DogProfileDetailEditViewController.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 30/07/21.
//

import UIKit

class DogProfileDetailEditViewController: UIViewController {
    
    
    //MARK: -UI Components Declaration
    @IBOutlet weak var dogsTextField: UITextField!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var allergyTextField: UITextField!
    @IBOutlet weak var dogsDOB: UITextField!
    
    //MARK: -Temporary variables
    var id: String?
    var dogName: String?
    var dob: String?
    var gender: String?
    var breed: String?
    var weight: String?
    var color: String?
    var alergen: String?
    
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
        
        
        
        navigationItem.largeTitleDisplayMode = .never
        setup()

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        assignData()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: Functions
    
    func setup(){
        self.navigationItem.title = "Dog Profile"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
    }
    
    //MARK: - back button did tapped
    @objc func backButtonTapped(){
//        let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
//
//        let vc = storyboard.instantiateViewController(identifier: "DogProfileListViewController")
        self.navigationController?.popToRootViewController(animated: true)
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
    
    
    //MARK: - edit buttin did tapped
    @objc func editButtonTapped(){
        let storyboard = UIStoryboard(name: "DogProfileDetail", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "DogProfileDetail")  as! DogProfileDetailViewController
        
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
    
    //MARK: - Assign data
    func assignData(){
        dogsTextField.text = dogName
        genderTextField.text = gender
        breedTextField.text = breed
        weightTextField.text = weight
        colorTextField.text = color
        allergyTextField.text = alergen
        dogsDOB.text = dob
    }
    
    //MARK: - Medical Record Button
    @IBAction func MedicalRecordButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MedicalRecordsFilledState", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "medicalRecordsFilled") as! MedicalRecordsFilledViewController
        
        vc.dogId = id
        
    
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
