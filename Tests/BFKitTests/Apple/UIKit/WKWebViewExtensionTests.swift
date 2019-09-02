//
//  WKWebViewExtensionTests.swift
//  BFKit iOS
//
//  Created by Sebastiaan Seegers on 02/09/2019.
//  Copyright © 2019 Fabrizio Brancati. All rights reserved.
//

@testable import BFKit
import Foundation
import UIKit
import WebKit
import XCTest

internal class WKWebViewExtensionTests: XCTestCase {
  internal var webView = WKWebView()
  
  override internal func setUp() {
    super.setUp()
    
    webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 320, height: 500))
  }
  
  internal func testLoadWebsite() {
    webView.load(Website: "https://www.fabriziobrancati.com")
    
    webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML") { html, error in
      if error != nil {
        XCTFail("`testLoadWebsite` error")
        return
      }

      guard let response = html as? String else {
        XCTFail("`testLoadWebsite` error")
        return
      }
      
      XCTAssertFalse(response.isEmpty)
    }
  }
}

