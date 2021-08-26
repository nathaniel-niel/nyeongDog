//
//  userStateForPayement.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 25/08/21.
//

import Foundation

struct PaymentUserState {
    
    static let shared = PaymentUserState()
    
    func ispaymentPaid() -> Bool{
        UserDefaults.standard.bool(forKey: "payment_state")
    }
    
    func setStateIntoUnpaid(){
        UserDefaults.standard.set(false, forKey: "payment_state")
    }
    
    func setStateIntoPaid(){
        UserDefaults.standard.setValue(true, forKey: "payment_state")
    }
}
