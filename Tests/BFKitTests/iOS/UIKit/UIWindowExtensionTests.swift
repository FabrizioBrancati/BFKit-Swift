//
//  UIWindowExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 11/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
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
    
    func testBFShowTouchOnScreen() {
        BFShowTouchOnScreen()
    }
    
    func testBFHideTouchOnScreen() {
        BFHideTouchOnScreen()
    }
    
    func testWindowScreenshotSave() {
        guard let screenshot = window.windowScreenshot(save: true) else {
            XCTAssertTrue(false)
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
