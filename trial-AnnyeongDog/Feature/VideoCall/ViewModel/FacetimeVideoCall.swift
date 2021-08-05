//
//  FacetimeVideoCall.swift
//  trial-AnnyeongDog
//
//  Created by Azka Kusuma on 04/08/21.
//

import UIKit

struct FacetimeVideoCall {
    
    var email = FacetimeEmail()
    
    func fetchFacetime(){
        
        if let phoneCallURL = URL(string: "facetime://\(email.emailTarget)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
          }
        
    }
}
