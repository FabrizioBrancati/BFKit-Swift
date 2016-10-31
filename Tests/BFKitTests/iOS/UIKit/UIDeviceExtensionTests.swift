//
//  UIDeviceExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 31/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIDeviceExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOsVersionEqual() {
        let osVersion = osVersionEqual("10.0")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersion() {
        let osVersion = UIDevice.osVersion
        
        XCTAssert(osVersion == "10.0")
    }
}

