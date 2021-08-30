//
//  PaymentViewController.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 26/08/21.
//

import UIKit



class PaymentViewController: UIViewController{
    
    
    // MARK: - UI Components Declaration
    @IBOutlet var paymentUIView: PaymentUIVIew!
    
    // MARK: - Object Declaration
    let paymentViewModel = PaymentViewModel()
//    let modalVC = ModalViewController()
    var vetListModel: VetListModel?
    var dogName: String?
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bindData() 
    }
    
    // MARK: - Setup UI Component
    func setup(){
        
        navigationItem.title = language.navTitlePayment
        paymentUIView.configureUIButton()
        roundedImageVIew(image: paymentUIView.vetImageProfile)
        
    }
    
    
    // MARK: - Action Function
    @IBAction func didPayButtonTapped(_ sender: Any) {
        if PaymentUserState.shared.ispaymentPaid() == false{
            paymentViewModel.pay { responseData in
                if responseData == true{
                    let storyboard = UIStoryboard(name: "Chat", bundle: nil)
                    let vc = storyboard.instantiateViewController(identifier: "Chat") as! ChatViewController
                    vc.vetListModel = self.vetListModel
                    self.navigationController?.pushViewController(vc, animated: true)
                }
//                else{
//                    let alert = UIAlertController(title: "Payment Error", message: "Please try again your payment", preferredStyle: .alert)
//
//                    alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
//
//                    self.present(alert, animated: true)
//                }
            }
        }
        else{
            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Chat") as! ChatViewController
            vc.vetListModel = self.vetListModel
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    func bindData(){
        paymentViewModel.fetchVetData { response in
            self.paymentUIView.vetName.text = response.vetName
            self.paymentUIView.totalPrice.text = response.price
            self.paymentUIView.rating.text = response.rating
            self.paymentUIView.totalPayment.text = response.price
            self.paymentUIView.dogName.text = self.dogName ?? "no data"
        }
        
    }
}
