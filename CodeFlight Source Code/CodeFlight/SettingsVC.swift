//
//  SettingsVC.swift
//  CodeFlight
//
//  Created by user on 3/18/18.
//  Copyright © 2018 MasonD3V. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = nil
        navigationController?.navigationBar.tintColor = nil
        navigationController?.navigationBar.barStyle = UIBarStyle.default
        tabBarController?.tabBar.barTintColor = nil
        tabBarController?.tabBar.tintColor = nil
        tabBarController?.tabBar.barStyle = UIBarStyle.default
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.accessibilityIgnoresInvertColors = false
            tabBarController?.tabBar.accessibilityIgnoresInvertColors = false
        }
    }
    
}
