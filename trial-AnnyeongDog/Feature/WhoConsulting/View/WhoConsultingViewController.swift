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
    
    @IBOutlet weak var dogProfileCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        dogProfileCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        dogProfileCollectionView.delegate = self
        dogProfileCollectionView.dataSource = self
        dogProfileCollectionView.register(WhoConsultingCollectionViewCell.nib(), forCellWithReuseIdentifier: WhoConsultingCollectionViewCell.identifier)
    }
}

extension WhoConsultingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
//        return fetchDatafromFirebase.dogModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection View Cell Did Tapped")
        let storyboard = UIStoryboard(name: "Chat", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Chat") as! ChatViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WhoConsultingCollectionViewCell.identifier, for: indexPath) as! WhoConsultingCollectionViewCell
        
//        cell.configure(with: UIImage(named: "AppIcon")!, nameDog: fetchDatafromFirebase.dogModel[indexPath.row].dogName ?? "no data")
        cell.configure(with: UIImage(named: "AppIcon")!, nameDog: "Bunny")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 155, height: 188)
    }
}
