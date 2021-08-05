//
//  VetListViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 05/08/21.
//

import UIKit

class VetListViewController: UIViewController {

    // UI TableViewCell Declaration
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var vetListTable: UITableView!
    //get model
    let dummydata = VetDummyData()
//    var VetModel: [VetListModel] = []
    
    //change value string i
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate xib
        self.vetListTable.delegate = self
        self.vetListTable.dataSource = self
        
        //xib register
        vetListTable.register(VetListTableViewCell.nib(), forCellReuseIdentifier: VetListTableViewCell.identifier)
    }
    

}

extension VetListViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: - Height Cell Setting
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140

    }
    
    //MARK: - Jumlah Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummydata.data.count
    }
    
    //MARK: - Isi Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = vetListTable.dequeueReusableCell(withIdentifier: VetListTableViewCell.identifier) as! VetListTableViewCell
        cell.vetName.text = dummydata.data[indexPath.row].vetName
        cell.priceLabel.text = dummydata.data[indexPath.row].price
        cell.pengalamanLabel.text = dummydata.data[indexPath.row].expYears
        cell.ratingLabel.text = dummydata.data[indexPath.row].rating
        
        return cell
        
    }
    
    //MARK: - Ketika Row di klik
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "segueDogProfileDetail", sender: nil)
        let storyboard = UIStoryboard(name: "DogProfileDetailEdit", bundle: nil)
        let nVC = (storyboard.instantiateViewController(identifier: "DPDE")) as! DogProfileDetailEditViewController
        self.present(nVC, animated: true, completion: nil)
    }
    
    
}
