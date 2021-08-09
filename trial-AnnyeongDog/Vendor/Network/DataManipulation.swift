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
    
    
    // MARK: - Singletone
    static let sharedData = DataManipulation()
    
    // MARK: Model Declaration
    var mrdModel : [MRDModel] = []
    var dogModel : [DogsModel] = []
    var vetModel : [VetListModel] = []
    
    // MARK: - Firebase configuration
    
    //Connection ke Firebase
    var ref = Database.database(url: "https://trial-annyeongdog-default-rtdb.asia-southeast1.firebasedatabase.app/").reference()
    
    
    // MARK: - Function  for user data
    
    //Insert new User to Firebase
    func insertUser(with user : UserModel ) {
        ref.child("users").child(user.id).setValue([
            "email": user.email
        ])
    }
    
    // MARK: - Function for vets data
    
    // retrieve vets data from firebase
    func fetchVetsDataFromFirebase(completion: @escaping ([VetListModel]) -> Void){
        // remove all data in vet model
        vetModel.removeAll()
        
        ref.child("vets").observe(DataEventType.value) { snapshot in
            
            if snapshot.exists(){
                for child in snapshot.children{
                    if let snap = child as? DataSnapshot{
                        guard let val = snap.value as? [String : AnyObject] else { return }
                        self.vetModel.append(VetListModel(
                            vetName: val["vetName"] as? String,
                            expYears: val["experience"]  as? String,
                            timeSlot: val["timeSlot"] as? String,
                            clinicName: val["clinic"] as? String,
                            strvNumber: val["STRV"] as? String,
                            rating: val["rating"] as? String,
                            price: val["price"] as? String,
                            alumnus: val["alumnus"] as? String
                        ))
                    }
                }
                completion(self.vetModel)
                print(self.vetModel)
                
            }
            
            else{
                print(Error.self)
            }
        }
    }
    
    
    // MARK: - Function for dog data
    
    
    // insert Dog Profile data to Firebase
    func insertDogProfile(with userId: String, with dog: DogsModel){
        
        let object: [String: Any] = [
            "dogId": dog.dogID ?? "no data",
            "dogName": dog.dogName ?? "no data",
            "dateofBirth": dog.dateofBirth ?? "no data",
            "gender": dog.gender ?? "no data",
            "breed": dog.breed ?? "no data",
            "weight": dog.weight ?? "no data",
            "color": dog.color ?? "no data",
            "alergen": dog.alergen ?? "no data"
        ]
        ref.child("users/\(userId)/dogs/\(dog.dogID ?? "no data")").setValue(object)
        
    }
    
    //update dog profile data in Firebase
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
        ref.child("users/\(userId)/dogs/\(dog.dogID ?? "no data")").updateChildValues(object)
        
    }
    
    //retrieve dog profile data from Firebase
    func fetchDogDataFromFirebase(with userId: String, completion: @escaping ([DogsModel]) -> Void){
        
        //remove all data
        dogModel = []
        
        ref.child("users/\(userId)/dogs").observe(DataEventType.value) { snapshot in
            if snapshot.exists(){
                for child in snapshot.children{
                    if let snap = child as? DataSnapshot{
                        guard let val = snap.value as? [String : AnyObject] else { return }
                        
                        self.dogModel.append(DogsModel(
                                                dogID: val["dogId"] as? String,
                                                dogName: val["dogName"] as? String,
                                                dateofBirth: val["dateofBirth"] as? String,
                                                gender: val["gender"] as? String,
                                                breed: val["breed"] as? String,
                                                weight: val["weight"] as? String,
                                                color: val["color"] as? String,
                                                alergen: val["alergen"] as? String))
                    }
                }
                print(self.dogModel.count)
                completion(self.dogModel)
            }
            else{
                print(Error.self)
            }
            self.dogModel = []
        }
        
        
    }
    
    
    //MARK: - Function for Medical Record
    
    // insert data medical record to firebase
    func insertDataToMedicalRecord(with userId: String, with dogID: String, with mrd: MRDModel ){
        
        let object: [String: Any] = [
            "mrdId": mrd.id ?? "no data",
            "date": mrd.date ?? "no data",
            "vets": mrd.veterinarian ?? "no data",
            "diagnosis": mrd.diagnosis ?? "no data",
            "vaccinne": mrd.vaccine ?? "no data",
            "medicine": mrd.medicine ?? "no data",
            "vaccineType": mrd.vaccineType ?? "no data",
            "dosage": mrd.dosage ?? "no data",
            "description": mrd.description
        ]
        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrd.id ?? "no data")").setValue(object)
        
    }
    
    // update data medicar record to firebase
    func updateDataToMedicalRecord(with userId: String, with dogID: String, with mrd: MRDModel ){
        
        let object: [String: Any] = [
            "date": mrd.date ?? "no data",
            "vets": mrd.veterinarian ?? "no data",
            "diagnosis": mrd.diagnosis ?? "no data",
            "vaccinne": mrd.vaccine ?? "no data",
            "medicine": mrd.medicine ?? "no data",
            "vaccineType": mrd.vaccineType ?? "no data",
            "dosage": mrd.dosage ?? "no data",
            "description": mrd.description
        ]
        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrd.id ?? "no data")").updateChildValues(object)
        
    }
    
    
    // retrieve medical record data from firebase
    func fetchMedicalRecordData(with userId: String,
                                with dogID: String,
                                completion: @escaping ([MRDModel]) -> Void){

 

        ref.child("users/\(userId)/dogs/\(dogID)/medical-records").observe(DataEventType.value) { snapshot in

            if snapshot.exists(){
                for child in snapshot.children{
                    if let snap = child as? DataSnapshot{
                        guard let val = snap.value as? [String : AnyObject] else { return }

                        self.mrdModel.append(MRDModel(
                            id: val["mrdId"] as? String,
                            date: val["date"] as? String,
                            veterinarian: val["vets"] as? String,
                            diagnosis: val["diagnosis"] as? String,
                            vaccine: val["vaccinne"] as? String,
                            medicine: val["medicine"] as? String,
                            vaccineType: val["vaccineType"] as? String,
                            dosage: val["dosage"] as? String,
                            description: val["description"] as? String ?? "no value"
                        ))
                    }
                }
                print(self.mrdModel.count)
                completion(self.mrdModel)
            }
            else{

                print(Error.self)
            }
            self.mrdModel.removeAll()
        }
    }
    
    // delete data medical record detail
    func deleteDataToMedicalRecord(with userId: String, with dogID: String, with mrdID: String ){
        
        ref.child("users/\(userId)/dogs/\(dogID)/medical-records/\(mrdID)/").removeValue()
      
    }
    
    //MARK: - delete dog profile
    func deleteDogProfile(with userId: String, with dogID: String){
        
        ref.child("users/\(userId)/dogs/\(dogID)").removeValue()
    }
    
}
