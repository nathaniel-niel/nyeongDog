//
//  ExtensionMRDEView+TextField+TextView.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 11/08/21.
//

import Foundation
import UIKit

extension  MedicalRecordDetailEditViewController: UITextFieldDelegate, UITextViewDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.addTarget(self, action: #selector(valueTextFieldChanged), for: .editingChanged)
        return true
    }
    
    @objc func valueTextFieldChanged(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            mrdModel?.date = textField.text ?? "no value"
        case 1:
            mrdModel?.veterinarian = textField.text ?? "no value"
        case 2:
            mrdModel?.vaccineType = textField.text ?? "no value"
        case 3:
            mrdModel?.diagnosis = textField.text ?? "no value"
        case 4:
            mrdModel?.medicine = textField.text ?? "no value"
        case 5:
            mrdModel?.dosage = textField.text ?? "no value"
            
        default:
            print("not yet developed")
        }
    }
    //MARK: - Read data from textView
    func textViewDidChange(_ textView: UITextView) {
        if textView.tag == 6 {
            mrdModel?.description = textView.text
        }
        else{
            mrdModel?.description  = "no value"
        }
    }
    
   
    
}
