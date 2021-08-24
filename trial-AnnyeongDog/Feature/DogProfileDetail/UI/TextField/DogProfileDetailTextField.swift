//
//  DogProfileDetailTextField.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 19/08/21.
//

import UIKit

class DogProfileDetailTextField: UITableViewCell {

    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    static let identifier = "textField"
    
    static func nib() -> UINib{
        return UINib(nibName: "DogProfileDetailTextField", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellText(_ cellText: String?){
        
        textField.text = cellText
       
    }
    
}
