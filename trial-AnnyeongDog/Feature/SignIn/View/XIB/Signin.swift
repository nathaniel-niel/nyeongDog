//
//  Signin.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 02/08/21.
//

import UIKit

protocol signinDelegate {
    func skipSignin()
    func appleSignin()
}

@IBDesignable
final class Signin: UIView {

    @IBOutlet weak var appleSignInButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    var delegate: signinDelegate?

    @IBAction func didTapSkipButton(_ sender: UIButton) {
        delegate?.skipSignin()
        
    }
    @IBAction func didTapSigninButton(_ sender: UIButton) {
        delegate?.appleSignin()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "Signin") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }

}
