//
//  UIConfiguration.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 12/08/21.
//

import Foundation
import UIKit

extension UIViewController{
    
    //MARK: - Generic
    
    // rounded image view
    func roundedImageVIew(image: UIImageView){
//        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
//        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
}
