//
//  DogImageCell.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 19/08/21.
//

import UIKit

class DogImageCell: UITableViewCell {
    
    static let identifier = "imageCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "DogImageCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
