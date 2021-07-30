//
//  LargeTextFieldTableViewCell.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 29/07/21.
//

import UIKit

class LargeTextFieldTableViewCell: UITableViewCell {

    static let identifier = "largeCell"
    @IBOutlet weak var largeTextField: UITextView!
    
    static func nib() -> UINib{
        return UINib(nibName: "LargeTextFieldTableViewCell", bundle: nil)
        
    }
    
    func configuration(description: String){
        largeTextField.text = description
        largeTextField.layer.borderWidth = 1
        largeTextField.layer.cornerRadius = 10
        largeTextField.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        
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
