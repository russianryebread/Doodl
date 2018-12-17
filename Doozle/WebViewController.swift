//
//  WebViewController.swift
//  Doozle
//
//  Created by Ryan Hoshor on 12/9/18.
//  Copyright © 2019 Ryan Hoshor. All rights reserved.
//

import Cocoa
import WebKit

class WebViewController: NSViewController, WKUIDelegate, WKNavigationDelegate {
    
    var myWebView: WKWebView!
    
    func webView(_ myWebView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }  // end func
    
    func webView(_ myWebView: WKWebView, didCommit navigation: WKNavigation!) {
    }  // end func
    
    func webView(_ myWebView: WKWebView, didFinish navigation: WKNavigation!) {
    }  // end func
    
    func webViewWebContentProcessDidTerminate(_ myWebView: WKWebView) {
    }  // end func
    
    func webView(_ myWebView: WKWebView, didFail navigation: WKNavigation!, withError: Error) {
    }  // end func
    
    func webView(_ myWebView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError: Error) {
    }  // end func
    
    func webView(_ myWebView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
    }  // end func
    
    // the following function handles target="_blank" links by opening them in the same view
    func webView(_ myWebView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        return nil
    } // end func
    
    func clear() {
        let js = "reset()"
        myWebView.evaluateJavaScript(js) { (result, error) in
            if error != nil {
                print(result!)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show custom mouse cursor
        if let image = NSImage(named:NSImage.Name("cursor.png")) {
            print(image)
            let spot = NSPoint(x: 0, y: 0)
            let customCursor = NSCursor(image: image, hotSpot: spot)
            view.addCursorRect(view.frame, cursor:customCursor)
        }
        
        let configuration = WKWebViewConfiguration()
        myWebView = WKWebView(frame: .zero, configuration: configuration)
        myWebView.translatesAutoresizingMaskIntoConstraints = false
        myWebView.navigationDelegate = self
        myWebView.uiDelegate = self
        myWebView.setValue(false, forKey: "drawsBackground")
        
        view.addSubview(myWebView)

        [myWebView.topAnchor.constraint(equalTo: view.topAnchor),
         myWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         myWebView.leftAnchor.constraint(equalTo: view.leftAnchor),
         myWebView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach  { 
            anchor in
            anchor.isActive = true
        }
        
        let url = Bundle.main.url(forResource:"main", withExtension: "html")
        let myRequest = URLRequest(url: url!)
        myWebView.load(myRequest)
    }
    
}
