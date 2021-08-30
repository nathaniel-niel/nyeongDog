//
//  WhoConsultingCollectionViewCell.swift
//  collectionView
//
//  Created by Pieter Yonathan on 26/08/21.
//

import UIKit

class WhoConsultingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dogPhotoView: UIView!{
        didSet{
            dogPhotoView.layer.cornerRadius = 10
            dogPhotoView.backgroundColor = .gray
        }
    }
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var dogImage: UIImageView!{
        didSet{
            dogImage.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var dogName: UILabel!
    
    static let identifier = "cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage, nameDog: String){
        dogImage.image = image
        dogName.text = nameDog
    }

    static func nib() -> UINib{
        return UINib(nibName: "WhoConsultingCollectionViewCell", bundle: nil)
    }
}
