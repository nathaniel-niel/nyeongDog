//
//  MedicalRecordViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 11/08/21.
//

import Foundation

class MedicalRecordViewModel{
    
    // MARK: - Object Declaration
    var mrdModel: [MRDModel] = []
  
    // MARK: - Get Current Dog Id
    var currentDogId = CurrentDogProfile.shared.currentDogId
    
  
    // MARK: -  Call function Fetching Data from Firebase
    func fetchData(completion: @escaping ([MRDModel])->()){
        
        DataManipulation.sharedData.fetchMedicalRecordData(with: UserControl.shared.user?.uid ?? "unknown", with: currentDogId ?? "no data") { dataResponse in
            
            self.mrdModel = dataResponse
            
            completion(self.mrdModel)
        }
    }
    
}
