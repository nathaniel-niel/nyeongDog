//
//  ExtensionMRDView.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 11/08/21.
//

import UIKit

// MARK: - Table View
extension MRDViewController: UITableViewDataSource, UITableViewDelegate{
    
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
            return "Waktu"
        case 1:
            return "Detail"
        case 2:
            return "Riwayat Kesehatan"
        case 3:
            return "Deskripsi"
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
            let cell = table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
           
            cell.contenTextField.autocorrectionType = .no
            cell.configure(title: "Tanggal", placeholder: date, tag: 0)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
        
            cell.contenTextField.autocorrectionType = .no
            if indexPath.row == 0 {
                cell.configure(title: "Dokter Hewan", placeholder: vet,tag: 1)
            } else {
                cell.configure(title: "Tipe Vaksin", placeholder: vaccineType, tag: 2)
            }
            return cell
        }
        
        else if indexPath.section == 2 {
            let cell = table.dequeueReusableCell(withIdentifier: MRDTableViewCell.identifier, for: indexPath) as! MRDTableViewCell
           
            cell.contenTextField.autocorrectionType = .no
            
            if indexPath.row == 0 {
                cell.configure(title: "Diagnosa", placeholder: diagnosis, tag: 3)
            } else if indexPath.row == 1 {
                cell.configure(title: "Obat", placeholder: medicine, tag: 4)
            } else {
                cell.configure(title: "Dosis", placeholder: dosage, tag: 5)
            }
            
            return cell
        }
        
        else {
            let largeCell = table.dequeueReusableCell(withIdentifier: DescriptionTextViewCell.identifier) as! DescriptionTextViewCell
            return largeCell
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
            return 100
        }
        
    }
}

