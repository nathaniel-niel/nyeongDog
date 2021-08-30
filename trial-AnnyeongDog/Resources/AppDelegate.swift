//
//  AppDelegate.swift
//  trial-AnnyeongDog
//
//  Created by Novi Gunawan on 29/07/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
//@main
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let storageManager = StorageManager()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        let db = Firestore.firestore()
        
        //MARK: -Biar tiap ke run ngga harus sign in terus, function di bawah ini comment aja ya
        //StorageManager.shared.setNewUser()
        
        //MARK: -Check condition user state
        let user =  StorageManager.shared.isNewUser()
        
        if user == false{
            StorageManager.shared.setExistingUser()
            IAPManager.shared.fetchproducts()
            print(db)
            print(user)
        } else {
            StorageManager.shared.setNewUser()
        }
        
        
        return true
    }
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    
    
}
