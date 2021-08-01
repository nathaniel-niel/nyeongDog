//
//  PrepareToMRD.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 29/07/21.
//

import UIKit

struct PrepareToMRD {
    
    func prepare() -> UINavigationController{
        
        let storyboard = UIStoryboard(name: "MRD", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mrd")
        
        let navVc = UINavigationController(rootViewController: vc)
        
        return navVc
        
    }
    
    func prepareToAddMRD() -> UINavigationController {
        let storyboard = UIStoryboard(name: "MRDA", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "mrda")
        
        let navVc = UINavigationController(rootViewController: vc)
        
        return navVc
    }
}
