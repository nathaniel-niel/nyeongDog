//
//  DataManipulation.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 29/07/21.
//

import Foundation
import Firebase

class DataManipulation {
    static let sharedData = DataManipulation()
    //Connection ke Firebase
    var ref = Database.database(url: "https://trial-annyeongdog-default-rtdb.asia-southeast1.firebasedatabase.app/").reference()
    
    
    
    func insertUser(with user : UserModel ) {
        ref.child("users").setValue([
            "id": user.id,
            "email": user.email
        ])
    }
    
    func uploadDogsProfileDataToDatabase(with user: UserModel, with DogProfile: DogProfileData){
        
        ref.child("users").child(user.id).child("dog").setValue([
            "dogID" : DogProfile.dogID,
            "dog name": DogProfile.dogName
            
        ])
        
    }
}
