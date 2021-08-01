//
//  MedicalRecordsFilledViewController.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

class MedicalRecordsFilledViewController: UIViewController {
    
    @IBOutlet weak var tableViewMedicalRecords: UITableView!
    
    var prepareToMRD = PrepareToMRD()
    var dummyData = MedicalRecordsDummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //XiB Delegate and DataSource
        self.tableViewMedicalRecords.delegate = self
        self.tableViewMedicalRecords.dataSource = self
        
        //XiB Register
        tableViewMedicalRecords.register(MedicalFiilledTableViewCell.nib(), forCellReuseIdentifier: MedicalFiilledTableViewCell.identifier)
        
        updateUI()
        
    }
    //Nyambung ke Medical Records
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        self.present(prepareToMRD.prepare(), animated: true, completion: nil)
    }
    
    func updateUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
    }
}

extension MedicalRecordsFilledViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.arrayDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableViewMedicalRecords.dequeueReusableCell(withIdentifier: MedicalFiilledTableViewCell.identifier, for: indexPath) as? MedicalFiilledTableViewCell{
            
            cell.medicineLable.text = dummyData.arrayDummy[indexPath.row]
            
            cell.accessoryType = .disclosureIndicator
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    
    
    
    
}
