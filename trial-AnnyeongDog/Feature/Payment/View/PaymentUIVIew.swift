//
//  PaymentUIVIew.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 26/08/21.
//

import UIKit

class PaymentUIVIew: UIView {


    // MARK: - UI Components Declaration
    @IBOutlet weak var dogNameTitle: UILabel!{
        didSet{
            dogNameTitle.text = language.dogNameLabelPayment
        }
    }
    @IBOutlet weak var experience: UILabel!{
        didSet{
            experience.text = language.experienceLabelPayment
        }
    }
    @IBOutlet weak var totalPriceTitle: UILabel!{
        didSet{
            totalPriceTitle.text = language.totalPriceLabelPayment
        }
    }
    @IBOutlet weak var totalPaymentTitle: UILabel!{
        didSet{
            totalPaymentTitle.text = language.totalPaymentLabelPayment
        }
    }
    @IBOutlet weak var choosePaymentTitle: UILabel!{
        didSet{
            choosePaymentTitle.text = language.choosepaymentLabelPayment
        }
    }

    @IBOutlet weak var consultationChargeTitle: UILabel!{
        didSet{
            consultationChargeTitle.text = language.consultChargeLabelPayment
        }
    }
    
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var vetName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var totalPayment: UILabel!
    @IBOutlet weak var consultationCharge: UILabel!
    @IBOutlet weak var payButton: UIButton!{
        didSet{
            payButton.setTitle(language.payNowLabelPayemt, for: .normal)
        }
    }
    @IBOutlet weak var vetImageProfile: UIImageView!
    
    
    
    
    func configureUIButton(){
        
        payButton.layer.cornerRadius = 15
    }
    
    
}

