//
//  AlertManager.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 20/08/21.
//

import UIKit

class AlertManager: UIViewController {
    static let alert = AlertManager()
    
    func createSignInAlert(viewController: UIViewController) {
        let alert = UIAlertController(title: "Sign in to continue", message: "To proceed, you need to have an account", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil) )
        alert.addAction(UIAlertAction(title: "Sign In", style: .default, handler: { action in
            let storyboard = UIStoryboard(name: "Signin", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Signin")
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            viewController.present(nav, animated: true, completion: nil)
        }) )
        
        viewController.present(alert, animated: true)
    }
    
    func createChangeSavedAlert(viewController: UIViewController!) {
        let alert = UIAlertController(title: "Unsaved Changes", message: "You have unsaved changes, are you sure you want to cancel?.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive,handler: { action in
            
            // back to dog profile view
            let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "DogProfileListViewController")
            viewController.navigationController?.pushViewController(vc, animated: false)
        }))
        viewController.present(alert, animated: true)
    }
    
    func createDeleteDogProfileAlert(viewController: DogProfileDetailEditVC!){
        let alert = UIAlertController(title: "Delete Dog Profile", message: "Once you delete this, you won't be able to return it. Do you want to proceed?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive,handler: { action in
            
            // back to dog profile view
            let storyboard = UIStoryboard(name: "DogProfileFilledState", bundle: nil)
            
            let vc = storyboard.instantiateViewController(identifier: "DogProfileListViewController")
            viewController.navigationController?.pushViewController(vc, animated: false)
            
            DataManipulation.sharedData.deleteDogProfile(with: UserControl.shared.user?.uid ?? "unknown", with: viewController.id ?? "")
        }))
        viewController.present(alert, animated: true)
    }
}
