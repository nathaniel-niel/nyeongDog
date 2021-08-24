//
//  TableViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 24/08/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var medicalRecordsButton: UIButton!
    
    static let identifier = "medicalButton"
    
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        medicalRecordsButton.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
