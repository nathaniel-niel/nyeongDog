//
//  ViewController.swift
//  BottomCardView
//
//  Created by Nathaniel Andrian on 05/08/21.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    }

    @IBAction func didTapped(_ sender: UIButton) {
        
        let vc = ModalView()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

extension ViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
       PresentationController(presentedViewController: presented, presenting: presenting)
    }
    
}

