//
//  ModalUIView.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 18/08/21.
//

import Foundation
import UIKit
import Firebase

class ModalUIView{
    
    let viewModel = ModalViewModel()
    let viewController = ModalView()
    
    // MARK: - UI Components Declaration
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var doctorProfileImage: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorExperienceLabel: UILabel!
    @IBOutlet weak var doctorRatingLabel: UILabel!
    @IBOutlet weak var ratingBackground: UIView!
    @IBOutlet weak var alumnusLabel: UILabel!
    @IBOutlet weak var klinikLabel: UILabel!
    @IBOutlet weak var STRVLabel: UILabel!
    @IBOutlet weak var ChargeLabel: UILabel!
    @IBOutlet weak var konsultasiButton: UIButton!
    
    // MARK: - Function for UI Component
    func setup(){
        
        line.layer.cornerRadius = 2
        konsultasiButton.layer.cornerRadius = 10
        ratingBackground.layer.cornerRadius = 8
        clipShapeCircle()
    }
    
    //Masking Image view into circle
    func clipShapeCircle(){
        
        doctorProfileImage.layer.masksToBounds  = true
        doctorProfileImage.layer.cornerRadius = doctorProfileImage.bounds.width / 2
       // doctorProfileImage.layer.borderWidth = 1
        
    }
    
    // MARK: - IB Action Consult Button
    @IBAction func didKonsultasiButtonTapped(_ sender: UIButton) {
        
        // if user is login = true -> whos consult page

         if Firebase.Auth.auth().currentUser != nil{
            viewController.presentToChat()
        }
         // if user is not login/ new user -> login page
        else{
            viewController.showAlertSignin()
        }

    }
}
