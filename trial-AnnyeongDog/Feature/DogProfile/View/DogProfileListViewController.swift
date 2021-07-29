//
//  DogProfileListViewController.swift
//  Annyeong Dog
//
//  Created by Pieter Yonathan on 29/07/21.
//

import UIKit

class DogProfileListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var dogProfileTableView: UITableView!
    
    //Dummy Data
    let dogs = [
        Dogs(dogName: "Rayzki", dogGender: "Male", dogWeight: "2 Kg"),
        Dogs(dogName: "Chiko", dogGender: "Male", dogWeight: "1 Kg"),
        Dogs(dogName: "Cara", dogGender: "Female", dogWeight: "2 Kg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dogProfileTableView.dataSource = self
        dogProfileTableView.delegate = self
    }
 
    //HeightCell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130

    }
    
    //JumlahCell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueDogProfileDetail", sender: nil)
        
    }
    
    //ViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dogProfileListIdentifier") as! DogProfileTableViewCell
        
        cell.dogProfileView.layer.cornerRadius = 8
        cell.dogProfileView.layer.borderWidth = 1
        cell.dogProfileView.layer.borderColor = UIColor(red: 0.37, green: 0.43, blue: 0.69, alpha: 1).cgColor
    
        cell.dogPicture.layer.cornerRadius = 8
        cell.dogName.text = dogs[indexPath.row].dogName
        cell.dogGender.text = dogs[indexPath.row].dogGender
        cell.dogWeight.text = dogs[indexPath.row].dogWeight
        
        cell.selectionStyle = .none
        
        return cell
    }
    @IBAction func addDidTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "segueDogProfileDetail", sender: nil)
    }
    
}

// If statement from segue storyboard

//func navigateToDogProfileEmptyState() -> DogProfileEmptyState {
//
//        let storyBoard: UIStoryboard = UIStoryboard(name: "DogProfileEmptyState", bundle: nil)
//
//        let dogProfileVC = storyBoard.instantiateViewController(withIdentifier: "DogProfileEmptyState") as! DogProfileEmptyState
//
//        return dogProfileVC
//
//
//    }
//if data == nil{
//present(prepareForMedical.navigateToDogProfileEmptyState(), animated: true, completion: nil)
//}
// else {
// present(prepareForMedical.navigateToDogProfileFilledState(), animated: true, completion: nil)


