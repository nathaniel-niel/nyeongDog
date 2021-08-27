//
//  ModalViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 18/08/21.
//

import Foundation
import UIKit
import Firebase

class ModalViewModel{
    
    func preparetoSignIn() -> UINavigationController{
        let storyboard = UIStoryboard(name: "Signin", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Signin") as! SigninViewController

        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        return nav
    }
    
    func preparetoWhoConsulting() -> UINavigationController{
    //             go to whos consult page
   let storyboard = UIStoryboard(name: "whoConsulting", bundle: nil)
   let vc = storyboard.instantiateViewController(withIdentifier: "whoConsulting")
        
   let nav = UINavigationController(rootViewController: vc)
   nav.modalPresentationStyle = .fullScreen
        
        return nav
    }
    
}
