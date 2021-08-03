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
    var dogsModel = DogsModel()
    
    //MARK: - IBConnection to Storyboard
    @IBOutlet weak var dogsTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var allergyTextField: UITextField!
    @IBOutlet weak var medicalRecordsUI: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var dogsDOB: UITextField!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    //MARK: - Object Declaration
    var pickerView = UIPickerView()
    var dobPickerView = UIPickerView()
    var isExpand = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        genderTextField.inputView = pickerView
        dogsDOB.inputView = dobPickerView
        
        updateUI()
        uiPickerView()
        
        
        
        //MARK: - Risen the View that blocked by the Keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDissapear), name:UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardAppear(notification:NSNotification){
        
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }
    
    
    @objc func keyboardDissapear(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    
    //MARK: - Save Button Pressed
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        getTextfieldData()
    }
    
    
    @IBAction func didBackButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Unsaved Changes", message: "You have unsaved changes, are you sure you want to cancel?.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive,handler: { action in
            
            // back to dog profile view
            let storyboard = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil)
            
            let vc = storyboard.instantiateViewController(identifier: "DPDE")
            self.navigationController?.pushViewController(vc, animated: false)
        }))
        self.present(alert, animated: true)
    }
    
    //MARK: - Delete Button on Dog's Profile
    @IBAction func deleteDidTapped(_ sender: UIButton) {
        
        //        if prepareForMedical.statement(){
        //            self.navigationController?.pushViewController(prepareForMedical.navigateToMedicalRecords(), animated: true)
        //
        //        }else{
        //            self.navigationController?.pushViewController(prepareForMedical.navigateToMedicalRecordsEmpty(), animated: true)
        //        }
        let alert = UIAlertController(title: "Hapus Profil Anjing", message: "Setelah anda menghapus profil ini, anda tidak akan dapat mengembalikannya. Apakah anda tetap ingin melanjutkan?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Tidak", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ya", style: .destructive,handler: { action in
            
            // back to dog profile view
            let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
            
            let vc = storyboard.instantiateViewController(identifier: "DogProfileListViewController")
            self.navigationController?.pushViewController(vc, animated: false)
        }))
        self.present(alert, animated: true)
    }
    
    //MARK: - Button to Choose Dog Image
    @IBAction func dogImage(_ sender: UIButton) {
        let vc = UIImagePickerController()
        
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
        
    }
   
    //MARK: - Get user data from Text Field
    func getTextfieldData(){
        
        dogsModel.updateModel(dogsModel.dogsIdGenerator(), dogsTextField.text ?? "" , dogsDOB.text ?? "", genderTextField.text ?? "" , breedTextField.text ?? "" , weightTextField.text ?? "" , colorTextField.text ?? "" , allergyTextField.text ?? "")
        
    }
    
    //MARK: - UpdateUI function
    func updateUI(){
        
        scrollView.contentSize = CGSize(width: self.view.frame.width - 40, height: self.view.frame.height - 80)
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.3733734488, green: 0.4266925454, blue: 0.6893113852, alpha: 1)
        
        makeRounded()
    }
    
    func makeRounded() {
        
        dogImage.layer.borderWidth = 1
        dogImage.layer.masksToBounds = false
        dogImage.layer.borderColor = UIColor.black.cgColor
        dogImage.layer.cornerRadius = dogImage.frame.height/2
        dogImage.clipsToBounds = true
    }
    
    //MARK: - for Picker View function
    func uiPickerView(){
        
        dobPickerView.tag = 1
        pickerView.tag = 2
        
        pickerView.delegate = self
        pickerView.dataSource = self
        dobPickerView.delegate = self
        dobPickerView.dataSource = self
        
    }
    //MARK: - Logic for Edit Button
    func editButtonLogic(){
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editDogProfileNiel))
        
        
        self.navigationItem.rightBarButtonItem = editButton
        
    }
    
    @objc func editDogProfileNiel(){
        
        print("go to niel")
    }
    
}

//MARK: - Image Picker for Dog's Photos
extension DogProfileDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            dogImage.image = image
            
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
    
}

//MARK: - Extension Picker View on Keyboard
extension DogProfileDetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 2 {
            return 1
        }else{
            return 4
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 2 {
            return genderModel.genderArray.count
            
        }else{
            switch component {
            case 0:
                return genderModel.dogYear.count
            case 1:
                return 1
            case 2:
                return genderModel.dogMonth.count
            case 3:
                return 1
            default:
                return 1
                
            }
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 2 {
            return genderModel.genderArray[row]
        }else{
            switch component {
            case 0:
                return genderModel.dogYear[row]
            case 1 :
                return "Tahun"
            case 2:
                return genderModel.dogMonth[row]
            case 3:
                return "Bulan"
            default:
                return genderModel.dogMonth[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 2{
            
            genderTextField.text = genderModel.genderArray[row]
            
        } else {
            
            let dogMonth = pickerView.selectedRow(inComponent: 2)
            let dogYear = pickerView.selectedRow(inComponent: 0)
            let selectedDogYear = genderModel.dogYear[dogYear]
            let selectedDogMonth = genderModel.dogMonth[dogMonth]
            
            dogsDOB.text = "\(selectedDogYear) Tahun \(selectedDogMonth) Bulan"
        }
        
    }
    
}
