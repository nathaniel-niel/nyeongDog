//
//  MainViewController.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 28/07/21.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    weak var handle: AuthStateDidChangeListenerHandle?
    
    let helper = Helper()
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(helper.generateUniqueID())
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //harusnya ada di scene delegate.
//        handle = Firebase.Auth.auth().addStateDidChangeListener({ (auth, user) in
//
//            if user == nil {
//                let storyboard = UIStoryboard(name: "Signin", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "Signin")
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//                print("sign in first")
//            }
//
//        })
    }
    
    // MARK: - IBAction from button SignIn
    @IBAction func didSignInTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Signin", bundle: nil)
        let signInVC = (storyboard.instantiateViewController(identifier: "Signin")) as! SigninViewController

        self.navigationController?.pushViewController(signInVC, animated: true)
       
        
  }
    
    
    @IBAction func facetimeVideoCall(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "VideoCallStoryboard", bundle: nil)
        let signInVC = (storyboard.instantiateViewController(identifier: "videoCall")) as! VideoCallViewController
        
        self.navigationController?.pushViewController(signInVC, animated: true)
        
    }
    
    //MARK: -IBAction from button MedicalRecordDetail
    @IBAction func didMedicalRecordDetailTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MRD", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mrd")
        //        let vc = MedicalRecordDetailTableViewController(style: .grouped)
        
        let navVc = UINavigationController(rootViewController: vc)
        
        self.present(navVc, animated: true, completion: nil)
    }
    
    //MARK: -IBAction from button MedicalRecordDetailAdd
    @IBAction func didMedicalRecordDetailAddTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MRDA", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mrda")
        
        let navVc = UINavigationController(rootViewController: vc)
        
        self.present(navVc, animated: true, completion: nil)
    }
    
    @IBAction func didTapChatPage(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Chat", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "Chat")
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
}
