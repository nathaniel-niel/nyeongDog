//
//  ViewController.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 29/07/21.
//

import UIKit
import Firebase
import FirebaseAuth
import CryptoKit
import AuthenticationServices

class SigninViewController: UIViewController {
    
    //MARK: Declare viewModel
    let viewModel = SigninViewModel()
    
    //MARK: Declare XIB Button SignIn
    @IBOutlet weak var signInButtonView: Signin!
    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignInButton()
    }
    
    func setupSignInButton() {
        signInButtonView.delegate = self
        signInButtonView.appleSignInButton.addTarget(self, action: #selector(handleSignInWithAppleTapped), for: .touchUpInside)
    }
    
    @objc func handleSignInWithAppleTapped() {
        viewModel.performSignIn()
        self.navigationController?.pushViewController(viewModel.returnSuccessSignIn(), animated: true)
    }
}

extension SigninViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

//MARK:- Delegate Button Sign In
extension SigninViewController: signinDelegate {
    
    func skipSignin() {
        dismiss(animated: true, completion: nil)
    }
    func appleSignin() {
        setupSignInButton()
    }
}
