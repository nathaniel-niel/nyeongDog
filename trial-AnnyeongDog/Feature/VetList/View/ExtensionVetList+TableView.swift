//
//  ExtensionVetList+TableView.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 17/08/21.
//

import Foundation
import UIKit

extension VetListViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: - Setup Cell In Table View

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? searchVetName.count : ViewModel.vetNameList.count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = vetListTable.dequeueReusableCell(withIdentifier: VetListTableViewCell.identifier) as! VetListTableViewCell
        if searching{
            cell.objectModel = searchVetName[indexPath.row]
        }
        else{
            cell.objectModel = ViewModel.vetNameList[indexPath.row]
        }
            
        
        return cell
        
    }
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ModalViewController()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        
        if searching{
            vc.vetListModel = searchVetName[indexPath.row]
        }
        else{
            vc.vetListModel = ViewModel.vetNameList[indexPath.row]
            vetState.shared.currentVetIndex = indexPath.row
        }
        self.present(vc, animated: true, completion: nil)
    }

}
