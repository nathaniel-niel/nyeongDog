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
    let helper = Helper()
    @IBOutlet weak var signInButtonView: Signin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButtonView.delegate = self
        setupSignInButton()
//        view.addSubview(views)
    }

    
    func setupSignInButton() {
        signInButtonView.appleSignInButton.addTarget(self, action: #selector(handleSignInWithAppleTapped), for: .touchUpInside)
    }
    @objc func handleSignInWithAppleTapped() {
        performSignIn()
    }
    
    func performSignIn() {
        let request = createAppleIDRequest()
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        
        authorizationController.performRequests()
    }
    
    //Create request ke user untuk minta data dari mereka
    func createAppleIDRequest() -> ASAuthorizationAppleIDRequest {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        
        let nonce = helper.randomNonceString()
        request.nonce = helper.sha256(nonce)
        //save it in temporary variable
        helper.currentNonce = nonce
        return request
    }
    
}

extension SigninViewController: ASAuthorizationControllerDelegate {
    
    //This function is called after authentiation's successful
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = helper.currentNonce else {
                fatalError("Invalid state : A login callback was received but no login request was sent")
            }
            // Create an account in your system
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data \(appleIDToken.debugDescription)")
                return
            }
            
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString , rawNonce: nonce)
            
            
            //Sign in with Firebase
            Auth.auth().signIn(with: credential) { authDataResult, error in
                if let user = authDataResult?.user {
                    print("Nice! You're now signed in as \(user.uid), email : \(user.email ?? "unknown")")
                    DataManipulation.sharedData.insertUser(with: UserModel(id: user.uid, email: user.email ?? "no email"))
                }
            }
        }
        print("Login success")
        let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
        let dogProfileVC = storyboard.instantiateViewController(identifier: "DogProfileListViewController") as! DogProfileListViewController
        self.navigationController?.pushViewController(dogProfileVC, animated: true)
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Login failed")
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
        print("Ini harusnya ke page vetlist")
    }
    func appleSignin() {
        setupSignInButton()
    }
}
