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
    
    func downdloadingDogPhoto(){
        
             guard let urlString = UserDefaults.standard.value(forKey: "dogPhoto") as? String, let url = URL(string: urlString) else { return }

             URLSession.shared.dataTask(with: url, completionHandler: { data, reponse, error in
                 guard let data = data, error == nil else { return }

                 UIImage(data: data)
             })
       
    }
  
    
    init(dogModel: [DogsModel] = []) {
        self.dogModel = dogModel
    }
}

struct didUserLogin {
    func userDetected(_ user: User?, completion: @escaping() -> Void) -> UIAlertController{
        
        let alert = UIAlertController(title: language.alertTitleSignIn, message: language.alertMessageSignIn, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: language.cancelTitle, style: .destructive, handler: nil))
        
        alert.addAction(UIAlertAction(title: language.singinTitle, style: .default, handler: { action in
            
            completion()
            
        }))
        
        return alert
    }
}
