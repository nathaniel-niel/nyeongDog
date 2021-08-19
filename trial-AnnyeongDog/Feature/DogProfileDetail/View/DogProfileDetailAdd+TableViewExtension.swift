//
//  DogProfileDetailAdd+TableViewExtension.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 19/08/21.
//

import UIKit

extension DogProfileDetailTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let dogImageCell = dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogImageCell.identifier, for: indexPath) as! DogImageCell
            return dogImageCell
            
            
        case 1:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Nama Anjing"
            return cell
            
        case 2:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            cell.textField.inputView = dogsDOBPicker
            cell.textField.text = stringPickerDOB
            cell.textFieldLabel.text = "Usia"
            return cell
            
        case 3:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
           
            cell.textField.inputView = genderPicker
            //TODO -> Listener, Pickernya masih belum mau connect ke TextField
            cell.textField.text = stringPickerGender
            print(stringPickerDOB)
            cell.textFieldLabel.text = "Jenis Kelamin"
            return cell
            
        case 4:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Jenis Anjing"
            return cell
            
        case 5:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Berat Badan"
            return cell
            
        case 6:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Warna"
            return cell
            
        default:
            let cell =  dogProfileDetail.DogProfileTableView.dequeueReusableCell(withIdentifier: DogProfileDetailTextField.identifier, for: indexPath) as! DogProfileDetailTextField
            
            
            cell.textFieldLabel.text = "Alergi"
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 219
        default:
            return 86
        }
    }
    
}
