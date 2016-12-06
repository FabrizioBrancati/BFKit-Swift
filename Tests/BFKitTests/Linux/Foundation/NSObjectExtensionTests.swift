//
//  NSObjectExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 23/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
@testable import BFKit

class NSObjectExtensionTests: XCTestCase {
    static let allTests = [
        ("testIsValid", testIsValid)
    ]
    
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
