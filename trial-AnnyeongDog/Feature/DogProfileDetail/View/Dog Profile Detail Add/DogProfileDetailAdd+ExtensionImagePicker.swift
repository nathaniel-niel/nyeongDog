//
//  DogProfileDetailAdd+ExtensionImagePicker.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 30/08/21.
//

import UIKit

extension DogProfileDetailTableView: UIImagePickerControllerDelegate, UINavigationControllerDelegate, CameraButtonDidTap{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        dogsModel.dogPhoto = image
        
        let dogImageCell = dogProfileDetail.DogProfileTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? DogImageCell
        
        guard let saveCell = dogImageCell else { return }
        
        saveCell.dogImage?.image = image
        
        picker.dismiss(animated: true, completion: nil)
        
    }
         
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        return imagePicker
    }
    
    
    func showImagePickerOptions() {
        let alertVC = UIAlertController(title: "Pick a photo", message: "Pick photo from library", preferredStyle: .actionSheet)
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { [weak self] (action) in
            guard let self = self else {
                return
            }
            let libraryImagePicker = self.imagePicker(sourceType: .photoLibrary)
            libraryImagePicker.delegate = self
            self.present(libraryImagePicker, animated: true) {
                
            }
        }
        
        let cancelAction = UIAlertAction(title: language.cancelButtonTitle, style: .cancel, handler: nil)
        
        alertVC.addAction(libraryAction)
        alertVC.addAction(cancelAction)
       
        self.present(alertVC, animated: true, completion: nil)
    }
}
