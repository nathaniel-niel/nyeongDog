//
//  GenderModel.swift
//  Annyeong Dog
//
//  Created by Azka Kusuma on 28/07/21.
//

import Foundation

struct GenderModel {
    
    let genderArray: [String] = ["Male", "Female"]
    let dogYear = (0...49).map(String.init)
    let dogMonth = (0...12).map(String.init)
}

struct SelectedGenderModel {
    let value: String
}
