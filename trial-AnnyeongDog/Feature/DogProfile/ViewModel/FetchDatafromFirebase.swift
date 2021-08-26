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
        
        //MARK: if user hasn't signed in
//        if StorageManager.shared.isNewUser() == true {
//
//        } else {
            DataManipulation.sharedData.fetchDogDataFromFirebase(with: UserControl.shared.user?.uid ?? "unknown") { responseData in
                self.dogModel = responseData
                completion()
                
            }
//        }
        
    }
    
    init(dogModel: [DogsModel] = []) {
        self.dogModel = dogModel
    }
}

struct didUserLogin {
    func userDetected(_ user: User?, completion: @escaping() -> Void) -> UIAlertController{
        
        let alert = UIAlertController(title: "Sign in to continue", message: "To proceed, you need to have an account", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Sign In", style: .default, handler: { action in
            
            completion()
            
        }))
        
        return alert
    }
}
