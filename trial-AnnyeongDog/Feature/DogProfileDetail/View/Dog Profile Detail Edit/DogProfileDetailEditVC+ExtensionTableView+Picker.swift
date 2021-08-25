//
//  DogProfileDetailEditVC+ExtensionTableView+Picker.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit
extension DogProfileDetailEditVC: UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource{
    
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
        if pickerView.tag == 2 {
            
            stringPickerGender = genderModel.genderArray[row]
            dogProfileDetailEditTableView.dogProfileEditTableView.reloadRows(at: [IndexPath(row: 3, section: 0)], with: .none)
            // cell.textField.text = stringPickerGender
            
            
        } else {
            
            let dogMonth = pickerView.selectedRow(inComponent: 2)
            let dogYear = pickerView.selectedRow(inComponent: 0)
            let selectedDogYear = genderModel.dogYear[dogYear]
            let selectedDogMonth = genderModel.dogMonth[dogMonth]
            stringPickerDOB = "\(selectedDogYear) Tahun \(selectedDogMonth) Bulan"
            dogProfileDetailEditTableView.dogProfileEditTableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .none)
            //            cell.textField.text = stringPickerDOB
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let dogImageCell = dogProfileDetailEditTableView.dogProfileEditTableView.dequeueReusableCell(withIdentifier: DogImageCell.identifier, for: indexPath) as! DogImageCell
            return dogImageCell
            
            
        case 1:
            let cell =  dogProfileDetailEditTableView.dogProfileEditTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Nama Anjing"
            cell.tagFrom = 1
            cell.textField.text = dogName
            cell.delegate = self
            return cell
            
        case 2:
            let cell =  dogProfileDetailEditTableView.dogProfileEditTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            cell.textField.inputView = dogsDOBPicker
            cell.textField.text = stringPickerDOB
            
            cell.textFieldLabel.text = "Usia"
            cell.tagFrom = 2
            cell.textField.text = dob
            cell.delegate = self
            return cell
            
        case 3:
            let cell =  dogProfileDetailEditTableView.dogProfileEditTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textField.inputView = genderPicker
            cell.textField.text = stringPickerGender
            
            cell.textFieldLabel.text = "Jenis Kelamin"
            cell.tagFrom = 3
            cell.textField.text = gender
            cell.delegate = self
            return cell
            
        case 4:
            let cell =  dogProfileDetailEditTableView.dogProfileEditTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Jenis Anjing"
            cell.tagFrom = 4
            cell.textField.text = breed
            cell.delegate = self
            return cell
            
        case 5:
            let cell =  dogProfileDetailEditTableView.dogProfileEditTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            cell.textField.keyboardType = .numberPad
            cell.textFieldLabel.text = "Berat Badan"
            cell.tagFrom = 5
            cell.textField.text = weight
            cell.delegate = self
            return cell
            
        case 6:
            let cell =  dogProfileDetailEditTableView.dogProfileEditTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Warna"
            cell.tagFrom = 6
            cell.textField.text = color
            cell.delegate = self
            return cell
            
        case 7:
            let cell =  dogProfileDetailEditTableView.dogProfileEditTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Alergi"
            cell.tagFrom = 7
            cell.textField.text = alergen
            cell.delegate = self
            return cell
            
        default:
            let cell = dogProfileDetailEditTableView.dogProfileEditTableView.dequeueReusableCell(withIdentifier: DeleteButton.identifier, for: indexPath) as! DeleteButton
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 161
        default:
            return 67
        }
    }
    
    
    
}

extension DogProfileDetailEditVC: addData {
    
    func addDogName(value: String) {
        self.dogName = value
    }
    
    func addDogDOB() {
        self.dob = stringPickerDOB
    }
    
    func addDogGender() {
        self.gender = stringPickerGender
    }
    
    func addDogType(value: String) {
        self.breed = value
    }
    
    func addDogWeight(value: String) {
        self.weight = value
    }
    
    func addDogColor(value: String) {
        self.color = value
    }
    
    func addDogAlergy(value: String) {
        self.alergen = value
    }
    
}
