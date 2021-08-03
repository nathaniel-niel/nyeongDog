//
//  UserModel.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 29/07/21.
//

import Foundation
import Firebase

struct UserModel {
    let id: String
    let email: String
    
    init(id: String, email: String) {
        self.id = id
        self.email = email
    }
    
    init(authData: Firebase.User) {
        id = authData.uid
        email = authData.email ?? "no email"
    }
}


