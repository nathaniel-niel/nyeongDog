//
//  VetListViewController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 05/08/21.
//

import UIKit

class VetListViewController: UIViewController{
    
    
    
    // MARK: - UI Component Declaration
    @IBOutlet weak var vetListTable: UITableView!
    
    
    // MARK: - Object Declaration
    let ViewModel = VetListViewModel()
    let dummydata = VetDummyData()
    var searchVetName = [VetListModel]()
    var searching = false
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fill Data For VetList From Model
        ViewModel.fillDataVetList()
        // Configure Search Bar
        configureSearchController()
        // Delegate and Register
        setup()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
       
    private func setup(){
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    vetListTable.delegate = self
    vetListTable.dataSource = self
    self.navigationItem.title = language.navtitleLabelVet
    
        
    //xib register
    vetListTable.register(VetListTableViewCell.nib(), forCellReuseIdentifier: VetListTableViewCell.identifier)
    }
    
    @IBAction func didProfileTapped(_ sender: Any) {
        let vc = UserProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
        tabBarController?.hidesBottomBarWhenPushed = true
    }
}


extension VetListViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}



