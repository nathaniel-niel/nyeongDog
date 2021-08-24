//
//  DogProfileDetailAddViewControllerViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 18/08/21.
//

import UIKit

struct DogProfileDetailAddViewControllerViewModel {
    
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        return imagePicker
    }
    
}
