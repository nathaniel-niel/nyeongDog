//
//  MainViewController.swift
//  Annyeong Dog
//
//  Created by Nathaniel Andrian on 28/07/21.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

//        view.backgroundColor = .blue
      
        

        
    }
    
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
    
    
    @IBAction func didMedicalRecordDetailTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MRD", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mrd")
        //        let vc = MedicalRecordDetailTableViewController(style: .grouped)
        
        let navVc = UINavigationController(rootViewController: vc)
        
        self.present(navVc, animated: true, completion: nil)
    }
        
    @IBAction func didMedicalRecordDetailAddTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MRDA", bundle: nil)

       let vc = storyboard.instantiateViewController(identifier: "mrda")

     let navVc = UINavigationController(rootViewController: vc)
        
    self.present(navVc, animated: true, completion: nil)
    }
    
    

    
    
}
