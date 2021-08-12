//
//  UIVetList.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 12/08/21.
//

import UIKit

class UIVetList: UIView {

    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - Configure Search Bar
    func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Example: Drh. Budi"
    }
    

}
