//
//  TextDescCell.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 04/08/21.
//

import UIKit

class TextDescCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var descTextField: UITextField!
    
    static let identifier = "descIdentifier"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(descTextField.text)
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
