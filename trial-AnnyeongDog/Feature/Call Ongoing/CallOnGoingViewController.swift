//
//  CallOnGoingViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 02/08/21.
//

import UIKit

class CallOnGoingViewController: UIViewController {
    @IBOutlet weak var micOffButton: UIButton!
    @IBOutlet weak var videoOffButton: UIButton!
    @IBOutlet weak var cameraFlipButton: UIButton!
    @IBOutlet weak var hangUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        micOffButton.layer.cornerRadius = 0.5 * micOffButton.frame.height
        micOffButton.layer.masksToBounds =  true
        videoOffButton.layer.cornerRadius = 0.5 * videoOffButton.frame.height
        videoOffButton.layer.masksToBounds = true
        cameraFlipButton.layer.cornerRadius =  0.5 * cameraFlipButton.frame.height
        cameraFlipButton.layer.masksToBounds = true
        hangUpButton.layer.cornerRadius =  0.5 * hangUpButton.frame.height
        hangUpButton.layer.masksToBounds = true
        
    }
    
}

