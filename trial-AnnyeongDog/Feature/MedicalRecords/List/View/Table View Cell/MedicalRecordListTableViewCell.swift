//
//  MedicalFiilledTableViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

class MedicalRecordListTableViewCell: UITableViewCell {

    
    
    // MARK: - UI Components Declaration
    @IBOutlet weak var dateLabel: UILabel!{
        didSet{
            dateLabel.text = language.dateMedicalRecord
        }
    }
    @IBOutlet weak var medicineLabel: UILabel!
    @IBOutlet weak var diagnoseLabel: UILabel!
    static let identifier = "cells"
    
    var objectModel: MRDModel? {
        didSet {
            setupCell()
        }
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "MedicalRecordListTableViewCell", bundle: nil)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected:  Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - UI Components Configuration
    
    func setupCell() {
        guard let object = objectModel else { return }
        dateLabel.text = object.date
        medicineLabel.text = object.medicine
        diagnoseLabel.text = object.diagnosis
    }
    
}
