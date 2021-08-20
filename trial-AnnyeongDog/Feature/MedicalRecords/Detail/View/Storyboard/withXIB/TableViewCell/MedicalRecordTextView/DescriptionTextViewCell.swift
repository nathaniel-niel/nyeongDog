//
//  DescriptionTextViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 04/08/21.
//

import UIKit

class DescriptionTextViewCell: UITableViewCell{

    @IBOutlet weak var descriptionTextView: UITextView!
    static let identifier = "descCell"
    static func nib() -> UINib{
        return UINib(nibName: "DescriptionTextViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configure(description: String){
        descriptionTextView.text = description
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 10
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
