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
        view.backgroundColor = .blue
    }
    @IBAction func didSignInTapped(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
//        let signInVC = (storyboard.instantiateViewController(identifier: "SignInViewController")) as SignInViewController
//
//        self.present(signInVC, animated: true, completion: nil)
    }

    @IBAction func dogprofiledidtapped(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
//        let dogprofileVC = (storyboard.instantiateViewController(identifier: "DogProfileListViewController")) as DogProfileListViewController
//
//        self.present(dogprofileVC, animated: true, completion: nil)
        self.performSegue(withIdentifier: "segueDogProfile", sender: nil)
    }
}
