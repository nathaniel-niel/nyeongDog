//
//  MedicalRecordViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 11/08/21.
//

import Foundation

class MedicalRecordViewModel{
    
    // MARK: - Object Declaration
    private var mrdModel: [MRDModel] = []
  
    // MARK: - Get Current Dog Id
    var currentDogId = CurrentDogProfile.shared.currentDogId
    
  
    // MARK: -  CRUD Function
    
    // Create data
    // TODO: CreateDatafucntion
    
    //Read data
    func fetchData(completion: @escaping ([MRDModel])->()){
        
        DataManipulation.sharedData.fetchMedicalRecordData(with: UserControl.shared.user?.uid ?? "unknown", with: currentDogId ?? "no data") { dataResponse in
            
            self.mrdModel = dataResponse
            
            completion(self.mrdModel)
        }
    }
    
    // Update Data
    func updateData(dogId: String, model: MRDModel){
        DataManipulation.sharedData.updateDataToMedicalRecord(with: UserControl.shared.user?.uid ?? "unknown", with: dogId, with: model)
    }
    
    // Delete Data
    func deleteData(dogId: String, mrId: String){
        DataManipulation.sharedData.deleteDataToMedicalRecord(with: UserControl.shared.user?.uid ?? "unknown", with: dogId, with: mrId)
    }
    
    //Create Data
    func createData(dogId: String, id: String, date: String, vet: String, diagnosis: String, vaccine: String, medicine: String, vaccineType: String, dosage: String, desc: String ){
        DataManipulation.sharedData.insertDataToMedicalRecord(with: UserControl.shared.user?.uid ?? "unknown", with: dogId , with: MRDModel(id: id, date: date, veterinarian: vet, diagnosis: diagnosis, vaccine: vaccine, medicine: medicine, vaccineType: vaccineType, dosage: dosage,description: desc))
    }
    
}
