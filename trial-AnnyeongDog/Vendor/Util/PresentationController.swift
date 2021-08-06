//
//  PresentationController.swift
//  BottomCardView
//
//  Created by Nathaniel Andrian on 05/08/21.
//

import UIKit

//source: https://www.youtube.com/watch?v=cI3Bzmq4EgY
//github: https://github.com/aivars/SlideOverTutorial

class PresentationController: UIPresentationController{
    
    
    let blurEffectView: UIVisualEffectView!
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        let blurEffect = UIBlurEffect(style: .dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        tapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(dismissController))
        blurEffectView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        self.blurEffectView.isUserInteractionEnabled = true
        self.blurEffectView.addGestureRecognizer(tapGestureRecognizer)

    }
    
    // set frame size when modal present in vc
    override var frameOfPresentedViewInContainerView: CGRect{
        CGRect(origin: CGPoint(x: 0, y: (self.containerView!.frame.height) * 0.09), size: CGSize(width: self.containerView!.frame.width, height: (self.containerView?.frame.height)! * 1))
    }
    
    override func presentationTransitionWillBegin() {
        self.blurEffectView.alpha = 0
        self.containerView?.addSubview(blurEffectView)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { UIViewControllerTransitionCoordinatorContext in
            self.blurEffectView.alpha = 0.7
        }, completion: { UIViewControllerTransitionCoordinatorContext in})
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.roundCorners(corners: [.topLeft, .topRight], radius: 35)
        
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
        blurEffectView.frame = containerView!.bounds
    }
    
    @objc func dismissController(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
}

extension UIView{
    func roundCorners(corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        
    }
}




