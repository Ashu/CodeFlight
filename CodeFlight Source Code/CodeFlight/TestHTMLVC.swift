//
//  TestHTMLVC.swift
//  CodeFlight
//
//  Created by user on 3/17/18.
//  Copyright © 2018 MasonD3V. All rights reserved.
//

import Foundation
import UIKit
import Highlightr
import IQKeyboardManagerSwift
import GCDWebServer
import SystemConfiguration
import SystemConfiguration.CaptiveNetwork

class TestHTMLVC: UIViewController {
    
    @IBOutlet weak var viewPlaceholder: UIView!
    var textView : UITextView!
    var code : String!
    
    @IBOutlet var textToolbar: UIToolbar!
    var highlightr : Highlightr!
    let textStorage = CodeAttributedString()
    
    var webServer: GCDWebServer?
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        return (isReachable && !needsConnection)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
        
        autoreleasepool {
            self.navigationItem.title = "Code HTML5"
            
            let layoutManager = NSLayoutManager()
            textStorage.addLayoutManager(layoutManager)
            
            code = "<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<title>CodeFlight</title>\n\t</head>\n\t<body>\n\t\t<center>\n\t\t<h1>Hey!</h1>\n\t\t<h2>You're using CodeFlight, a mobile programming language trainer.</h2>\n\t\t<h3>Now it's your turn to code. Simply select this preset code and delete it.</h3>\n\t\t</center>\n\t</body>\n</html>"
            
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
    
    override func viewDidDisappear(_ animated: Bool) {
        webServer?.stop()
        return
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
    
    @objc func testMyCode() {
        // Create server
        webServer = GCDWebServer()
        // Add a handler to respond to GET requests on any URL
        webServer?.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self, processBlock: { (_ request: GCDWebServerRequest) -> GCDWebServerResponse? in
            return GCDWebServerDataResponse(html: "\(self.textView.text!)")
        })
        // Start server on port 8080
        webServer?.start(withPort: 8080, bonjourName: nil)
        
        if webServer?.serverURL == nil {
            let alertControllerTwo = UIAlertController(title: "CodeFlight Error", message: "Cannot start Web Server\nNo WiFi connection found\n\nPlease make sure WiFi is prioritized over cellular data to start server.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
            alertControllerTwo.addAction(OKAction)
            self.present(alertControllerTwo, animated: true, completion: nil)
            print("Error: Web Server is equal to nil.")
        } else {
            let alertController = UIAlertController(title: "Web Server Started", message: "Visit \(webServer!.serverURL!) on another browser to view your code.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        return
    }
}

extension TestHTMLVC: UITextViewDelegate {
    func addToolBar(textView: UITextView){
        let toolBar = UIToolbar()
        UserDefaults.standard.synchronize()
        toolBar.barStyle = UIBarStyle.black
        toolBar.isTranslucent = true
        toolBar.tintColor = UserDefaults.standard.colorForKey(key: "TintColor")
        toolBar.barTintColor = UserDefaults.standard.colorForKey(key: "BGColor")
        
        
        let tabButton = UIBarButtonItem(image: UIImage.init(named: "select-column"), style: UIBarButtonItemStyle.done, target: self, action: #selector(TestHTMLVC.indentWithTab))
        
        let cancelButton = UIBarButtonItem(image: UIImage.init(named: "DropDown"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(TestHTMLVC.closeKeyboard))
        
        let testButton = UIBarButtonItem(image: UIImage.init(named: "test"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(TestHTMLVC.testMyCode))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, tabButton, spaceButton, testButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textView.delegate = self
        textView.inputAccessoryView = toolBar
    }
}

extension UITextView
{
    func textRangeFromNSRange(range:NSRange) -> UITextRange?
    {
        let beginning = self.beginningOfDocument
        guard let start = self.position(from: beginning, offset: range.location), let end = self.position(from: start, offset: range.length) else { return nil}
        
        
        
        return self.textRange(from: start, to: end)
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGSize {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return boundingBox.size
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension String {
    
    func fileName() -> String {
        
        if let fileNameWithoutExtension = NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent {
            return fileNameWithoutExtension
        } else {
            return ""
        }
    }
    
    func fileExtension() -> String {
        
        if let fileExtension = NSURL(fileURLWithPath: self).pathExtension {
            return fileExtension
        } else {
            return ""
        }
    }
}

extension UserDefaults {
    func setColor(value: UIColor?, forKey: String) {
        guard let value = value else {
            set(nil, forKey:  forKey)
            return
        }
        set(NSKeyedArchiver.archivedData(withRootObject: value), forKey: forKey)
    }
    func colorForKey(key:String) -> UIColor? {
        guard let data = data(forKey: key), let color = NSKeyedUnarchiver.unarchiveObject(with: data) as? UIColor
            else { return nil }
        return color
    }
}
