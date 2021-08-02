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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dogImage: UIImageView!
    
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
    
    @IBAction func didBackButtonTapped(_ sender: UIBarButtonItem) {
        
        _ = navigationController?.popViewController(animated: true)
        
        
        scrollView.contentSize = CGSize(width: self.view.frame.width - 40, height: self.view.frame.height - 80)
        
        
    }
    
    @IBAction func medicalRecordsPressed(_ sender: UIButton) {
        
        if prepareForMedical.statement(){
            self.navigationController?.pushViewController(prepareForMedical.navigateToMedicalRecords(), animated: true)
            
        }else{
            self.navigationController?.pushViewController(prepareForMedical.navigateToMedicalRecordsEmpty(), animated: true)
        }
        
    }
    
    @IBAction func dogImage(_ sender: UIButton) {
        let vc = UIImagePickerController()
        
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
        
    }
    
    
    func updateUI(){
        navigationItem.largeTitleDisplayMode = .never
        makeRounded()
    }
    
    func makeRounded() {
        
        dogImage.layer.borderWidth = 1
        dogImage.layer.masksToBounds = false
        dogImage.layer.borderColor = UIColor.black.cgColor
        dogImage.layer.cornerRadius = dogImage.frame.height/2
        dogImage.clipsToBounds = true
    }
    
    
    func editButtonLogic(){
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editDogProfileNiel))
        
        
        self.navigationItem.rightBarButtonItem = editButton
        
    }
    
    @objc func editDogProfileNiel(){
        
        print("go to niel")
    }
    
}

extension DogProfileDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            dogImage.image = image
            
            picker.dismiss(animated: true, completion: nil)
        }
        
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
