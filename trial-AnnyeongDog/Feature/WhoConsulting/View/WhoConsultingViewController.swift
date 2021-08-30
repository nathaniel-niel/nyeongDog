//
//  WhoConsultingViewController.swift
//  collectionView
//
//  Created by Pieter Yonathan on 26/08/21.
//

import UIKit
import Firebase

class WhoConsultingViewController: UIViewController {

    // MARK: - Object Declaration
    var fetchDatafromFirebase = FetchDatafromFirebase()
    var dogModel: [DogsModel] = []
    var vetListModel: VetListModel?
    // IBOutlet
    @IBOutlet weak var dogProfileCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchFirebase()
    }
    
    // MARK: - Fetching the Firebase using ViewModel
    func fetchFirebase(){
        fetchDatafromFirebase.fetchDataFirebase {
            DispatchQueue.main.async {
                self.dogProfileCollectionView.reloadData()
            }
        }
    }
    
    
    private func setup(){
        //SetupLayoutCell
        dogProfileCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        //Delegate and Register
        dogProfileCollectionView.delegate = self
        dogProfileCollectionView.dataSource = self
        dogProfileCollectionView.register(WhoConsultingCollectionViewCell.nib(), forCellWithReuseIdentifier: WhoConsultingCollectionViewCell.identifier)
        //NavigationBar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.title = language.navTitleWhoConsulting
    }
    
    //Back button did tapped
    @IBAction func backButtonDidTapped(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
}

extension WhoConsultingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchDatafromFirebase.dogModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let vc = PaymentViewController()
        vc.vetListModel = self.vetListModel
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WhoConsultingCollectionViewCell.identifier, for: indexPath) as! WhoConsultingCollectionViewCell
    
        cell.configure(with: UIImage(named: "defaultPhotos")!, nameDog: "Bunny")
        cell.dogName.text = fetchDatafromFirebase.dogModel[indexPath.row].dogName
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 155, height: 210)
    }
    
}
