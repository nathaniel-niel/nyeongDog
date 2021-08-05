//
//  VetListTableViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 05/08/21.
//

import UIKit

class VetListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vetImage: UIImageView!
    @IBOutlet weak var vetName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pengalamanLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var viewExp: UIView!
    @IBOutlet weak var statusView: UIView!
    
    static let identifier = "cell"
    
    static func nib() -> UINib{
        return UINib(nibName: "VetListTableViewCell", bundle: nil)
        
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // UI Custom
        viewExp.layer.cornerRadius = 10
        viewRating.layer.cornerRadius = 10
        statusView.layer.cornerRadius = statusView.bounds.size.width / 2
        statusView.backgroundColor = UIColor.green
        
        
        // UI View Cell
        viewCell.layer.cornerRadius = 10
        viewCell.layer.borderWidth = 1
        viewCell.layer.borderColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
