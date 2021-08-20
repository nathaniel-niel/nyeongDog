//
//  ModalView.swift
//  BottomCardView
//
//  Created by Nathaniel Andrian on 05/08/21.
//


import UIKit
import Firebase

class ModalViewController: UIViewController {
    

    @IBOutlet var uiView: ModalUIView!
    
    //MARK: - Declaration Variable
    let viewModel = ModalViewModel()
//    let uiView = ModalUIView()
    
    var hasSetPointOrigin = false
    var originPoint: CGPoint?
 
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
        
//        uiView.setup()
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
    
    //MARK: - Function to Set UI Components Valus
    
    func assing(){
        // Coming soon
        
        uiView.vetName.text = vetName
        uiView.vetExp.text = experience
        uiView.vetRating.text = rating
        uiView.alumniLabel.text = alumnus
        uiView.clinicLabel.text = clinic
        uiView.strvNumber.text = strvNumber
        uiView.chargeLabel.text = price
    }
    
    //Mark: - Function Alert Sign In
    func showAlertSignin() {
        let alert = UIAlertController(title: "Sign in to continue", message: "To proceed, you need to have an account", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Sign In", style: .default, handler: { action in
            self.navigationController?.pushViewController(self.viewModel.preparetoSignIn(), animated: true)
            self.present(self.viewModel.preparetoSignIn(), animated: true, completion: nil)
        }))

        self.present(alert, animated: true)
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
    
    
    @IBAction func consultButtonDidTapped(_ sender: Any) {
        // if user is login = true -> whos consult page

         if Firebase.Auth.auth().currentUser != nil{
            
            self.present(self.viewModel.preparetoChat(), animated: true, completion: nil)
        }
         // if user is not login/ new user -> login page
        else{
            showAlertSignin()
        }
    }
    
}

