//
//  NSObjectExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 23/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class NSObjectExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsValid() {
        let object = NSObject()
        let nullObject = NSNull()
        
        XCTAssertTrue(object.isValid())
        XCTAssertFalse(nullObject.isValid())
    }
}
