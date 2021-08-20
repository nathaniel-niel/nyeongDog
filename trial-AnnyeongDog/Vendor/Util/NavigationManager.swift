//
//  NavigationManager.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 05/08/21.
//

import Foundation
import UIKit

class NavigationManager {
    //punya list enum Screen
    enum Screen {
        case signIn
        case main
        
    }
    
    func show(screen: Screen, inController: UIViewController!) {
        var viewController: UIViewController!
        switch screen {
        
        case .signIn:
            viewController = UIStoryboard(name: "Signin", bundle: nil).instantiateViewController(identifier: "Signin")
            
        case .main:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "main")
            
        }
        
        if let sceneDelegate = inController.view.window?.windowScene?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = viewController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
