//
//  MedicalRecordsFilledViewController.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

class MedicalRecordListViewController: UIViewController {
    
    
    // MARK: - UI Component
    @IBOutlet weak var addButton: UIBarButtonItem!{
        didSet{
            addButton.title = language.addButtonTitle
        }
    }
    @IBOutlet var MedicalRecordUI: MedicalRecordList_UI!
    
    
    // MARK: - Objects Declaration
    var prepareToMRD = PrepareToMRD()
    var mrdModel: [MRDModel] = []
    var mrdViewModel = MedicalRecordViewModel()
    
    // MARK: - Variables Declaration
    var dogId = CurrentDogProfile.shared.currentDogId
    
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        updateUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bindData()
        
    }
    
    //MARK: - Initial Declaration
    private func setup(){
      
        
        // register XIB table view cell
        MedicalRecordUI.table.register(MedicalRecordListTableViewCell.nib(), forCellReuseIdentifier: MedicalRecordListTableViewCell.identifier)
        
        // set title navigation bar
        self.navigationItem.title = language.navTitleMedicalRecord
    }
    
    func updateUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    // MARK: - Bind Data
    func bindData(){
        mrdViewModel.fetchData { data in
            self.mrdModel = data
            
            DispatchQueue.main.async {
                self.MedicalRecordUI.table.reloadData()
            }
        }
    }
    
    //MARK: - Action Function
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        self.present(prepareToMRD.prepareToAddMRD(dogId: CurrentDogProfile.shared.currentDogId ?? "no data"), animated: true, completion: nil)
    }
}


// MARK: - Table View
extension MedicalRecordListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mrdModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MedicalRecordListTableViewCell.identifier, for: indexPath) as? MedicalRecordListTableViewCell{
            
            cell.objectModel = mrdModel[indexPath.row]
        
            cell.accessoryType = .disclosureIndicator
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

        let storyboard = UIStoryboard(name: "MedicalRecordDetail", bundle: nil)
        
        
        let vc = storyboard.instantiateViewController(identifier: "mrd") as! MedicalRecordDetailViewcontroller
        let navVc = UINavigationController(rootViewController: vc)
        vc.dogId = dogId ?? "no data"
        vc.mrdModel = mrdModel[indexPath.row]
        
        self.present(navVc, animated: true, completion: nil)
    }
}
