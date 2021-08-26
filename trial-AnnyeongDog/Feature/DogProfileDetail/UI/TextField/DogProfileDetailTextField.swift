//
//  DogProfileDetailTextField.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 19/08/21.
//

import UIKit

protocol addData: AnyObject {
    func addDogName(value: String)
    func addDogType(value: String)
    func addDogWeight(value: String)
    func addDogColor(value: String)
    func addDogAlergy(value: String)
    func addDogDOB()
    func addDogGender()
}


class DogProfileDetailTextField: UITableViewCell {

    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    static let identifier = "textField"
    
    weak var delegate: addData?
   
    static func nib() -> UINib{
        return UINib(nibName: "DogProfileDetailTextField", bundle: nil)
    }
    
    var tagFrom = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.delegate = self
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DogProfileDetailTextField: UITextFieldDelegate{
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch tagFrom {
        case 1:
            delegate?.addDogName(value: textField.text!)
        case 2:
            delegate?.addDogDOB()
        case 3:
            delegate?.addDogGender()
        case 4:
            delegate?.addDogType(value: textField.text!)
        case 5:
            textField.text = "\(textField.text!) Kg"
            delegate?.addDogWeight(value: textField.text!)
        case 6:
            delegate?.addDogColor(value: textField.text!)
        case 7:
            delegate?.addDogAlergy(value: textField.text!)
        default:
            delegate?.addDogName(value: textField.text!)
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
