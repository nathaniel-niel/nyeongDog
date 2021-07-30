//
//  MedicalFiilledTableViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

class MedicalFiilledTableViewCell: UITableViewCell {
    
    @IBOutlet weak var medicineLable: UILabel!
    @IBOutlet weak var viewDalem: UIView!
    
    static let identifier = "cells"
    
    static func nib() -> UINib{
        return UINib(nibName: "MedicalFiilledTableViewCell", bundle: nil)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewDalem.layer.cornerRadius = 5
        viewDalem.layer.borderWidth = 0.2
        viewDalem.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected:  Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
