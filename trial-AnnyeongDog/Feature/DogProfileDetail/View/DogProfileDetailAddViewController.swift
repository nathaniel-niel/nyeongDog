//
//  DogProfileDetailAddViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 03/08/21.
//

import UIKit
import Firebase

class DogProfileDetailAddViewController: UIViewController,  UINavigationControllerDelegate{
    
    //MARK: UI Components Declaration
    @IBOutlet weak var dogsTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var allergyTextField: UITextField!
    @IBOutlet weak var dogsDOB: UITextField!
    
    // MARK: Object Declaration
    var genderModel = GenderModel()
    var prepareForMedical = PrepareForMedical()
    var dogsModel = DogsModel()
    var viewModel = DogProfileDetailAddViewControllerViewModel()
    var pickerView = UIPickerView()
    var dobPickerView = UIPickerView()
    let helper = Helper()
    
    lazy var textfields:[UITextField] = [dogsTextField, genderTextField, breedTextField, weightTextField, colorTextField, allergyTextField]
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        uiPickerView()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: -Image Picker
    @IBAction func didTapImageButton(_ sender: Any) {
        showImagePickerOptions()
    }
    

    
    //MARK: -Add delegate to textfield
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
        guard let dogTextField = textfields[0].text, dogTextField != "" else {
            print("dogTextField is empty")
            return
        }
        
        guard let genderTextField = textfields[1].text, genderTextField != "" else {
            print("genderTextField is empty")
            return
        }
        
        guard let breedTextField = textfields[2].text, breedTextField != "" else {
            print("breedTextField is empty")
            return
        }
        
        guard let weightTextField = textfields[3].text, weightTextField != "" else {
            print("weightTextField is empty")
            return
        }
        
        guard let colorTextField = textfields[4].text, colorTextField != "" else {
            print("colorTextField is empty")
            return
        }
        
        guard let allergyTextField = textfields[5].text, allergyTextField != "" else {
            print("allergyTextField is empty")
            return
        }
        
        self.navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    
    // MARK: - Keyboard Function
    @objc func keyboardAppear(notification:NSNotification){
        
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
       
        
    }
    
    
    @objc func keyboardDissapear(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
       
    }
    
    // MARK: Functions to Navigation Bar
    
    func setup(){
        self.navigationItem.title = "Dog Profile"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped))
    }
    
    
    func updateUI(){
        
        // Declaration for validation textfield
        navigationItem.rightBarButtonItem?.isEnabled = false
        for textfield in textfields {
            textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
        
        // UiPickerView Input View
        dogsDOB.inputView = dobPickerView
        genderTextField.inputView = pickerView
        
        // Navigation Controller title
        navigationItem.largeTitleDisplayMode = .never
        
        //MARK: - Risen the View that blocked by the Keyboard
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDissapear), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        
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
    
    //MARK: - for Picker View function
    func uiPickerView(){
        
        dobPickerView.tag = 1
        pickerView.tag = 2
        pickerView.delegate = self
        pickerView.dataSource = self
        dobPickerView.delegate = self
        dobPickerView.dataSource = self
        
    }
    
    // MARK: - Back button
    @objc func backButtonTapped(){
        let alert = UIAlertController(title: "Unsaved Changes", message: "You have unsaved changes, are you sure you want to cancel?.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive,handler: { action in
            
            self.navigationController?.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true)
    }
    
    // MARK: - Save button udah bisa simpen data
    @objc func saveButtonTapped(){
        getTextfieldData()
        if Firebase.Auth.auth().currentUser == nil{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyboard.instantiateViewController(identifier: "Main")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "DogProfileListViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getTextfieldData(){
        
        DataManipulation.sharedData.insertDogProfile(with: UserControl.shared.user?.uid ?? "unknown", with: DogsModel(dogID: helper.generateUniqueID(), dogName: dogsTextField.text, dateofBirth: dogsDOB.text, gender: genderTextField.text, breed: breedTextField.text, weight: weightTextField.text, color: colorTextField.text, alergen: allergyTextField.text))
        
        
    }
}



// MARK: Function for UiPicker on Keyboard ( Both DOB and Gender )

extension DogProfileDetailAddViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
                return "Years"
            case 2:
                return genderModel.dogMonth[row]
            case 3:
                return "Months"
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
            
            dogsDOB.text = "\(selectedDogYear) Years \(selectedDogMonth) Months"
        }
        
    }
    
}

//MARK: Dog Image Picker Extension
extension DogProfileDetailAddViewController: UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        self.dogImage.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Image Picker Alert
    func showImagePickerOptions() {
        let alertVC = UIAlertController(title: "Pick a photo", message: "Pick photo from library", preferredStyle: .actionSheet)
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { [weak self] (action) in
            guard let self = self else {
                return
            }
            let libraryImagePicker = self.viewModel.imagePicker(sourceType: .photoLibrary)
            libraryImagePicker.delegate = self
            self.present(libraryImagePicker, animated: true) {
                
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertVC.addAction(libraryAction)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
