//
//  PrescriptionViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 05/08/21.
//

import UIKit

class PrescriptionViewCell: UITableViewCell {

    @IBOutlet weak var pView: UIView!
    static let identifier = "prescriptionCell"
    static func nib() -> UINib {
        return UINib(nibName: "PrescriptionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
//        pView.layer.cornerRadius = pView.frame.height/10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
