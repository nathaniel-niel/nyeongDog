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
        micOffButton.clipsToBounds =  true
        videoOffButton.layer.cornerRadius = 0.5 * videoOffButton.frame.height
        videoOffButton.clipsToBounds = true
        cameraFlipButton.layer.cornerRadius =  0.5 * cameraFlipButton.frame.height
        cameraFlipButton.clipsToBounds = true
        hangUpButton.layer.cornerRadius =  0.5 * hangUpButton.frame.height
        hangUpButton.clipsToBounds = true
        
    }
    
}

