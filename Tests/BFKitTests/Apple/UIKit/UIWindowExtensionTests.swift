//
//  UIWindowExtensionTests.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2019 Fabrizio Brancati.
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

@testable import BFKit
import Foundation
import UIKit
import XCTest

internal class UIWindowExtensionTests: XCTestCase {
    internal var window = UIWindow()
    
    override internal func setUp() {
        super.setUp()
        
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 500))
    }
    
    internal func testShowTouchOnScreen() {
        showTouchOnScreen()
    }
    
    internal func testHideTouchOnScreen() {
        hideTouchOnScreen()
    }
    
//    internal func testWindowScreenshotSave() {
//        guard let screenshot = window.windowScreenshot(save: true) else {
//            XCTFail("testWindowScreenshotSave test failed")
//            return
//        }
//
//        XCTAssertNotNil(screenshot)
//    }
    
//    internal func testWindowScreenshotDelaySaveCompletion() {
//        let testExpectation = expectation(description: "Window Screenshot")
//
//        window.windowScreenshot(delay: 2, save: true) { screenshot in
//            XCTAssertNotNil(screenshot)
//
//            testExpectation.fulfill()
//        }
//
//        waitForExpectations(timeout: 5) { error in
//            XCTAssertNil(error, "Something went horribly wrong.")
//        }
//    }
    
    internal func testActivateTouch() {
        window.activateTouch()
    }
    
    internal func testDeactivateTouch() {
        window.deactivateTouch()
    }
    
    internal func testTouchImage() {
        let image = window.touchImage()
        
        XCTAssert(image.size.height <> (50, 60))
        XCTAssert(image.size.width <> (50, 60))
    }
}
