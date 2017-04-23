//
//  UIWindowExtensionTests.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2017 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import XCTest
import Foundation
import UIKit
@testable import BFKit

class UIWindowExtensionTests: XCTestCase {
    var window: UIWindow = UIWindow()
    
    override func setUp() {
        super.setUp()
        
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 500))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShowTouchOnScreen() {
        showTouchOnScreen()
    }
    
    func testHideTouchOnScreen() {
        hideTouchOnScreen()
    }
    
    func testWindowScreenshotSave() {
        guard let screenshot = window.windowScreenshot(save: true) else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(screenshot)
    }
    
    func testWindowScreenshotDelaySaveCompletion() {
        let testExpectation = expectation(description: "Window Screenshot")
        
        window.windowScreenshot(delay: 2, save: true, completion: { screenshot in
            XCTAssertNotNil(screenshot)
            
            testExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Something went horribly wrong.")
        })
    }
    
    func testActivateTouch() {
        window.activateTouch()
    }
    
    func testDeactivateTouch() {
        window.deactivateTouch()
    }
}
