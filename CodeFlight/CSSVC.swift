//
//  CSSVC.swift
//  CodeFlight
//
//  Created by user on 3/17/18.
//  Copyright © 2018 MasonD3V. All rights reserved.
//

import UIKit

var tipNameCSS = ["Using Styles", "Colors & Borders", "Text Styles", "Size and Layout", "CSS Lists"]
var tipInfoCSS = ["<!-- An external CSS file -->\n\n<head>\n\t<link rel='stylesheet' type='text/css' href='style.css' title='style'>\n</head>\n\n\n<!-- Within the html header -->\n\n<head>\n\t<style type='text/css'>\n\t\th1 {\n\t\t\tcolor: red;\n\t\t}\n\t</style>\n</head>\n\n\n<!-- Inline in the HTML -->\n\n<p style='color: red;'>Some red text</p>", "color: red;\n/* Element Color - eg. red | #FF0000 */\n\nbackground-color: white;\n/* Background Color of element */\n\nbackground-image: url(image.gif);\n/* Background Image of element */\n\nborder-color: yellow;\n/* Border Color of element */\n\nborder: 1px solid blue;\n/* Width, style and color of border defined together */", "text-align: left;\n/* Horizontal Alignment - left | center | right */\n\ntext-decoration: underline;\n/* Text Decorations - eg. none | underline | line-through */\n\nfont-family: fontname;\n/* Font Face (Typeface) - eg. Verdana, Arial, Helvetica */\n\nfont-size: 16pt;\n/* Font Size or Height - eg. 12pt | 15px */\n\nfont-weight: bold;\n/* Font Weight (Boldness) - eg. bold | normal | 200 */", "width: 400px;\n/* Width of HTML element - eg. 100px | 50% */\n\nheight: 100%;\n/* Height of HTML element - eg. 20px | 100% */\n\nmargin: 5px;\n/* Margin - space around an element, or distance between two elements */\n\nmargin-top: 1px;\n/* Top Margin. Also try -bottom: -left: or -right: */\n\npadding: 5px;\n/* Padding - distance between an elements contents and its border */\n\npadding-top: 1px;\n/* Top Padding. Also try -bottom: -left: or -right: */", "list-style: none;\n/* Clear existing bullet types set by html list tags */"]
var tipLanguageCSS = ["html", "css", "css", "css", "css"]
var myIndexCSS = 0

class CSSVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: index, animated: true)
        }
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipNameCSS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "css")! as UITableViewCell
        
        let tipNameCSSLabel = cell.viewWithTag(1) as! UILabel
        
        tipNameCSSLabel.text = tipNameCSS[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndexCSS = indexPath.row
        performSegue(withIdentifier: "gotoCSSTip", sender: self)
    }
    
}
