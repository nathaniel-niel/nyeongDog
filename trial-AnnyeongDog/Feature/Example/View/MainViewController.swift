//
//  MainViewController.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 28/07/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MRD", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mrd")
        //        let vc = MedicalRecordDetailTableViewController(style: .grouped)
        
        let navVc = UINavigationController(rootViewController: vc)
        
        self.present(navVc, animated: true, completion: nil)
    }
        
    
    @IBAction func didSignInTapped(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
//        let signInVC = (storyboard.instantiateViewController(identifier: "SignInViewController")) as SignInViewController
//
//        self.present(signInVC, animated: true, completion: nil)
    }

}
