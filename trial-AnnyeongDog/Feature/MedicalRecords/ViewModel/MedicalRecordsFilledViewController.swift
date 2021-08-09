//
//  MedicalRecordsFilledViewController.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

class MedicalRecordsFilledViewController: UIViewController {
    
    
    // MARK: - UI Component
    @IBOutlet weak var tableViewMedicalRecords: UITableView!
    
    // MARK: - Objects Declaration
    var prepareToMRD = PrepareToMRD()
    var dummyData = MedicalRecordsDummyData()
    var mrdModel: [MRDModel] = []
    
    // MARK: - Variables Declaration
    var dogId: String?
    
    
    // MARK: - App Life Cycle
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
    
    override func viewWillAppear(_ animated: Bool) {
        DataManipulation.sharedData.fetchMedicalRecordData(with: UserControl.shared.user?.uid ?? "unknown", with: dogId ?? "no data") { dataResponse in
           
                self.mrdModel = dataResponse
            print(self.mrdModel)
            
            
            DispatchQueue.main.async {
                self.tableViewMedicalRecords.reloadData()
            }
        }
        
    }
   
    
    
    //Nyambung ke Medical Records
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        self.present(prepareToMRD.prepareToAddMRD(dogId: dogId ?? "no data"), animated: true, completion: nil)
    }
    
    func updateUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
    }
}

extension MedicalRecordsFilledViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(mrdModel.count)
        return mrdModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = tableViewMedicalRecords.dequeueReusableCell(withIdentifier: MedicalFiilledTableViewCell.identifier, for: indexPath) as? MedicalFiilledTableViewCell{
            
            cell.configure(medicine: mrdModel[indexPath.row].medicine ?? "no data", date: mrdModel[indexPath.row].date ?? "no data", diagnose: mrdModel[indexPath.row].diagnosis ?? "no data")
            
            cell.accessoryType = .disclosureIndicator
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableViewMedicalRecords.deselectRow(at: indexPath, animated: true)

        self.present(prepareToMRD.prepare(dogId: dogId ?? "no data", mrdId: mrdModel[indexPath.row].id ?? "no data", date: mrdModel[indexPath.row].date ?? "no data", vet: mrdModel[indexPath.row].veterinarian ?? "no data", diagnosis: mrdModel[indexPath.row].diagnosis ?? "no data", vaccine: mrdModel[indexPath.row].vaccine ?? "no data", medicine: mrdModel[indexPath.row].medicine ?? "no data", vaccineType: mrdModel[indexPath.row].vaccineType ?? "no data", dosage: mrdModel[indexPath.row].dosage ?? "no data", desc: mrdModel[indexPath.row].description ), animated: true, completion: nil)
        
    }
}
