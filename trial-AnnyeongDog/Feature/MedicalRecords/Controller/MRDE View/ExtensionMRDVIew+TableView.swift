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
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
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
        let cell = tableView.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
        cell.contenTextField.delegate = self
        cell.contenTextField.autocorrectionType = .no
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.configure(title: "Date", placeholder: date, tag: 0)
                return cell
            default:
                fatalError()
            }
        case 1:
            switch indexPath.row {
            case 0:
                
                cell.configure(title: "Vet Name", placeholder: vet,tag: 1)
                return cell
            case 1:
                
                cell.configure(title: "Vaccine Type", placeholder: vaccineType, tag: 2)
                return cell
                
            default:
                fatalError()
            }
        case 2:
            switch indexPath.row {
            case 0:
                cell.configure(title: "Diagnose", placeholder: diagnosis, tag: 3)
                return cell
            case 1:
                
                
                cell.configure(title: "Medecine", placeholder: medicine, tag: 4)
                return cell
            case 2:
                
                
                cell.configure(title: "Dosage", placeholder: dosage, tag: 5)
                return cell
            default:
                fatalError()
            }
            
        default:
            fatalError()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.allowsSelection = false
        tableView.deselectRow(at: indexPath, animated: false)
        
        
    }
}
