//
//  PrepareForMedical.swift
//  Annyeong Dog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

struct PrepareForMedical {
    
    
   
    func navigateToMedicalRecords(dogId : String) -> UIViewController {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "MedicalRecordsFilledState", bundle: nil)
        
        let medicalVC = storyBoard.instantiateViewController(withIdentifier: "medicalRecordsFilled") as! MedicalRecordsFilledViewController
        
        medicalVC.dogId =  dogId
        return medicalVC
        
        
    }
    
//    func navigateToMedicalRecordsEmpty() -> UIViewController {
//        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "MedicalRecords", bundle: nil)
//        
//        let medicalEmptyVC = storyBoard.instantiateViewController(withIdentifier: "MedicalRecord") as! MedicalRecordsViewController
//        
//        return medicalEmptyVC
//        
//    }
}
