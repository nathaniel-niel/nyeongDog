//
//  MedicalFiilledTableViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

class MedicalFiilledTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var medicineLabel: UILabel!
    @IBOutlet weak var diagnoseLabel: UILabel!
    static let identifier = "cells"
    
    static func nib() -> UINib{
        return UINib(nibName: "MedicalFiilledTableViewCell", bundle: nil)
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected:  Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure (medicine: String, date: String, diagnose: String){
        dateLabel.text = date
        medicineLabel.text = medicine
        diagnoseLabel.text = diagnose
    }
    
    func buatNovieGithubNgexchekSemuanya(){
        print("hello novie")
    }
    
}
