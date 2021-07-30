//
//  UserControl.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 30/07/21.
//

import Foundation
import Foundation
import Firebase

class UserControl {
    
    // check if user is login or not
    func userIsLogin(){
        if Firebase.Auth.auth().currentUser == nil{
            //go to login page
        }
    }
    
}
