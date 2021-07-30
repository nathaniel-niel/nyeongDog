//
//  PrepareForMedical.swift
//  Annyeong Dog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

struct PrepareForMedical {
    
    var dummyData = MedicalRecordsDummyData()
    
    func statement() -> Bool{
        if dummyData.arrayDummy.isEmpty{
            return false
        }
        else{
            return true
        }
    }
    
    func navigateToMedicalRecords() -> UIViewController {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "MedicalRecordsFilledState", bundle: nil)
        
        let medicalVC = storyBoard.instantiateViewController(withIdentifier: "medicalRecordsFilled") as! MedicalRecordsFilledViewController
        
        return medicalVC
        
        
    }
    
    func navigateToMedicalRecordsEmpty() -> UIViewController {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "MedicalRecords", bundle: nil)
        
        let medicalEmptyVC = storyBoard.instantiateViewController(withIdentifier: "MedicalRecord") as! MedicalRecordsViewController
        
        return medicalEmptyVC
        
    }
}
