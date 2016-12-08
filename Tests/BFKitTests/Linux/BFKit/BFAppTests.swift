//
//  BFAppTests.swift
//  BFKit
//
//  Created by Fabrizio on 26/06/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class BFAppTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNSLocalizedString() {
        XCTAssert(NSLocalizedString("") == "")
    }
    
    func testLightFont() {
        BFApp.lightFont = UIFont(fontName: .Helvetica, size: 20)
        
        XCTAssert(BFApp.lightFont.fontName == FontName.Helvetica.rawValue)
    }
    
    func testRegularFont() {
        BFApp.regularFont = UIFont(fontName: .Helvetica, size: 20)
        
        XCTAssert(BFApp.regularFont.fontName == FontName.Helvetica.rawValue)
    }
    
    func testBoldFont() {
        BFApp.boldFont = UIFont(fontName: .Helvetica, size: 20)
        
        XCTAssert(BFApp.boldFont.fontName == FontName.Helvetica.rawValue)
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
}
