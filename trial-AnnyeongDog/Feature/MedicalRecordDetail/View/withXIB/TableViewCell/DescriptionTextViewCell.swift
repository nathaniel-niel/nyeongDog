//
//  DescriptionTextViewCell.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 04/08/21.
//

import UIKit

class DescriptionTextViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var descriptionTextView: UITextView!
    static let identifier = "descCell"
    static func nib() -> UINib{
        return UINib(nibName: "DescriptionTextViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configure(description: String){
        descriptionTextView.text = description
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func textViewDidEndEditing(_ textView: UITextView) {
//       print(descriptionTextView.text)
//    }
    
//    func textViewDidChangeSelection(_ textView: UITextView) {
//        print(descriptionTextView.text)
//    }
    
//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//        return true
//        print(descriptionTextView.text)
//    }

}
