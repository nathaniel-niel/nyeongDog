//
//  UserModel.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 29/07/21.
//

import Foundation

struct UserModel {
    var id: String = ""
    var email: String = ""
    
    init(id: String, email: String) {
        self.id = id
        self.email = email
    }
}


