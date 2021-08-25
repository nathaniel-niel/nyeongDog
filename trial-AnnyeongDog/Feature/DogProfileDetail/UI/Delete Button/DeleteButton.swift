//
//  DeleteButton.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit

class DeleteButton: UITableViewCell {
    
    static let identifier = "xibDeletebutton"
    
    static func nib() -> UINib{
        return UINib(nibName: "DeleteButton", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteProfilePress(_ sender: UIButton) {
        
    }
}
