//
//  ExtensionMRDVIew+TableView.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 11/08/21.
//

import Foundation
import UIKit

extension MedicalRecordDetailEditViewController: UITableViewDataSource, UITableViewDelegate{
    
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
            return 1
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Time"
        case 1:
            return "Detail"
        case 2:
            return "Medical Record"
        case 3:
            return "Description"
        default:
            fatalError()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    
    // MARK: - Row
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section != 3{
            return 45
            
        }
        else{
            return 100
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
            cell.contenTextField.delegate = self
            cell.contenTextField.autocorrectionType = .no
            cell.configure(title: "Date", placeholder: mrdModel?.date ?? "no data", tag: 0)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
            cell.contenTextField.delegate = self
            cell.contenTextField.autocorrectionType = .no
            if indexPath.row == 0 {
                
                cell.configure(title: "Vet Name", placeholder: mrdModel?.veterinarian ?? "no data",tag: 1)
                
            } else {
                cell.configure(title: "Vaccine Type", placeholder: mrdModel?.vaccineType ?? "no data", tag: 2)
                
            }
            return cell
        }
        
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
            cell.contenTextField.delegate = self
            cell.contenTextField.autocorrectionType = .no
            
            if indexPath.row == 0 {
                
                cell.configure(title: "Diagnose", placeholder: mrdModel?.diagnosis ?? "no data", tag: 3)
            } else if indexPath.row == 1 {
                cell.configure(title: "Medicine", placeholder: mrdModel?.medicine ?? "no data", tag: 4)
                
            } else {
                cell.configure(title: "Dosage", placeholder: mrdModel?.dosage ?? "no data", tag: 5)
                
            }
            
            return cell
        }
        
        else {
            let largeCell = tableView.dequeueReusableCell(withIdentifier: DescriptionTextViewCell.identifier) as! DescriptionTextViewCell
            largeCell.descriptionTextView.delegate = self
            largeCell.configure(description: "Type your descripcion here..")
            return largeCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.allowsSelection = false
        tableView.deselectRow(at: indexPath, animated: false)
        
        
    }
}