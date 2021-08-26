//
//  DogProfileListDetailViewControllerViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit
struct DogProfileListDetailViewControllerViewModel {
    
    func medicalRecordPressed() -> MedicalRecordListViewController{
        let storyboard = UIStoryboard(name: "MedicalRecordList", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "medicalRecordsFilled") as! MedicalRecordListViewController
        return vc
    }
}
