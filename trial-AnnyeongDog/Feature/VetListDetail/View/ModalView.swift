//
//  ModalView.swift
//  BottomCardView
//
//  Created by Nathaniel Andrian on 05/08/21.
//


import UIKit
import Firebase

class ModalView: UIViewController {
    
    // MARK: - UI Components Declaration
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var doctorProfileImage: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorExperienceLabel: UILabel!
    @IBOutlet weak var doctorRatingLabel: UILabel!
    @IBOutlet weak var ratingBackground: UIView!
    @IBOutlet weak var alumnusLabel: UILabel!
    @IBOutlet weak var klinikLabel: UILabel!
    @IBOutlet weak var STRVLabel: UILabel!
    @IBOutlet weak var ChargeLabel: UILabel!
    @IBOutlet weak var konsultasiButton: UIButton!
    
    
    // MARK: - Variables
    var hasSetPointOrigin = false
    var originPoint: CGPoint?
    
    // MARK: - Temporary Variable
    var vetName: String = ""
    var experience: String = ""
    var rating: String = ""
    var alumnus: String = ""
    var clinic: String = ""
    var strvNumber: String = ""
    var price: String = ""
    
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction))
        
        view.addGestureRecognizer(panGesture)
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin{
            hasSetPointOrigin = true
            originPoint = self.view.frame.origin
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        assing()
    }
    
    
    // MARK: - Function for UI Component
    func setup(){
        
        line.layer.cornerRadius = 2
        konsultasiButton.layer.cornerRadius = 10
        ratingBackground.layer.cornerRadius = 8
        clipShapeCircle()
    }
    
    //Masking Image view into circle
    func clipShapeCircle(){
        
        doctorProfileImage.layer.masksToBounds  = true
        doctorProfileImage.layer.cornerRadius = doctorProfileImage.bounds.width / 2
       // doctorProfileImage.layer.borderWidth = 1
        
    }
    
    //MARK: - Function to Set UI Components Valus
    
    func assing(){
        // Coming soon
        
        doctorNameLabel.text = vetName
        doctorExperienceLabel.text = experience
        doctorRatingLabel.text = rating
        alumnusLabel.text = alumnus
        klinikLabel.text = clinic
        STRVLabel.text = strvNumber
        ChargeLabel.text = price
    }
    
    //Mark: - Function Alert Sign In
    func showAlertSignin() {
        let alert = UIAlertController(title: "Sign in to continue", message: "To proceed, you need to have an account", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Sign In", style: .default, handler: { action in
            let storyboard = UIStoryboard(name: "Signin", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Signin")

            let nav = UINavigationController(rootViewController: vc)
            
            nav.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(nav, animated: true)
            self.present(nav, animated: true, completion: nil)
        }))

        self.present(alert, animated: true)
    }
    
    // MARK: - IB Action Consult Button
    @IBAction func didKonsultasiButtonTapped(_ sender: UIButton) {
        
        // if user is login = true -> whos consult page

         if Firebase.Auth.auth().currentUser != nil{
             //             go to whos consult page
            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Chat") as! ChatViewController
            let nav = UINavigationController(rootViewController: vc)
           
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
         // if user is not login/ new user -> login page
        else{
            showAlertSignin()
        }

    }
    
    
    // MARK: - Function for Pan Gesture
    @objc func panGestureAction(sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: view)
        
        // not allowing the user to drag the view upward
        guard  translation.y >= 0 else {return}
        
        // setting x = 0, becaus we don't want users to move the frame side ways, only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.originPoint!.y + translation.y)
        
        if sender.state == .ended{
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300{
                self.dismiss(animated: true, completion: nil)
            }
            else{
                //set back to original position of the view controller
                UIView.animate(withDuration: 0.3){
                    self.view.frame.origin = self.originPoint ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
}
