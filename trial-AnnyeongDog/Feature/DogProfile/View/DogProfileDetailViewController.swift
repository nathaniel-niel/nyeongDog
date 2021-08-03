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
    
    @IBOutlet weak var dogsTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var allergyTextField: UITextField!
    @IBOutlet weak var medicalRecordsUI: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var dogsDOB: UIDatePicker!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    
    var pickerView = UIPickerView()
    var isExpand = false
    var dogsDateofBirth = ""

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        
        genderTextField.inputView = pickerView
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.3733734488, green: 0.4266925454, blue: 0.6893113852, alpha: 1)
        
        updateUI()
        
        // Move the Content that blocked by the Keyboard
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDissapear), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
    }
    
    
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
        
    
    @IBAction func dogImage(_ sender: UIButton) {
        let vc = UIImagePickerController()
        
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
        
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
    
    func getTextfieldData(){
    
        dogsModel.updateModel(dogsModel.dogsIdGenerator(), dogsTextField.text ?? "" , dogsModel.dateToString(dogsDOB.date), genderTextField.text ?? "" , breedTextField.text ?? "" , weightTextField.text ?? "" , colorTextField.text ?? "" , allergyTextField.text ?? "")
        
    }
    
    //MARK: - Scroll function
    func updateUI(){
        
        scrollView.contentSize = CGSize(width: self.view.frame.width - 40, height: self.view.frame.height - 80)
        
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

// Picker untuk Gender
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
