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
    
    // initialize user
    var user = FirebaseAuth.Auth.auth().currentUser
    
    // check if user is login or not
    func userIsLogin(){
        if FirebaseAuth.Auth.auth().currentUser == nil{
            //go to login page
        }
    }
    
    
    
}
