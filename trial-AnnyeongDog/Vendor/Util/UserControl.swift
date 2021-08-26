//
//  UserControl.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 30/07/21.
//

import Foundation
import Firebase
import FirebaseAuth

class UserControl {
    
    static let shared = UserControl()
    
    // current user
    var user = FirebaseAuth.Auth.auth().currentUser
    // indexPath
    
    var indexPath: Int = 0
    // check if user is login or not
    func userIsLogin(){
        if FirebaseAuth.Auth.auth().currentUser == nil{
            //go to login page
        }
    }
    
    //sign out
    func signOut(){
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
        }catch let signOutError as NSError{
            print("Erros sign out: $@", signOutError)
        }
    }
    
    
    
}
