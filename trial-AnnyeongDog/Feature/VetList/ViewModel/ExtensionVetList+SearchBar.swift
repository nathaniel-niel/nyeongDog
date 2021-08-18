//
//  VetListSearchBar.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 17/08/21.
//

import Foundation
import UIKit

extension VetListViewController: UISearchResultsUpdating, UISearchBarDelegate{
    
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
    
    func configureSearchController(){
        searchController.loadViewIfNeeded()
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
