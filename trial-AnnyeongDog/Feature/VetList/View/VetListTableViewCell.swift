//
//  VetListTableViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 05/08/21.
//

import UIKit

class VetListTableViewCell: UITableViewCell {
    
    //MARK : - IBOutlet
    @IBOutlet weak var vetImage: UIImageView!
    @IBOutlet weak var vetName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pengalamanLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!{
        didSet{
            // UI View Cell
            viewCell.layer.cornerRadius = 10
            viewCell.layer.borderWidth = 1
            viewCell.layer.borderColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1).cgColor
        }
    }
    @IBOutlet weak var viewRating: UIView! {
        didSet{
            viewRating.layer.cornerRadius = 6.5
        }
    }
    @IBOutlet weak var viewExp: UIView! {
        didSet{
            viewExp.layer.cornerRadius = 6.5
        }
    }
    @IBOutlet weak var statusView: UIView!{
        didSet{
            statusView.layer.cornerRadius = statusView.bounds.size.width / 2
            statusView.backgroundColor = UIColor.green
        }
    }
    
    var objectModel: VetListModel?{
        didSet{
            setupCell()
        }
    }
  
    static let identifier = "cell"
    
    static func nib() -> UINib{
        return UINib(nibName: "VetListTableViewCell", bundle: nil)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(){
        guard let object = objectModel else { return }
        vetName.text = object.vetName
        priceLabel.text = object.price
        pengalamanLabel.text = object.expYears
        ratingLabel.text = object.rating
        statusView.backgroundColor = object.statusVet
    }
    
    
}
