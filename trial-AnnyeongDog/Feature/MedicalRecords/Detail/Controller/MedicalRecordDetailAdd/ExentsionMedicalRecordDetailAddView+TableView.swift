//
//  ExentsionMRDAViewController+TableView.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 11/08/21.
//

import Foundation
import UIKit

extension MedicalRecordDetailAddViewController: UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Section
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
        case 3:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return language.timeTitle
        case 1:
            return language.detailTitle
        case 2:
            return language.medicalHistoryTitle
        case 3:
            return language.descriptionTitle
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    // MARK: - Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
            cell.contenTextField.delegate = self
            cell.contenTextField.autocorrectionType = .no
            cell.configure(title: language.dateMedicalRecord, placeholder: language.datePlaceholder, tag: 0)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
            cell.contenTextField.delegate = self
            cell.contenTextField.autocorrectionType = .no
            if indexPath.row == 0 {
                
                cell.configure(title: language.vetTitle, placeholder: language.vetNamePlaceholder,tag: 1)
                
            } else {
                cell.configure(title: language.typeVaccineTitle, placeholder: language.vaccineTypePlaceholder, tag: 2)
                
            }
            return cell
        }
        
        else if indexPath.section == 2 {
            let cell = mrdaTable.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
            cell.contenTextField.delegate = self
            cell.contenTextField.autocorrectionType = .no
            
            if indexPath.row == 0 {
                
                cell.configure(title: language.diagnosisTitle, placeholder: language.diagnosisPlaceholder, tag: 3)
            } else if indexPath.row == 1 {
                cell.configure(title: language.medicineTitle, placeholder: language.medicinePlaceholder, tag: 4)
                
            } else {
                cell.configure(title: language.dosageTitle, placeholder: language.dosagePlaceholder, tag: 5)
                
            }
            
            return cell
        }
        
        else {
            if indexPath.row == 0{
                let largeCell = mrdaTable.dequeueReusableCell(withIdentifier: DescriptionTextViewCell.identifier) as! DescriptionTextViewCell
                largeCell.descriptionTextView.delegate = self
                largeCell.configure(description: language.descriptionPlaceholder)
                return largeCell
            }
            
            else{
                let cell = mrdaTable.dequeueReusableCell(withIdentifier: DeleteButton.identifier, for: indexPath) as! DeleteButton
                return cell
            }
            
            
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.allowsSelection = false
        tableView.deselectRow(at: indexPath, animated: false)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section != 3{
            return 45
        }
        else{
            
            if indexPath.row == 0{
                return 100
            }
            else{
                return 60
                
            }
//            
        }
        
    }
}


