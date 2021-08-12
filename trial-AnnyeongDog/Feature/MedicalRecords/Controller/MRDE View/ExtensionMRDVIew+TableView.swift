//
//  ExtensionMRDVIew+TableView.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 11/08/21.
//

import Foundation
import UIKit

extension MRDEViewController: UITableViewDataSource, UITableViewDelegate{
    
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
            cell.configure(title: "Date", placeholder: "00/00/2021", tag: 0)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
            cell.contenTextField.delegate = self
            cell.contenTextField.autocorrectionType = .no
            if indexPath.row == 0 {
                
                cell.configure(title: "Vet Name", placeholder: "Drh. Budi",tag: 1)
                
            } else {
                cell.configure(title: "Vaccine Type", placeholder: "Distemper", tag: 2)
                
            }
            return cell
        }
        
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
            cell.contenTextField.delegate = self
            cell.contenTextField.autocorrectionType = .no
            
            if indexPath.row == 0 {
                
                cell.configure(title: "Diagnose", placeholder: "Diarrhea", tag: 3)
            } else if indexPath.row == 1 {
                cell.configure(title: "Medecine", placeholder: "Pet Metronidazole Diarrhea", tag: 4)
                
            } else {
                cell.configure(title: "Dosage", placeholder: "4 x per Day", tag: 5)
                
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
