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
    func insertDogProfile(with userId: String, with dog: DogsModel){

        let object: [String: Any] = [
            "dogId": dog.dogID ?? "no data",
            "dogName": dog.dogName ?? "no data",
            "dateofBirth": dog.dateofBirth ?? "no data",
            "gender": dog.dogID ?? "no data",
            "breed": dog.breed ?? "no data",
            "weight": dog.weight ?? "no data",
            "color": dog.color ?? "no data",
            "alergen": dog.alergen ?? "no data"
        ]
        ref.child("users/\(userId)/dogs/\(dog.dogID ?? 0)").setValue(object)
        
    }
    
    // update Dog Profile data in Firebase
//    func updateDogProfileData(with user: UserModel, with dog: DogProfileModel){
//        ref.child("users").child("\(user.id)").child("dogs").child("\(dog.dogId)").updateChildValues([
//            "dog name": dog.dogName,
//            "DOB": dog.dateOfBirth,
//            "gender": dog.gender,
//            "breed": dog.breed,
//            "weight": dog.weight,
//            "color": dog.color,
//            "alergen": dog.alergen
//        ])
//    }
    func updateDogProfile(with userId: String, with dog: DogsModel){

        let object: [String: Any] = [
            "dogId": dog.dogID ?? "no data",
            "dogName": dog.dogName ?? "no data",
            "dateofBirth": dog.dateofBirth ?? "no data",
            "gender": dog.dogID ?? "no data",
            "breed": dog.breed ?? "no data",
            "weight": dog.weight ?? "no data",
            "color": dog.color ?? "no data",
            "alergen": dog.alergen ?? "no data"
        ]
        ref.child("users/\(userId)/dogs/\(dog.dogID ?? 0)").updateChildValues(object)
        
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
    func fetchMedicalRecordData(with userId: String,
                                with dogID: Int,
                                completion: @escaping ([MRDModel]) -> Void){
        
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
                completion(self.mrdModel)
            }
            else{
                print(Error.self)
            }
        }
    }
    
    // delete data medical record detail
    func deleteDataToMedicalRecord(with userId: String, with dogID: Int, with mrdID: Int ){
        
        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrdID)/").removeValue()
//
//        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrdID)/date").removeValue()
//        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrdID)/diagnosis").removeValue()
//        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrdID)/dosage").removeValue()
//        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrdID)/medicine").removeValue()
//        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrdID)/vaccineType").removeValue()
//        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrdID)/vaccinne").removeValue()
//        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrdID)/vets").removeValue()
    }
    
    //MARK: - delete dog profile
    func deleteDogProfile(with userId: String, with dogID: Int){
        
        ref.child("users/\(userId)/dogs/\(dogID)").removeValue()
}
}
