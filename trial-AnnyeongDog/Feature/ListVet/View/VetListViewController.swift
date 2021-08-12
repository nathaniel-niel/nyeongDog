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
    let searchController = UISearchController(searchResultsController: nil)
    var searching = false
    
    
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Masukin data untuk function search
        ViewModel.fillDataVetList()
        configureSearchController()
        
        
        //xib register
        vetListTable.register(VetListTableViewCell.nib(), forCellReuseIdentifier: VetListTableViewCell.identifier)
    }
    
    
    //MARK: - Configure Search Bar
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = true
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Example: Drh. Budi"
    }
    
    
}

extension VetListViewController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate{
    
    //MARK: - Height Cell Setting
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }
    
    //MARK: - Jumlah Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchVetName.count
        }
        else{
            return ViewModel.vetNameList.count
        }
        //        return dummydata.data.count
    }
    
    //MARK: - Isi Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = vetListTable.dequeueReusableCell(withIdentifier: VetListTableViewCell.identifier) as! VetListTableViewCell
        if searching{
            cell.vetName.text = searchVetName[indexPath.row].vetName
            cell.priceLabel.text = searchVetName[indexPath.row].price
            cell.pengalamanLabel.text = searchVetName[indexPath.row].expYears
            cell.ratingLabel.text = searchVetName[indexPath.row].rating
        }
        else{
            
            cell.vetName.text = ViewModel.vetNameList[indexPath.row].vetName
            cell.priceLabel.text = ViewModel.vetNameList[indexPath.row].price
            cell.pengalamanLabel.text = ViewModel.vetNameList[indexPath.row].expYears
            cell.ratingLabel.text = ViewModel.vetNameList[indexPath.row].rating
            
        }
        
        return cell
        
    }
    
    //MARK: - Ketika Row di klik
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        performSegue(withIdentifier: "segueDogProfileDetail", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ModalView()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        
        if searching{
                vc.vetName = searchVetName[indexPath.row].vetName ?? "no data"
                vc.experience = searchVetName[indexPath.row].expYears ?? "no data"
                vc.rating = searchVetName[indexPath.row].rating ?? "no data"
                vc.alumnus = searchVetName[indexPath.row].alumnus ?? "no data"
                vc.clinic = searchVetName[indexPath.row].clinicName ?? "no data"
                vc.strvNumber = searchVetName[indexPath.row].strvNumber ?? "no data"
                vc.price = searchVetName[indexPath.row].price ?? "no data"
        }
        else{
            vc.vetName = ViewModel.vetNameList[indexPath.row].vetName ?? "no data"
            vc.experience = ViewModel.vetNameList[indexPath.row].expYears ?? "no data"
            vc.rating = ViewModel.vetNameList[indexPath.row].rating ?? "no data"
            vc.alumnus = ViewModel.vetNameList[indexPath.row].alumnus ?? "no data"
            vc.clinic = ViewModel.vetNameList[indexPath.row].clinicName ?? "no data"
            vc.strvNumber = ViewModel.vetNameList[indexPath.row].strvNumber ?? "no data"
            vc.price = ViewModel.vetNameList[indexPath.row].price ?? "no data"
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK: - Config Search Bar
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchVetName.removeAll()
        vetListTable.reloadData()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            searchVetName.removeAll()
            for vet in ViewModel.vetNameList{
                if vet.vetName!.lowercased().contains(searchText.lowercased()){
                    searchVetName.append(vet)
                }
            }
        }
        else{
            searching = false
            searchVetName.removeAll()
            searchVetName = ViewModel.vetNameList
        }
        vetListTable.reloadData()
    }
}

extension VetListViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}




