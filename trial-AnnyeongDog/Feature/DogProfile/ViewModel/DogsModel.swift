//
//  DogsModel.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 02/08/21.
//

import UIKit
import Firebase

struct DogsModel {
    
    var dogsModel: DogProfileModel?
    
    mutating func updateModel(_ dogsId: Int, _ dogName: String, _ dateOfBirth: String, _ gender: String, _ breed: String, _ weight: String, _ color: String, _ alergen: String){
        
        dogsModel = DogProfileModel(dogId: dogsId, dogName: dogName, dateOfBirth: dateOfBirth, gender: gender, breed: breed, weight: weight, color: color, alergen: alergen)
        
        nembakFirebase()
        
    }
    
    func nembakFirebase(){
        
        let user = Auth.auth().currentUser
        DataManipulation.sharedData.insertDogProfileData(with: UserModel(id: user!.uid, email: (user?.email)!), with: dogsModel!)
        print("masok")
        
    }
    
    func dateToString(_ dob: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/YY"
        
        let dateFormate = dateFormatter.string(from: dob)
        print(dateFormate)
        return dateFormate
    }
    
   
}
