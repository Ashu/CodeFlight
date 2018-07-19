//
//  AboutVC.swift
//  CodeFlight
//
//  Created by user on 3/24/18.
//  Copyright © 2018 MasonD3V. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "About CodeFlight"
        loadWebView()
    }
    
    func loadWebView() {
        let url = Bundle.main.url(forResource: "aboutcodeflight", withExtension: "html")
        let request = NSURLRequest(url: url!)
        webView.loadRequest(request as URLRequest)
    }
}
