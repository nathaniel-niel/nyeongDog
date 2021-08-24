//
//  PrepareToMRD.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

struct PrepareToMRD {
    
//    func prepare(dogId: String, mrdId: String, date: String, vet: String, diagnosis: String, vaccine: String, medicine: String, vaccineType: String, dosage: String, desc: String) -> UINavigationController{
//        
//        let storyboard = UIStoryboard(name: "MedicalRecordDetail", bundle: nil)
//        
//        let vc = storyboard.instantiateViewController(identifier: "mrd") as! MedicalRecordDetailViewcontroller
//        vc.dogId = dogId
//        vc.mrdId = mrdId
//        vc.date = date
//        vc.vet = vet
//        vc.diagnosis = diagnosis
//        vc.vaccine = vaccine
//        vc.medicine = medicine
//        vc.vaccineType = vaccineType
//        vc.dosage = dosage
//        vc.desc = desc
//
//        
//        let navVc = UINavigationController(rootViewController: vc)
//        
//        return navVc
//        
//    }
    
    func prepareToAddMRD(dogId:  String) -> UINavigationController {
        let storyboard = UIStoryboard(name: "MedicalRecordDetailAdd", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mrda") as! MedicalRecordDetailAddViewController
        vc.dogId = dogId
        
        let navVc = UINavigationController(rootViewController: vc)
        
        return navVc
    }
}
