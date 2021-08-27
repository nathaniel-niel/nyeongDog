//
//  SignInViewExtension.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 02/08/21.
//
import UIKit

extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
