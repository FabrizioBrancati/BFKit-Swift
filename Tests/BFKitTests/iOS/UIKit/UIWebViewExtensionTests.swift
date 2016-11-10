//
//  UIWebViewExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 11/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIWebViewExtensionTests: XCTestCase {
    var webView: UIWebView = UIWebView()
    
    override func setUp() {
        super.setUp()
        
        webView = UIWebView(frame: CGRect(x: 0, y: 0, width: 320, height: 500))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRemoveBackgroundShadow() {
        webView.removeBackgroundShadow()
        
        XCTAssertFalse(webView.scrollView.subviews.isEmpty)
    }
    
    func testLoadWebsite() {
        webView.loadWebsite("https://www.fabriziobrancati.com")
        
        guard let html = webView.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('html')[0].innerHTML") else {
            XCTAssertTrue(false)
            return
        }
        
        XCTAssert(!html.isEmpty)
    }
}
