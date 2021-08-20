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
            cell.vetName.text = searchVetName[indexPath.row].vetName
            cell.priceLabel.text = searchVetName[indexPath.row].price
            cell.pengalamanLabel.text = searchVetName[indexPath.row].expYears
            cell.ratingLabel.text = searchVetName[indexPath.row].rating
            cell.statusView.backgroundColor = searchVetName[indexPath.row].statusVet
        }
        else{
            
            cell.vetName.text = ViewModel.vetNameList[indexPath.row].vetName
            cell.priceLabel.text = ViewModel.vetNameList[indexPath.row].price
            cell.pengalamanLabel.text = ViewModel.vetNameList[indexPath.row].expYears
            cell.ratingLabel.text = ViewModel.vetNameList[indexPath.row].rating
            cell.statusView.backgroundColor = ViewModel.vetNameList[indexPath.row].statusVet
        }
        
        return cell
        
    }
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        performSegue(withIdentifier: "segueDogProfileDetail", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ModalViewController()
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
                vc.statusVet = searchVetName[indexPath.row].statusVet ?? .clear
        }
        else{
            vc.vetName = ViewModel.vetNameList[indexPath.row].vetName ?? "no data"
            vc.experience = ViewModel.vetNameList[indexPath.row].expYears ?? "no data"
            vc.rating = ViewModel.vetNameList[indexPath.row].rating ?? "no data"
            vc.alumnus = ViewModel.vetNameList[indexPath.row].alumnus ?? "no data"
            vc.clinic = ViewModel.vetNameList[indexPath.row].clinicName ?? "no data"
            vc.strvNumber = ViewModel.vetNameList[indexPath.row].strvNumber ?? "no data"
            vc.price = ViewModel.vetNameList[indexPath.row].price ?? "no data"
            vc.statusVet = ViewModel.vetNameList[indexPath.row].statusVet ?? .clear
        }
        self.present(vc, animated: true, completion: nil)
    }
    
}
