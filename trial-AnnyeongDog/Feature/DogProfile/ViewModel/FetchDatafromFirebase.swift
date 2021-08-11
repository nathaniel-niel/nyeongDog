//
//  FetchDatafromFirebase.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 11/08/21.
//

import UIKit
import Firebase

class FetchDatafromFirebase {
    
    var dogModel: [DogsModel] = []
    
    func fetchDataFirebase(completion: @escaping() -> Void){
        
        DataManipulation.sharedData.fetchDogDataFromFirebase(with: UserControl.shared.user?.uid ?? "unknown") { responseData in
            self.dogModel = responseData
            completion()
            
        }
        
    }
    
    init(dogModel: [DogsModel] = []) {
        self.dogModel = dogModel
    }
}
