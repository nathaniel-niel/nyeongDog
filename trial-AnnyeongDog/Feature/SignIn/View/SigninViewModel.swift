//
//  SigninViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 18/08/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import CryptoKit
import AuthenticationServices

class SigninViewModel: NSObject{
    let helper = Helper()
    let storageManager = StorageManager()
    
    func performSignIn() {
        let request = createAppleIDRequest()
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        
        authorizationController.delegate = self
        
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
    
    func returnSuccessSignIn () -> UIViewController {
        let storyboard = UIStoryboard(name: "DogProfileEmptyState", bundle: nil)
        let menuVC = storyboard.instantiateViewController(identifier: "DogProfileEmptyState")
        return menuVC
    }
}

extension SigninViewModel: ASAuthorizationControllerDelegate {
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
                  
//                    print("Nice! You're now signed in as \(user.uid), email : \(user.email ?? "unknown")")
                    //MARK: Insert sign in data to Firebase
                    DataManipulation.sharedData.insertUser(with: UserModel(id: user.uid, email: user.email ?? "no email"))
                }
            }
        }
        //MARK: login success
        print("Login success")
        storageManager.setExistingUser()
            
     }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Login failed")
        //TODO : Login failed
        storageManager.setNewUser()
    }
    
}
