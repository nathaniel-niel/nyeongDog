//
//  VetProfileViewController.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 27/08/21.
//

import UIKit

class VetProfileViewController: UIViewController {
    
//    static var shared = VetProfileViewController()
//    @IBOutlet var vetProfileView: VetProfile!
    
    let vetProfile = VetProfile().loadViewFromNib(nibName: "VetProfile") as! VetProfile
    //MARK: - App Life Cycle
    override func viewWillAppear(_ animated: Bool) {
//        getVetName { name in
//            self.vetProfileView.vetName.text = name
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        vetProfileView.vetName.text = "Vet"
    }
    
    //MARK: -Functions
//    func getVetName(completion: @escaping(String) -> ()) {
//        name = "Vet"
//        completion(name ?? "noname")
//    }
    
//    var name: String? {
//        didSet {
//            setupName()
//        }
//    }
//
//    func setupName() {
//        guard let name =
//    }

}
//extension VetProfileViewController: fillNameDelegate {
//    func fillName() {
//        <#code#>
//    }
//}
