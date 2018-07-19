//
//  HTMLTipVC.swift
//  CodeFlight
//
//  Created by user on 3/17/18.
//  Copyright © 2018 MasonD3V. All rights reserved.
//

import Foundation
import UIKit
import Highlightr
import IQKeyboardManagerSwift

class HTMLTipVC: UIViewController {

    @IBOutlet weak var viewPlaceholder: UIView!
    var textView : UITextView!
    var code : String!
    
    @IBOutlet var textToolbar: UIToolbar!
    var highlightr : Highlightr!
    let textStorage = CodeAttributedString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
        
        autoreleasepool {
            self.navigationItem.title = "\(tipName[myIndex])"
            
            let layoutManager = NSLayoutManager()
            textStorage.addLayoutManager(layoutManager)
            
            code = "\(tipInfo[myIndex])"
            
            let textContainer = NSTextContainer(size: code.height(withConstrainedWidth: viewPlaceholder.frame.size.width, font: UIFont.systemFont(ofSize: 500.0)))
            
            
            layoutManager.addTextContainer(textContainer)
            
            textView = UITextView(frame: viewPlaceholder.bounds, textContainer: textContainer)
            textView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            textView.autocorrectionType = UITextAutocorrectionType.no
            textView.autocapitalizationType = UITextAutocapitalizationType.none
            textView.keyboardAppearance = UIKeyboardAppearance.dark
            
            viewPlaceholder.addSubview(textView)
            addToolBar(textView: textView)
            
            textView.text = code
            
            highlightr = textStorage.highlightr
            
            textStorage.language = "html"
            
            highlightr.setTheme(to: "atom-one-dark")
            
            textView.backgroundColor = highlightr.theme.themeBackgroundColor
            
            viewPlaceholder.backgroundColor = highlightr.theme.themeBackgroundColor
            navigationController?.navigationBar.barTintColor = highlightr.theme.themeBackgroundColor
            tabBarController?.tabBar.barTintColor = highlightr.theme.themeBackgroundColor
            
            UserDefaults.standard.setColor(value: invertColor(color: (navigationController?.navigationBar.barTintColor)!), forKey: "TintColor")
            UserDefaults.standard.setColor(value: invertColor(color: (tabBarController?.tabBar.barTintColor)!), forKey: "TintColor")
            UserDefaults.standard.synchronize()
            
            navigationController?.navigationBar.tintColor = invertColor(color: highlightr.theme.themeBackgroundColor)
            tabBarController?.tabBar.tintColor = invertColor(color: highlightr.theme.themeBackgroundColor)
            
            UserDefaults.standard.setColor(value: navigationController?.navigationBar.barTintColor, forKey: "BGColor")
            UserDefaults.standard.setColor(value: tabBarController?.tabBar.barTintColor, forKey: "BGColor")
            UserDefaults.standard.synchronize()
            
            navigationController?.navigationBar.barStyle = UIBarStyle.black
            tabBarController?.tabBar.barStyle = UIBarStyle.black
            textView.isScrollEnabled = true
            textView.isEditable = false
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = highlightr.theme.themeBackgroundColor
        tabBarController?.tabBar.barTintColor = highlightr.theme.themeBackgroundColor
        
        UserDefaults.standard.setColor(value: invertColor(color: (navigationController?.navigationBar.barTintColor)!), forKey: "TintColor")
        UserDefaults.standard.setColor(value: invertColor(color: (tabBarController?.tabBar.barTintColor)!), forKey: "TintColor")
        UserDefaults.standard.synchronize()
        
        navigationController?.navigationBar.tintColor = invertColor(color: highlightr.theme.themeBackgroundColor)
        tabBarController?.tabBar.tintColor = invertColor(color: highlightr.theme.themeBackgroundColor)
        
        UserDefaults.standard.setColor(value: navigationController?.navigationBar.barTintColor, forKey: "BGColor")
        UserDefaults.standard.setColor(value: tabBarController?.tabBar.barTintColor, forKey: "BGColor")
        UserDefaults.standard.synchronize()
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        tabBarController?.tabBar.barStyle = UIBarStyle.black
        
        if #available(iOS 11.0, *) {
            textView.accessibilityIgnoresInvertColors = true
            navigationController?.navigationBar.accessibilityIgnoresInvertColors = true
            tabBarController?.tabBar.accessibilityIgnoresInvertColors = true
        }
    }
    
    func invertColor(color: UIColor) -> UIColor {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: nil)
        return UIColor(red:1.0-r, green: 1.0-g, blue: 1.0-b, alpha: 1)
    }
    
    @objc func indentWithTab() {
        if let range = self.textView.textRangeFromNSRange(range: self.textView.selectedRange){
            self.textView.replace(range, withText: "\t")
        }
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
}

extension HTMLTipVC: UITextViewDelegate {
    func addToolBar(textView: UITextView){
        let toolBar = UIToolbar()
        UserDefaults.standard.synchronize()
        toolBar.barStyle = UIBarStyle.black
        toolBar.isTranslucent = true
        toolBar.tintColor = UserDefaults.standard.colorForKey(key: "TintColor")
        toolBar.barTintColor = UserDefaults.standard.colorForKey(key: "BGColor")
        
        
        let tabButton = UIBarButtonItem(image: UIImage.init(named: "select-column"), style: UIBarButtonItemStyle.done, target: self, action: #selector(HTMLTipVC.indentWithTab))
        
        let cancelButton = UIBarButtonItem(image: UIImage.init(named: "DropDown"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(HTMLTipVC.closeKeyboard))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, tabButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textView.delegate = self
        textView.inputAccessoryView = toolBar
    }
}
