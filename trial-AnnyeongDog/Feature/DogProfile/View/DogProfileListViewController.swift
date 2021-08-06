//
//  DogProfileListViewController.swift
//  Annyeong Dog
//
//  Created by Pieter Yonathan on 29/07/21.
//

import UIKit

class DogProfileListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var dogProfileTableView: UITableView!
    
    var dogModel: [DogsModel] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //disable back button
        navigationItem.hidesBackButton = true
        
        dogProfileTableView.dataSource = self
        dogProfileTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DataManipulation.sharedData.fetchDogDataFromFirebase(with: UserControl.shared.user?.uid ?? "unknown") { responseData in
            self.dogModel = responseData
            
            DispatchQueue.main.async {
                self.dogProfileTableView.reloadData()
            }
            print("oke")
        }
    }
 
    //MARK: - Height Cell Setting
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130

    }
    
    //MARK: - Jumlah Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogModel.count
    }
    
    //MARK: - Ketika Row di klik
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "segueDogProfileDetail", sender: nil)
        let storyboard = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil)
        let nVC = (storyboard.instantiateViewController(identifier: "DPDE")) as! DogProfileDetailEditViewController
        
        nVC.id = dogModel[indexPath.row].dogID
        nVC.dogName = dogModel[indexPath.row].dogName
        nVC.dob = dogModel[indexPath.row].dateofBirth
        nVC.gender = dogModel[indexPath.row].gender
        nVC.breed = dogModel[indexPath.row].breed
        nVC.weight = dogModel[indexPath.row].weight
        nVC.color = dogModel[indexPath.row].color
        nVC.alergen = dogModel[indexPath.row].alergen
        
        self.navigationController?.pushViewController(nVC, animated: true)
    }
    
    //MARK: - Tampilan CEll
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dogProfileListIdentifier") as! DogProfileTableViewCell
        
        cell.dogProfileView.layer.cornerRadius = 10
        cell.dogProfileView.layer.borderWidth = 2
        cell.dogProfileView.layer.borderColor = UIColor(red: 0.37, green: 0.43, blue: 0.69, alpha: 1).cgColor
    
        cell.dogPicture.layer.cornerRadius = 8
        cell.dogName.text = dogModel[indexPath.row].dogName
        cell.dogGender.text = dogModel[indexPath.row].gender
        cell.dogWeight.text = dogModel[indexPath.row].weight
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    //MARK: - Add button di klik
    @IBAction func addDidTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil)
        let nVC = (storyboard.instantiateViewController(identifier: "DPDA"))
        
        self.navigationController?.pushViewController(nVC, animated: true)
    }
    
}
