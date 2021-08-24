//
//  ExtensionMRDAView+TextField+TextView.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 11/08/21.
//

import Foundation
import UIKit
// MARK: - Text Field and Text View

extension MedicalRecordDetailAddViewController : UITextFieldDelegate, UITextViewDelegate{
    
    //MARK: - Read data from textView
    func textViewDidChange(_ textView: UITextView) {
        if textView.tag == 6 {
            desc = textView.text
        }
        else{
            desc = "no value"
        }
    }
    
    //MARK: - Read data from text field
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.addTarget(self, action: #selector(valueTextFieldChanged), for: .editingChanged)
        return true
    }
    
    @objc func valueTextFieldChanged(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            date = textField.text ?? "no value"
            
        case 1:
            vet = textField.text ?? "no value"
        case 2:
            vaccineType = textField.text ?? "no value"
        case 3:
            diagnosis = textField.text ?? "no value"
        case 4:
            medicine = textField.text ?? "no value"
        case 5:
            dosage = textField.text ?? "no value"
            
        default:
            print("not yet developed")
        }
    }
}
