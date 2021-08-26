//
//  VetListNavigationController.swift
//  trial-AnnyeongDog
//
//  Created by Pieter Yonathan on 26/08/21.
//

import UIKit

class VetListNavigationController: UINavigationController {

    @IBOutlet weak var tabBarItemVetList: UITabBarItem!{
        didSet{
            tabBarItemVetList.title = language.tabBarTitleVetListLabel
        }
    }
   
}
