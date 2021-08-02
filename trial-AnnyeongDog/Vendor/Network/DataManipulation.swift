//
//  DataManipulation.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 29/07/21.
//

import Foundation
import Firebase
import FirebaseDatabase

class DataManipulation {
    static let sharedData = DataManipulation()
    
    // MARK: Firebase configuration
    
    //Connection ke Firebase
    var ref = Database.database(url: "https://trial-annyeongdog-default-rtdb.asia-southeast1.firebasedatabase.app/").reference()
    
    
    // MARK: Function  for user data
    
    //Insert new User to Firebase
    func insertUser(with user : UserModel ) {
        ref.child("users").child(user.id).setValue([
            "email": user.email
        ])
    }
    
    
    // MARK: Function for dog data
    
    
    // insert Dog Profile data to Firebase
    func insertDogProfileData(with user: UserModel, with dog: DogProfileModel){
        ref.child("users").child("\(user.id)").child("dogs").child("\(dog.dogId)").setValue([
            "dog name": dog.dogName,
            "DOB": dog.dateOfBirth,
            "gender": dog.gender,
            "breed": dog.breed,
            "weight": dog.weight,
            "color": dog.color,
            "alergen": dog.alergen
        ])
    }
    
    // update Dog Profile data in Firebase
    func updateDogProfileData(with user: UserModel, with dog: DogProfileModel){
        ref.child("users").child("\(user.id)").child("dogs").child("\(dog.dogId)").updateChildValues([
            "dog name": dog.dogName,
            "DOB": dog.dateOfBirth,
            "gender": dog.gender,
            "breed": dog.breed,
            "weight": dog.weight,
            "color": dog.color,
            "alergen": dog.alergen
        ])
    }
    
    //MARK: Function for Medical Record
    
    func insertDataToMedicalRecord(with user: UserModel, with dog: DogProfileModel, with mrd: MRDModel ){
        
        ref.child("users/\(user.id)/dogs/\(dog.dogId)/medical-records\(mrd.id)").setValue([
            "date": mrd.date,
            "vets": mrd.veterinarian,
            "diagnosis": mrd.diagnosis,
            "vaccinne": mrd.vaccine,
            "medicine": mrd.medicine,
            "vaccineType": mrd.vaccineType,
            "dosage": mrd.dosage
        ])
        
    }
}
