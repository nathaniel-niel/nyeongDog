//
//  DogsProfileDetailAdd+PickerExtension.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 19/08/21.
//

import UIKit

extension DogProfileDetailTableView: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
            dogProfileDetail.DogProfileTableView.reloadRows(at: [IndexPath(row: 3, section: 0)], with: .none)
           // cell.textField.text = stringPickerGender
            
            
        } else {
            
            let dogMonth = pickerView.selectedRow(inComponent: 2)
            let dogYear = pickerView.selectedRow(inComponent: 0)
            let selectedDogYear = genderModel.dogYear[dogYear]
            let selectedDogMonth = genderModel.dogMonth[dogMonth]
            stringPickerDOB = "\(selectedDogYear) Tahun \(selectedDogMonth) Bulan"
            
            dogProfileDetail.DogProfileTableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .none)
//            cell.textField.text = stringPickerDOB
            
          }
        
    }
    
}


extension DogProfileDetailTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let dogImageCell = dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogImageCell.identifier, for: indexPath) as! DogImageCell
            return dogImageCell
            
            
        case 1:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Nama Anjing"
            return cell
            
        case 2:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            cell.textField.inputView = dogsDOBPicker
            cell.textField.text = stringPickerDOB
            
            cell.textFieldLabel.text = "Usia"
            return cell
            
        case 3:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
           
            cell.textField.inputView = genderPicker
            
            //TODO -> Listener, Pickernya masih belum mau connect ke TextField
            
            cell.textField.text = stringPickerGender
           
            cell.textFieldLabel.text = "Jenis Kelamin"
            return cell
            
        case 4:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Jenis Anjing"
            return cell
            
        case 5:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            cell.textFieldLabel.text = "Berat Badan"
            return cell
            
        case 6:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Warna"
            return cell
            
        default:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Alergi"
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 219
        default:
            return 86
        }
    }
    
    
    
}


