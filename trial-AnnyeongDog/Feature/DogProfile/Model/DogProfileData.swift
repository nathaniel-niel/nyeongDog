//
//  DogProfileData.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 30/07/21.
//

import Foundation

struct DogProfileData{
   
    let dogName: String
    let DOB: Date
    let gender: String
    let breed: String
    let weight: String
    let color: String
    let allergy: String
    
    let dogID: Int
    
    init(dogName: String, DOB: Date, gender: String, breed: String, weight: String, color: String, allergy: String, dogID: Int) {
        self.dogName = dogName
        self.DOB = DOB
        self.gender = gender
        self.breed = breed
        self.weight = weight
        self.color = color
        self.allergy = allergy
        self.dogID = dogID
    }
    
   
    
}
