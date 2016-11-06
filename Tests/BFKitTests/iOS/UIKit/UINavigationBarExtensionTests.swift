//
//  UINavigationBarExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 05/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UINavigationBarExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSetTrasparentTraslucent() {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        navigationBar.setTransparent(true, translucent: false)
        
        XCTAssertFalse(navigationBar.isTranslucent)
        XCTAssertNotNil(navigationBar.backgroundImage(for: .default))
        XCTAssertNotNil(navigationBar.shadowImage)
        
        navigationBar.setTransparent(false, translucent: true)
        
        XCTAssertTrue(navigationBar.isTranslucent)
        XCTAssert(navigationBar.backgroundImage(for: .default) == nil)
        XCTAssert(navigationBar.shadowImage == nil)
    }
}
