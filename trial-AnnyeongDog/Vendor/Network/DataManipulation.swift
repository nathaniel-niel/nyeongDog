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
    
    
    // MARK: Singletone
    static let sharedData = DataManipulation()
    
    // MARK: Model Declaration
    var mrdModel : [MRDModel] = []
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
    
    // insert data medical record to firebase
    func insertDataToMedicalRecord(with userId: String, with dogID: Int, with mrd: MRDModel ){
        
        let object: [String: Any] = [
            "date": mrd.date ?? "no data",
            "vets": mrd.veterinarian ?? "no data",
            "diagnosis": mrd.diagnosis ?? "no data",
            "vaccinne": mrd.vaccine ?? "no data",
            "medicine": mrd.medicine ?? "no data",
            "vaccineType": mrd.vaccineType ?? "no data",
            "dosage": mrd.dosage ?? "no data"
        ]
        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrd.id ?? 0)").setValue(object)
        
    }
    
    // update data medicar record to firebase
    func updateDataToMedicalRecord(with userId: String, with dogID: Int, with mrd: MRDModel ){
        
        let object: [String: Any] = [
            "date": mrd.date ?? "no data",
            "vets": mrd.veterinarian ?? "no data",
            "diagnosis": mrd.diagnosis ?? "no data",
            "vaccinne": mrd.vaccine ?? "no data",
            "medicine": mrd.medicine ?? "no data",
            "vaccineType": mrd.vaccineType ?? "no data",
            "dosage": mrd.dosage ?? "no data"
        ]
        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrd.id ?? 0)").updateChildValues(object)
        
    }
    
    
    // retrieve medical record data from firebase
    func fetchMedicalRecordData(with userId: String, with dogID: Int){
        
        // remove all data in model
        mrdModel.removeAll()
        
        
        ref.child("users/\(userId)/dogs/\(dogID)/medical-records").observe(DataEventType.value) { snapshot in
            
            if snapshot.exists(){
                for child in snapshot.children{
                    if let snap = child as? DataSnapshot{
                        guard let val = snap.value as? [String : AnyObject] else { return }
                        
                        self.mrdModel.append(MRDModel(id: 0, date: val["date"] as? String, veterinarian: val["vets"] as? String, diagnosis: val["diagnosis"] as? String , vaccine: val["vaccinne"] as? String, medicine: val["medicine"] as? String, vaccineType: val["vaccineType"] as? String, dosage: val["dosage"] as? String))
                    }
                }
                print(self.mrdModel)
            }
            else{
                print(Error.self)
            }
        }
    }
}
