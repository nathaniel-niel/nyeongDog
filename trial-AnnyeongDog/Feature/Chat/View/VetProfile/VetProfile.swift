//
//  VetProfile.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 05/08/21.
//

import UIKit


//@IBDesignable
final class VetProfile: UIView {
    @IBOutlet weak var vetImage: UIImageView!
    @IBOutlet weak var vetName: UILabel!

    @IBOutlet var vetProfileView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "VetProfile") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
}
