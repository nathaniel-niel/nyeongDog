//
//  PaymentUIVIew.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 26/08/21.
//

import UIKit

class PaymentUIVIew: UIView {


    // MARK: - UI Components Declaration
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var vetName: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var totalPayment: UILabel!
    @IBOutlet weak var consultationCharge: UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var vetImageProfile: UIImageView!
    
    
    
    
    func configureUIButton(){
        
        payButton.layer.cornerRadius = 15
    }
    
    
}

