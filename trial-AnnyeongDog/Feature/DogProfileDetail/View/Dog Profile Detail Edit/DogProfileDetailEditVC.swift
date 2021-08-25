//
//  DogProfileDetailEditVC.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 25/08/21.
//

import UIKit

class DogProfileDetailEditVC: UIViewController {

    @IBOutlet var dogProfileDetailEditTableView: DogProfileDetailEditView!
    
    //MARK: - Object Declaration
    var pickerView = UIPickerView()
    var dobPickerView = UIPickerView()
    var isExpand = false
    
    
    //MARK: -Temporary variables
    var id: String?
    var dogName: String?
    var dob: String?
    var gender: String?
    var breed: String?
    var weight: String?
    var color: String?
    var alergen: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
