//
//  IAPManager.swift
//  trial-AnnyeongDog
//
//  Created by Nathaniel Andrian on 25/08/21.
//

import Foundation
import StoreKit



final class IAPManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    
    static let shared = IAPManager()
    var product: SKProduct?
    
    func fetchproducts(){
        // product id: price_35000
        let request = SKProductsRequest(productIdentifiers: ["price_35000"])
        request.delegate = self
        request.start()
    }
    
    func purchase(){
        guard let myProduct = product else { return }
        
        if SKPaymentQueue.canMakePayments(){
            let payment  = SKPayment(product: myProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        print("count: \(response.products.count)")
        if let myProduct = response.products.first {
            product = myProduct
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions{
            switch transaction.transactionState {
            
            case .purchasing:
                // no purchasing
                break
            case .purchased:
                PaymentUserState.shared.setStateIntoPaid()
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            case .deferred:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            @unknown default:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            }
        }
        
    }
}
