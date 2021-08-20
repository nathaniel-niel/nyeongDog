//
//  VideoCallViewController.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 04/08/21.
//

import UIKit

class VideoCallViewController: UIViewController {
    
    var facetimeCall = FacetimeVideoCall()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func videoCallPressed(_ sender: UIButton) {
    
        facetimeCall.fetchFacetime()
        
    }
}
