//
//  UIScreenExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 06/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
import UIKit
@testable import BFKit

class UIScreenExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testScreenWidth() {
        XCTAssert(UIScreen.screenWidth == 414)
    }
    
    func testScreenHeight() {
        XCTAssert(UIScreen.screenHeight == 736)
    }
    
    func testMaxScreenLength() {
        XCTAssert(UIScreen.maxScreenLength == 736)
    }
    
    func testMinScreenLength() {
        XCTAssert(UIScreen.minScreenLength == 414)
    }
    
    func testIsRetina() {
        XCTAssertFalse(UIScreen.isRetina())
    }
    
    func testIsRetinaHD() {
        XCTAssertTrue(UIScreen.isRetinaHD())
    }
    
    func testFixedScreenSize() {
        XCTAssert(UIScreen.fixedScreenSize() == CGSize(width: 414, height: 736))
    }
}
