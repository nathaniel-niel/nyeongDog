//
//  File.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 02/08/21.
//

import Foundation
import Firebase

struct MRDModel {
    var id: Int?
    var date: String?
    var veterinarian: String?
    var diagnosis: String?
    var vaccine: String?
    var medicine: String?
    var vaccineType: String?
    var dosage: String?
    //var description: String = ""
    
//    init(id: Int,date: String, veterinarian: String, diagnosis: String, vaccine: String, medicine: String, vaccineType: String, dosage: String) {
//        self.id = id
//        self.date = date
//        self.veterinarian = veterinarian
//        self .diagnosis = diagnosis
//        self.vaccine = vaccine
//        self.medicine = medicine
//        self.vaccineType = vaccineType
//        self.dosage = dosage
//        //self.description = description
//    }
    
//    init?(snapshot: DataSnapshot) {
//        guard let val = snapshot.value as? [String : AnyObject],
//              let date = val["date"] as? String,
//              let veterinarian = val["vets"] as? String,
//              let diagnosis = val["diagnosis"] as? String,
//              let vaccine = val["vaccine"] as? String,
//              let medicine = val["medicine"] as? String,
//              let vaccineType =  val["vaccineType"] as? String,
//              let dosage = val["dosage"] as? String
//            
//         
//        else {
//          return nil
//        }
//        
//        self.date = date
//        self.veterinarian = veterinarian
//        self.diagnosis = diagnosis
//        self.vaccine = vaccine
//        self.medicine = medicine
//        self.vaccineType = vaccineType
//        self.dosage = dosage
//        
//     
//      }

}
