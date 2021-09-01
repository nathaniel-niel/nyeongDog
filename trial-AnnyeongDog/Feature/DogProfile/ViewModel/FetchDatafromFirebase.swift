//
//  FetchDatafromFirebase.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 11/08/21.
//

import UIKit
import Firebase

class FetchDatafromFirebase { // siapa ygn manggil dia
 
    var dogModel: [DogsModel] = []
    var dogPhotoModel: DogPhoto?
    
    init(dogModel: [DogsModel]) {
        self.dogModel = dogModel

    }
    
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
    
    func downdloadingDogPhoto(completion: @escaping (UIImage) -> Void){
        
        guard let urlString = UserDefaults.standard.value(forKey: "dogPhoto") as? String, let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
           
            if let imageDownloaded = UIImage(data: data) {
                completion(imageDownloaded)
            }
        })
         task.resume()
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
