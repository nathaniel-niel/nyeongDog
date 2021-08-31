//
//  DogImageCell.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 19/08/21.
//

import UIKit

protocol CameraButtonDidTap: AnyObject {
    func showImagePickerOptions()
}

class DogImageCell: UITableViewCell{

    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    
    static let identifier = "imageCell"
    
    weak var delegate: CameraButtonDidTap?
    
    static func nib() -> UINib{
        return UINib(nibName: "DogImageCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        makeRounded()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
        
      
        delegate?.showImagePickerOptions()
       
    }
    
    func makeRounded() {
        
        cameraButton.layer.cornerRadius = cameraButton.frame.size.height / 2
        cameraButton.clipsToBounds = true
        
        dogImage.layer.borderWidth = 1
        dogImage.layer.masksToBounds = false
        dogImage.layer.borderColor = UIColor.black.cgColor
        dogImage.layer.cornerRadius = dogImage.frame.height/2
        dogImage.clipsToBounds = true
    }
    
}
