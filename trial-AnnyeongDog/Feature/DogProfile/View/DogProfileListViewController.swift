//
//  DogProfileListViewController.swift
//  Annyeong Dog
//
//  Created by Pieter Yonathan on 29/07/21.
//

import UIKit
import Firebase
class DogProfileListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UI Components Declaration
    @IBOutlet weak var dogProfileTableView: UITableView!
    
    // MARK: - Object Declaration
    var fetchDatafromFirebase = FetchDatafromFirebase()

    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        fetchFirebase()
      
        self.tabBarController?.tabBar.isHidden = false
        
        
    }
    
    // MARK: - update the UI
    func updateUI(){
        //disable back button
        navigationItem.hidesBackButton = true
        dogProfileTableView.dataSource = self
        dogProfileTableView.delegate = self
        
        
    }
    // MARK: - Fetching the Firebase using ViewModel
    func fetchFirebase(){
        
        fetchDatafromFirebase.fetchDataFirebase {
            DispatchQueue.main.async {
                self.dogProfileTableView.reloadData()
            }
        }
        
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        DataManipulation.sharedData.fetchDogDataFromFirebase(with: UserControl.shared.user?.uid ?? "unknown") { responseData in
    //            self.dogModel = responseData
    //
    //            DispatchQueue.main.async {
    //                self.dogProfileTableView.reloadData()
    //            }
    //
    //        }
    //    }
    
    
    
    
    //MARK: - Height Cell Setting
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
        
    }
    
    //MARK: - Jumlah Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchDatafromFirebase.dogModel.count
    }
    
    //MARK: - Ketika Row di klik
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        performSegue(withIdentifier: "segueDogProfileDetail", sender: nil)
        let storyboard = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil)
        let nVC = (storyboard.instantiateViewController(identifier: "DPDE")) as! DogProfileDetailEditViewController
        
        nVC.id = fetchDatafromFirebase.dogModel[indexPath.row].dogID
        nVC.dogName = fetchDatafromFirebase.dogModel[indexPath.row].dogName
        nVC.dob = fetchDatafromFirebase.dogModel[indexPath.row].dateofBirth
        nVC.gender = fetchDatafromFirebase.dogModel[indexPath.row].gender
        nVC.breed = fetchDatafromFirebase.dogModel[indexPath.row].breed
        nVC.weight = fetchDatafromFirebase.dogModel[indexPath.row].weight
        nVC.color = fetchDatafromFirebase.dogModel[indexPath.row].color
        nVC.alergen = fetchDatafromFirebase.dogModel[indexPath.row].alergen
        
        self.navigationController?.pushViewController(nVC, animated: true)
    }
    
    
    //MARK: - Tampilan CEll
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dogProfileListIdentifier") as! DogProfileTableViewCell
        
        cell.dogProfileView.layer.cornerRadius = 10
        cell.dogProfileView.layer.borderWidth = 2
        cell.dogProfileView.layer.borderColor = UIColor(red: 0.37, green: 0.43, blue: 0.69, alpha: 1).cgColor
        
        cell.dogPicture.layer.cornerRadius = 8
        cell.dogName.text = fetchDatafromFirebase.dogModel[indexPath.row].dogName
        cell.dogGender.text = fetchDatafromFirebase.dogModel[indexPath.row].gender
        cell.dogWeight.text = fetchDatafromFirebase.dogModel[indexPath.row].weight
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    //MARK: - Add button di klik
    @IBAction func addDidTapped(_ sender: Any) {
        let user =  Auth.auth().currentUser
        
        if user == nil {
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
        else {
            let storyboard = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil)
            let nVC = (storyboard.instantiateViewController(identifier: "DPDA"))
            
            self.navigationController?.pushViewController(nVC, animated: true)
        }
    }
    
}
