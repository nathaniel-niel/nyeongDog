//
//  PaymentViewModel.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 26/08/21.
//

import Foundation

class PaymentViewModel{
    
    let paymentManager = IAPManager.shared
    var model: VetListModel?
    let dummyData = VetDummyData()
    
    func pay(completion: @escaping(Bool)->()){
        
        IAPManager.shared.purchase { response in
            
            completion(response)
        }
    }
    
    func fetchVetData(completion: @escaping(VetListModel)->()){
        model = dummyData.data[vetState.shared.currentVetIndex ?? 0]
        
        guard let modelesc = model else { return  }
        completion(modelesc)
    }
    
    
    
}
