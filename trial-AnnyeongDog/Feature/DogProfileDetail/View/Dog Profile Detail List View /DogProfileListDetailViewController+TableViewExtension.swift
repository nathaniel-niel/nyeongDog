//
//  DogProfileListDetailViewController+TableViewExtension.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit

extension DogProfileListDetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let dogImageCell = dogProfileDetailTableView.dogProfileDetailListTableView.dequeueReusableCell(withIdentifier: DogImageCell.identifier, for: indexPath) as! DogImageCell
            return dogImageCell
            
            
        case 1:
            let cell =  dogProfileDetailTableView.dogProfileDetailListTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Nama Anjing"
            cell.textField.text = dogName
            cell.tagFrom = 1
            cell.textField.isUserInteractionEnabled = false
            return cell
            
        case 2:
            let cell =  dogProfileDetailTableView.dogProfileDetailListTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            cell.textFieldLabel.text = "Usia"
            cell.textField.text = dob
            cell.tagFrom = 2
            cell.textField.isUserInteractionEnabled = false
            return cell
            
        case 3:
            let cell =  dogProfileDetailTableView.dogProfileDetailListTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            cell.textFieldLabel.text = "Jenis Kelamin"
            cell.tagFrom = 3
            cell.textField.text = gender
            cell.textField.isUserInteractionEnabled = false
            return cell
            
        case 4:
            let cell =  dogProfileDetailTableView.dogProfileDetailListTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Jenis Anjing"
            cell.tagFrom = 4
            cell.textField.text = breed
            cell.textField.isUserInteractionEnabled = false
            return cell
            
        case 5:
            let cell =  dogProfileDetailTableView.dogProfileDetailListTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            cell.textField.keyboardType = .numberPad
            cell.textFieldLabel.text = "Berat Badan"
            cell.tagFrom = 5
            cell.textField.text = weight
            cell.textField.isUserInteractionEnabled = false
            return cell
            
        case 6:
            let cell =  dogProfileDetailTableView.dogProfileDetailListTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Warna"
            cell.tagFrom = 6
            cell.textField.text = color
            cell.textField.isUserInteractionEnabled = false
            return cell
            
        case 7:
            let cell =  dogProfileDetailTableView.dogProfileDetailListTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Alergi"
            cell.tagFrom = 7
            cell.textField.text = alergen
            cell.textField.isUserInteractionEnabled = false
            return cell
            
        default:
            let cell = dogProfileDetailTableView.dogProfileDetailListTableView.dequeueReusableCell(withIdentifier: MedicalRecordsButton.identifier, for: indexPath) as!
                MedicalRecordsButton
            
            cell.delegate = self
            return cell
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 161
        default:
            return 67
        }
    }
}

extension DogProfileListDetailViewController: medicalRecordPressed{
    
    func medicalrecordPress() {
        self.navigationController?.pushViewController(viewModel.medicalRecordPressed(), animated: true)
    }
    
    
}
