//
//  PaymentViewController.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 26/08/21.
//

import UIKit

class PaymentViewController: UIViewController {

    // MARK: - UI Components Declaration
    @IBOutlet var paymentUIView: PaymentUIVIew!
    
    // MARK: - Object Declaration
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Setup UI Component
    func setup(){
        
        navigationItem.title = "Payment"
        paymentUIView.configureUIButton()
        roundedImageVIew(image: paymentUIView.vetImageProfile)
        
    }
    
    
    
    // MARK: - Action Function
    @IBAction func didPayButtonTapped(_ sender: Any) {
        
    }
}
