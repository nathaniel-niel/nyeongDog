//
//  DogsModel.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 02/08/21.
//

import UIKit
import Firebase

struct DogsModel {
    var dogID: Int?
    var dogName: String?
    var dateofBirth: String?
    var gender: String?
    var breed: String?
    var weight: String?
    var color: String?
    var alergen: String?
    
    
    var dogsModel: DogProfileModel?
    var dogsID = 0
    
    mutating func updateModel(_ dogsId: Int, _ dogName: String, _ dateOfBirth: String, _ gender: String, _ breed: String, _ weight: String, _ color: String, _ alergen: String){
        
        dogsModel = DogProfileModel(dogId: dogsId, dogName: dogName, dateOfBirth: dateOfBirth, gender: gender, breed: breed, weight: weight, color: color, alergen: alergen)
        
        nembakFirebase()
        
    }
    
    func nembakFirebase(){
        
//        let user = Auth.auth().currentUser
//        DataManipulation.sharedData.insertDogProfileData(with: UserModel(id: user!.uid, email: (user?.email)!), with: dogsModel!)
//        print("masok")
        
    }
    
    
    mutating func dogsIdGenerator() -> Int{
        dogsID += 1
        return dogsID
    }
    
    
}
