//
//  DogProfileDetailAddViewControllerViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 18/08/21.
//

import UIKit

struct DogProfileDetailAddViewControllerViewModel {
    let helper = Helper()
    
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        return imagePicker
    }
    
    func saveDatatoFirebase(dogsName: String, dogDOB: String, dogGender: String, dogBreed: String, dogWeight: String, dogColor: String, dogAllergy: String){
        
        print("fetch firebase")
        
        DataManipulation.sharedData.insertDogProfile(with: UserControl.shared.user?.uid ?? "unknown", with: DogsModel(dogID: helper.generateUniqueID(), dogName: dogsName, dateofBirth: dogDOB, gender: dogGender, breed: dogBreed, weight: dogWeight, color: dogColor, alergen: dogAllergy))
        
        
    }
    
}
