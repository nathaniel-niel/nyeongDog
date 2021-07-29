//
//  PrepareForMedical.swift
//  Annyeong Dog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

struct PrepareForMedical {
    
    func navigateToMedicalRecords() -> UIViewController {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "MedicalRecordsFilledState", bundle: nil)
        
        let medicalVC = storyBoard.instantiateViewController(withIdentifier: "medicalRecordsFilled") as! MedicalRecordsFilledViewController
        
        return medicalVC
        
        
    }
    
}
