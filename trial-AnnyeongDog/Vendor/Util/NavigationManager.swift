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
    
    static var navigateToPage = NavigationManager()
    enum Screen {
        case signIn
        case main
        case dogProfileDetailTableView
    }
    
    enum Modal {
        
        case chat
        
    }
    
    func show(screen: Screen, inController: UIViewController!) {
        var viewController: UIViewController!
        switch screen {
        
        case .signIn:
            viewController = UIStoryboard(name: "Signin", bundle: nil).instantiateViewController(identifier: "Signin")
            
        case .main:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "main")
            
        case .dogProfileDetailTableView:
            viewController = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil).instantiateViewController(identifier: "XiBVC")
        }
        
        
        if let sceneDelegate = inController.view.window?.windowScene?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = viewController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    func showModal(modal: Modal, vc: UIViewController!) {
        var viewController: UIViewController!
        var navController: UINavigationController!
        
        switch modal {
       
        case .chat:
            viewController = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(identifier: "Chat")
        }
        navController = UINavigationController(rootViewController: viewController)
        navController.modalPresentationStyle = .fullScreen
        vc.present(navController, animated: true, completion: nil)
    }
}
