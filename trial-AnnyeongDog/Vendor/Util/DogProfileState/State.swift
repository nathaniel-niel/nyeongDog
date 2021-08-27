//
//  DogProfileState.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 11/08/21.
//

import Foundation

struct CurrentDogProfile {
    static var shared  = CurrentDogProfile()
    var currentDogId: String?
    
}

struct vetState{
    static var shared = vetState()
    var currentVetIndex: Int?
}
