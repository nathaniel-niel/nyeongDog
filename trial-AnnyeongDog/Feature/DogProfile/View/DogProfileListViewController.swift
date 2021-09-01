//
//  DogProfileListViewController.swift
//  Annyeong Dog
//
//  Created by Pieter Yonathan on 29/07/21.
//

import UIKit
import Firebase
class DogProfileListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Declaration Storage Manager [User Login Information]
    //    let storageManager = StorageManager()
    var isNewUser: Bool!
    
    @IBOutlet weak var addButtonTitle: UIButton!{
        didSet{
            addButtonTitle.setTitle(language.addButtonTitle, for: .normal)
        }
    }
    
    // MARK: - UI Components Declaration
    @IBOutlet weak var dogProfileTableView: UITableView!
    @IBOutlet weak var dogProfileTabBarItem: UITabBarItem!{
        didSet{
            dogProfileTabBarItem.title = language.tabBarTitleDogProfileLabel
        }
    }
    
    // MARK: - Object Declaration
    var fetchDatafromFirebase = FetchDatafromFirebase()
    var userlogin = didUserLogin()
    
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        isNewUser = StorageManager.shared.isNewUser()
        
    }
 
    override func viewWillAppear(_ animated: Bool) {
        fetchFirebase()
        self.navigationItem.hidesBackButton = true
        self.tabBarController?.tabBar.isHidden = false
       
    }
    
    // MARK: - update the UI
    func updateUI(){
        //MARK: disable back button
        navigationItem.hidesBackButton = false
        dogProfileTableView.dataSource = self
        dogProfileTableView.delegate = self
        isNewUser = StorageManager.shared.isNewUser()
        
        dogProfileTabBarItem.title = language.tabBarTitleDogProfileLabel
        self.navigationItem.title = language.navTitleLabelDogProfile
        
        
    }
    // MARK: - Fetching the Firebase using ViewModel
    func fetchFirebase(){
        
        if StorageManager.shared.isNewUser() == false {
            fetchDatafromFirebase.fetchDataFirebase {
                DispatchQueue.main.async {
                    self.dogProfileTableView.reloadData()
                }
            }
        } else {}
    }
    
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
        let storyboard = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil)
        let nVC = (storyboard.instantiateViewController(identifier: "XiBEdit")) as! DogProfileListDetailViewController

        nVC.id = fetchDatafromFirebase.dogModel[indexPath.row].dogID
        nVC.dogName = fetchDatafromFirebase.dogModel[indexPath.row].dogName
        nVC.dob = fetchDatafromFirebase.dogModel[indexPath.row].dateofBirth
        nVC.gender = fetchDatafromFirebase.dogModel[indexPath.row].gender
        nVC.breed = fetchDatafromFirebase.dogModel[indexPath.row].breed
        nVC.weight = fetchDatafromFirebase.dogModel[indexPath.row].weight
        nVC.color = fetchDatafromFirebase.dogModel[indexPath.row].color
        nVC.alergen = fetchDatafromFirebase.dogModel[indexPath.row].alergen
        CurrentDogProfile.shared.currentDogId = fetchDatafromFirebase.dogModel[indexPath.row].dogID
       
        fetchDatafromFirebase.downdloadingDogPhoto(completion: { imageDownloaded in
            DispatchQueue.main.async {
                nVC.dogPhoto = imageDownloaded
                self.navigationController?.pushViewController(nVC, animated: true)
            }
            //jadi tadi lo nge binding data didalam closure, nah data nya itu masih nil karena belum dii inisialisasi, kenapa pas di inisialisasi masih nil>??? karena lo manggil nnya didalam thread closure, bukan di class nya, jadi class nya sendiribelum ke init, jadi mending kalo sudah pake closure ya udah manfaatin binding dari closure nya buat apa di save di object yang belum keinit..
            // jadi tadi tuh si objectnya kepanggil sebelum ke init? makanya dia nill?iya karena closure nya manggil object nya buukan manggil classs nya sedangkan object nya belum di create sama class nya ahh notedd.. tahnkss kaa zein, nect time langusng binding pake si closurenya aja yaa kaa? iyaasipp
            //seepp thankss kaa zeinnnn yooo

        })
    
        
    }
    
    
    //MARK: - Tampilan Cell
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
        //MARK: Function detect user has logged in or not
        if isNewUser == true{
            
            AlertManager.alert.createSignInAlert(viewController: self)
        } else {
            
            let storyboard = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil)
            let nVC = (storyboard.instantiateViewController(identifier: "XiBVC")) as! DogProfileDetailTableView
            
            self.navigationController?.pushViewController(nVC, animated: true)
        }
    }
    
}
