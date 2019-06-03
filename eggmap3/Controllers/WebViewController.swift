//
//  WebViewController.swift
//  eggmap3
//
//  Created by Mei on 31/05/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit
import WebKit
//"http://xbo-m.com"
class WebViewController: UIViewController , WKNavigationDelegate{
  
  @IBOutlet weak var webView: WKWebView! 
  var urlString: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let urlString = urlString else {return}
    guard let url = URL(string: urlString) else {return}
    webView.load(URLRequest(url: url))
    webView.allowsBackForwardNavigationGestures = true
  }
  
  override func loadView() {
    super.loadView()
    webView.navigationDelegate = self
  }
  
}
