//
//  DogProfileEmptyStateViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 06/08/21.
//

import UIKit
import Firebase

class DogProfileEmptyStateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func addButtonDidTapped(_ sender: Any) {
        if Firebase.Auth.auth().currentUser == nil{
            let storyboard = UIStoryboard(name: "Signin", bundle: nil)
            let signInVC = (storyboard.instantiateViewController(identifier: "Signin"))

            signInVC.modalPresentationStyle = .fullScreen
            self.present(signInVC, animated: true, completion: nil)
        }
        else{
            let storyboard = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil)
            let nVC = (storyboard.instantiateViewController(identifier: "XiBVC"))
            
            self.navigationController?.pushViewController(nVC, animated: true)
        }
    }

    @IBAction func backButtonDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = (storyboard.instantiateViewController(identifier: "Main"))

        signInVC.modalPresentationStyle = .fullScreen
        self.present(signInVC, animated: false, completion: nil)
        
    }
}
