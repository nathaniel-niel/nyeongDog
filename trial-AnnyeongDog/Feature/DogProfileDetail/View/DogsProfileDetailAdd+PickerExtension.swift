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
        if pickerView.tag == 2{
           
            stringPickerGender = genderModel.genderArray[row]
            cell.cellText(stringPickerGender)
            
        } else {
            
            let dogMonth = pickerView.selectedRow(inComponent: 2)
            let dogYear = pickerView.selectedRow(inComponent: 0)
            let selectedDogYear = genderModel.dogYear[dogYear]
            let selectedDogMonth = genderModel.dogMonth[dogMonth]
            stringPickerDOB = "\(selectedDogYear) Tahun \(selectedDogMonth) Bulan"
            cell.cellText(stringPickerDOB)
            
            
           
        }
        
    }
    
}

