//
//  DeleteButtonTableViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 29/07/21.
//

import UIKit

protocol deletedelegate {
    func deleteAlert()
    
}

class DeleteButtonTableViewCell: UITableViewCell {
    
    var delegate: deletedelegate?
    
    static let identifier = "deletebutton"
    
    @IBOutlet weak var deleteButton: UIButton!
    
    static func nib() -> UINib{
        return UINib(nibName: "DeleteButtonTableViewCell", bundle: nil)
        
    }
    
    @IBAction func deleteButtonDidTapped(_ sender: Any) {
        delegate?.deleteAlert()
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
