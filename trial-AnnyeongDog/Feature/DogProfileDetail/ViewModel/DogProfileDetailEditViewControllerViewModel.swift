//
//  DogProfileDetailEditViewControllerViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit

struct DogProfileDetailEditViewCOntrollerViewModel {
    
    func editFirebase(id: String?, Name: String?, dob: String?, gender: String?, breed: String?, weight: String?, color: String?, allergy: String?){
        
        DataManipulation.sharedData.updateDogProfile(with: UserControl.shared.user?.uid ?? "unknown", with: DogsModel(dogID: id, dogName:Name, dateofBirth: dob, gender: gender, breed: breed, weight: weight, color: color, alergen: allergy))
        
    }
}
