//
//  MedicalRecordsButton.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 24/08/21.
//

import UIKit

protocol medicalRecordPressed: AnyObject {
    func medicalrecordPress()
}

class MedicalRecordsButton: UITableViewCell {
    
    @IBOutlet weak var medicalRecordsButton: UIButton!{
        didSet{
            medicalRecordsButton.setTitle(language.medicalRecordButtonTitleDogProfile, for: .normal)
        }
    }
    
    var delegate: medicalRecordPressed?
    static let identifier = "medicalButton"
    
    static func nib() -> UINib{
        return UINib(nibName: "MedicalRecordsButton", bundle: nil)
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
    
    @IBAction func medicalRecordsPressed(_ sender: UIButton) {
        
        delegate?.medicalrecordPress()
        
    }
}
