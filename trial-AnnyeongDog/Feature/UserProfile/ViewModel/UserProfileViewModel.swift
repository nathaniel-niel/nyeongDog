//
//  UserProfileViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 27/08/21.
//

import Foundation
import Firebase

class UserProfileViewModel {
    
    
    //MARK: - Variables Declaration:
    
    var name, email: String?
    
    // Sign Out
    func signOutAccount(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
           
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    // Go to payment method page
    func gotoPaymentMethod(){
        
    }
    
    func getProfileData(completion: @escaping((String, String) ->())){
        name = Firebase.Auth.auth().currentUser?.uid
        email = Firebase.Auth.auth().currentUser?.email
        completion(name ?? "no data",email ?? "no data")
    }
}
