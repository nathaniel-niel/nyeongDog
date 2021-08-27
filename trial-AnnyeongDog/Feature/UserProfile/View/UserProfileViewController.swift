//
//  UserProfileViewController.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 27/08/21.
//

import UIKit

class UserProfileViewController: UIViewController {

    // MARK: - UI ComponentsDeclaration
    
    @IBOutlet var userProfileView: UserProfileView!
    
    // MARK: - Object Declaration
    let userProfileViewModel = UserProfileViewModel()
    
    //MARK: - App Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        bindData()
    }
    
    // MARK: - Setup UI Component
    
    private func setup(){
        navigationItem.title = "My Profile"
        navigationItem.largeTitleDisplayMode = .never
        roundedImageVIew(image: userProfileView.userProfileImage)
        userProfileView.configUIButton()
        
    }
    
    // MARK: - Data Function
    
    func bindData(){
        userProfileViewModel.getProfileData { name, email in
            self.userProfileView.userName.text = name
            self.userProfileView.userName1.text = name
            self.userProfileView.userEmail.text = email
        }
    }
    
    // MARK: - Action Function


    @IBAction func didPaymentMethodTapped(_ sender: Any) {
        userProfileViewModel.goToPayemntMethod()
    }
    

    @IBAction func didSignOutButtonTapped(_ sender: Any) {
        userProfileViewModel.signOutAccount()
    }
    
    
}
