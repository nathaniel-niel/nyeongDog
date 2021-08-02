//
//  File.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 02/08/21.
//

import Foundation

struct MRDModel {
    var date: String = ""
    var veterinarian: String = ""
    var diagnosis: String = ""
    var vaccine: String = ""
    var medicine: String = ""
    var vaccineType: String = ""
    var dosage: String = ""
    var description: String = ""
    
    init(date: String, veterinarian: String, diagnosis: String, vaccine: String, medicine: String, vaccineType: String, dosage: String, description: String) {
        self.date = date
        self.veterinarian = veterinarian
        self .diagnosis = diagnosis
        self.vaccine = vaccine
        self.medicine = medicine
        self.vaccineType = vaccineType
        self.dosage = dosage
        self.description = description
    }
}
