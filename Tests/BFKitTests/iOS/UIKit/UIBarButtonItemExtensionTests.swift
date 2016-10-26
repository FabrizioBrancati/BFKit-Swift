//
//  UIBarButtonItemExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 23/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIBarButtonItemExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitBarButtonSpaceTypeWidth() {
        let barButtonItemFlexible = UIBarButtonItem(barButtonSpaceType: .flexibleSpace)
        let barButtonItemFixed = UIBarButtonItem(barButtonSpaceType: .fixedSpace, width: 100)
        let barButtonItemDone = UIBarButtonItem(barButtonSpaceType: .done, width: 100)
        
        XCTAssert(barButtonItemFlexible.width == 0)
        
        XCTAssert(barButtonItemFixed.width == 100)
        
        XCTAssert(barButtonItemDone.width == 0)
    }
}
