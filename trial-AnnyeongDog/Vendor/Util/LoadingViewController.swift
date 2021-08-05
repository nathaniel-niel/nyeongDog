//
//  LoadingViewController.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 05/08/21.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private var isNewUser: Bool!
    private let storageManager = StorageManager()
    private let navigationManager = NavigationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        isNewUser = storageManager.isNewUser()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isNewUser {
            //goto sign in page
            navigationManager.show(screen: .signIn, inController: self)
        }
        else {
            //goto main page
            navigationManager.show(screen: .main, inController: self)
        }
    }
}
