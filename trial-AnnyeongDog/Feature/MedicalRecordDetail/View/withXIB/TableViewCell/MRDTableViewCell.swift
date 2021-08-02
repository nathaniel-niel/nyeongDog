//
//  MRDTableViewCell.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 29/07/21.
//

import UIKit

class MRDTableViewCell: UITableViewCell {

    static let identifier = "cell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MRDTableViewCell", bundle: nil)
        
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contenTextField: UITextField!
    
    func configure(title: String, placeholder: String, tag: Int){
        titleLabel.text = title
        contenTextField.placeholder = placeholder
        contenTextField.borderStyle = .none
        contenTextField.tag = tag
    }
    
    func setValue(value: String){
        contenTextField.text = value
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
