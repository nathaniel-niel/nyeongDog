//
//  ModalUIView.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 18/08/21.
//

import Foundation
import UIKit
import Firebase

class ModalUIView: UIView{
    
//    let viewModel = ModalViewModel()
//    let viewController = ModalView()
    
    // MARK: - UI Components Declaration

    @IBOutlet weak var alumniTitle: UILabel!{
        didSet{
            alumniTitle.text = language.alumniTitleLabel
        }
    }
    @IBOutlet weak var clinicTitle: UILabel!{
        didSet{
            clinicTitle.text = language.clinicTitleLabel
        }
    }
    @IBOutlet weak var strvTitle: UILabel!{
        didSet{
            strvTitle.text = language.srtvTitleLabel
        }
    }
    @IBOutlet weak var yearsexpTitle: UILabel!{
        didSet{
            yearsexpTitle.text = language.yearsexpTitleLabel
        }
    }
    @IBOutlet weak var descSTRVTitle: UILabel!{
        didSet{
            descSTRVTitle.text = language.descSTRCTitleLabel
        }
    }
    @IBOutlet weak var consultRateTitle: UILabel!{
        didSet{
            consultRateTitle.text = language.consultRateTitleLabel
        }
    }
    
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var vetImage: UIImageView!
    @IBOutlet weak var vetName: UILabel!
    @IBOutlet weak var vetExp: UILabel!
    @IBOutlet weak var vetRating: UILabel!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var strvNumber: UILabel!
    @IBOutlet weak var alumniLabel: UILabel!
    @IBOutlet weak var clinicLabel: UILabel!
    @IBOutlet weak var chargeLabel: UILabel!
    @IBOutlet weak var consultButton: UIButton!{
        didSet{
            consultButton.setTitle(language.consultButtonTitle, for: .normal)
        }
    }
    @IBOutlet weak var statusView: UIView!
    
    // didset function
    var objectModel: VetListModel?{
        didSet{
            setupCell()
        }
    }
    
    // assign data to model
    func setupCell(){
        guard let object = objectModel else { return }
        vetName.text = object.vetName
        vetExp.text = object.expYears
        vetRating.text = object.rating
        strvNumber.text = object.strvNumber
        alumniLabel.text = object.alumnus
        clinicLabel.text = object.clinicName
        chargeLabel.text = object.price
        statusView.backgroundColor = object.statusVet
    }
    
    // setup UI Component
    func setup(){
        line.layer.cornerRadius = 2
        consultButton.layer.cornerRadius = 10
        viewRating.layer.cornerRadius = 8
        vetImage.layer.masksToBounds  = true
        vetImage.layer.cornerRadius = vetImage.bounds.width / 2
        statusView.layer.cornerRadius = statusView.bounds.size.width / 2
        statusView.backgroundColor = UIColor.green
    }
    
    func consultButtonCondition(){
        if statusView.backgroundColor == UIColor.red {
            consultButton.isEnabled = false
            consultButton.backgroundColor = UIColor.gray
        }
        else{
            consultButton.isEnabled = true
        }
    }
}
