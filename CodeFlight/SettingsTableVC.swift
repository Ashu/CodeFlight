//
//  SettingsTableVC.swift
//  CodeFlight
//
//  Created by user on 3/18/18.
//  Copyright © 2018 MasonD3V. All rights reserved.
//

import UIKit

class SettingsTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let urlString = "https://twitter.com/MasonD3V"
            if let url = URL(string: urlString) {
                UIApplication.shared.openURL(url)
            }
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let urlString = "https://icons8.com"
            if let url = URL(string: urlString) {
                UIApplication.shared.openURL(url)
            }
        } else if indexPath.section == 1 && indexPath.row == 0 {
            let urlString = "https://github.com/raspu/Highlightr"
            if let url = URL(string: urlString) {
                UIApplication.shared.openURL(url)
            }
        } else if indexPath.section == 1 && indexPath.row == 1 {
            let urlString = "https://github.com/hackiftekhar/IQKeyboardManager"
            if let url = URL(string: urlString) {
                UIApplication.shared.openURL(url)
            }
        } else if indexPath.section == 1 && indexPath.row == 2 {
            let urlString = "https://github.com/swisspol/GCDWebServer"
            if let url = URL(string: urlString) {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
}
