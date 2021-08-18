//
//  VetListViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 10/08/21.
//

import Foundation

class VetListViewModel{
    
    // MARK: - Object Declaration
    let dummydata = VetDummyData()
    var vetNameList = [VetListModel]()

    
    //MARK: - Function Fill Data for Search
    func fillDataVetList(){
        var looping = dummydata.data.count - 1
        while  looping > -1{
            vetNameList.append(dummydata.data[looping])
            looping = looping - 1
        }
    }
    

    
}
