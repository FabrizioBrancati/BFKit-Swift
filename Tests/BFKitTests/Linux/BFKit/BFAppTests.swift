//
//  BFAppTests.swift
//  BFKit
//
//  Created by Fabrizio on 26/06/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
@testable import BFKit

class BFAppTests: XCTestCase {
    static let allTests = [
        ("testDebug", testDebug),
        ("testRelease", testRelease),
        ("testIsFirstStart", testIsFirstStart),
        ("testIsFirstStartVersion", testIsFirstStartVersion),
        ("testOnFirstStart", testOnFirstStart),
        ("testOnFirstStartVersion", testOnFirstStartVersion)
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDebug() {
        BFApp.debug {
            XCTAssert(true)
        }
    }
    
    func testRelease() {
        BFApp.release {
            XCTAssert(true)
        }
    }
    
    func testIsFirstStart() {
        let isFirstStart = BFApp.isFirstStart()
        BFApp.debug {
            XCTAssert(isFirstStart == true || isFirstStart == false)
        }
    }
    
    func testIsFirstStartVersion() {
        XCTAssert(BFApp.isFirstStart(version: BFApp.version) == true || BFApp.isFirstStart(version: BFApp.version) == false)
    }
    
    func testOnFirstStart() {
        BFApp.onFirstStart { (isFirstStart) in
            XCTAssert(isFirstStart == true || isFirstStart == false)
        }
    }
    
    func testOnFirstStartVersion() {
        BFApp.onFirstStart(version: BFApp.version) { (isFirstStart) in
            XCTAssert(isFirstStart == true || isFirstStart == false)
        }
    }
    
    /*func testSetAppSetting() {
     
    }*/
    
    /*func testGetAppSetting() {
     
    }*/
    
    #if !os(Linux)
    func testNSLocalizedString() {
        XCTAssert(NSLocalizedString("") == "")
    }
    #endif
}
