//
//  CustomTabBarViewController.swift
//  Christina App
//
//  Created by Charles Roberts on 3/12/22.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = UIColor(named: "TabBarTint")
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        self.additionalSafeAreaInsets.top = 10
        
    }

}
