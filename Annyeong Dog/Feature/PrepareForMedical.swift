//
//  PrepareForMedical.swift
//  Annyeong Dog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

struct PrepareForMedical {
    
    func navigateToMedicalRecords() -> MedicalRecordsViewController {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "MedicalRecords", bundle: nil)
        
        let medicalVC = storyBoard.instantiateViewController(withIdentifier: "MedicalRecords") as! MedicalRecordsViewController
        
        return medicalVC
        
        
    }
}
