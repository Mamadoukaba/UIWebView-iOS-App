//
//  ViewController.swift
//  UIWebView
//
//  Created by Mamadou Kaba on 6/15/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    //MARK: - Properties
    
    let featuredURL = "https://www.ductran.co/"
    let tutorialsURL = "https://www.ductran.co/blog"
    let coursesURL = "https://www.ductran.co/store"
    let signupURL = "https://www.ductran.co/store/LXoUe5qR"
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebpage(featuredURL)
        
    }
    
    func loadWebpage(stringURL: String) {
        let webview = UIWebView(frame: view.bounds)
        webview.scalesPageToFit = true
        webview.delegate = self
        view.addSubview(webview)
        
        if let url = NSURL(string: stringURL) {
            let request = NSURLRequest(URL: url)
            
            webview.loadRequest(request)
        }
    }


    //TargetAction
    
    @IBAction func menuChanged(sender: UISegmentedControl) {
        let selectedSegment = sender.selectedSegmentIndex
        switch selectedSegment {
        case 0: loadWebpage(featuredURL)
        case 1: loadWebpage(tutorialsURL)
        case 2: loadWebpage(coursesURL)
        default: break
        }
    }
    

    
    //MARK: - UIWebViewDelegate
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    @IBAction func signUpButtonTapped(sender: UIButton) {
        loadWebpage(signupURL)
    }
    

}