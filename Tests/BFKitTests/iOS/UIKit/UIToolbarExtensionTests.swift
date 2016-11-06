//
//  UIToolbarExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 06/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIToolbarExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetTrasparentTraslucent() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        toolbar.setTransparent(true, translucent: false)
        
        XCTAssertFalse(toolbar.isTranslucent)
        XCTAssertNotNil(toolbar.backgroundImage(forToolbarPosition: .any, barMetrics: .default))
        XCTAssertNotNil(toolbar.shadowImage(forToolbarPosition: .any))
        
        toolbar.setTransparent(false, translucent: true)
        
        XCTAssertTrue(toolbar.isTranslucent)
        XCTAssert(toolbar.backgroundImage(forToolbarPosition: .any, barMetrics: .default) == nil)
        XCTAssert(toolbar.shadowImage(forToolbarPosition: .any) == nil)
    }
}
