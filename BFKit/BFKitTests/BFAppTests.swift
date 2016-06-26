//
//  BFAppTests.swift
//  BFKit
//
//  Created by Fabrizio on 26/06/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import BFKit

class BFAppTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testBFLocalizedString() {
        XCTAssert(BFLocalizedString("BFKit") == "BFKit")
    }
    
    func testNSLocalizedString() {
        XCTAssert(NSLocalizedString("") == "")
    }
    
    func testDebug() {
        BFApp.debug { 
            XCTAssert(true)
        }
    }
    
    func testIsFirstStart() {
        let isFirstStart = BFApp.isFirstStart()
        XCTAssert(isFirstStart == true || isFirstStart == false)
    }
    
    func testIsFirstStartVersion() {
        XCTAssert(BFApp.isFirstStart(version: AppVersion) == false)
    }
    
    func testOnFirstStart() {
        BFApp.onFirstStart { (isFirstStart) in
            XCTAssert(isFirstStart == true || isFirstStart == false)
        }
    }
    
    func testOnFirstStartVersion() {
        BFApp.onFirstStart(version: AppVersion) { (isFirstStart) in
            XCTAssert(isFirstStart == false)
        }
    }
}
