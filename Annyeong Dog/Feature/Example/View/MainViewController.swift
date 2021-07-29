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
       
        
        
    }
    

    @IBAction func didTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MRD", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "mrd")
//        let vc = MedicalRecordDetailTableViewController(style: .grouped)
        
        let navVc = UINavigationController(rootViewController: vc)
        
        self.present(navVc, animated: true, completion: nil)
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
