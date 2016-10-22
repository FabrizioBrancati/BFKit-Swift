//
//  BFPasswordTests.swift
//  BFKit
//
//  Created by Fabrizio on 22/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class BFPasswordTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStrength() {
        let password = "TestPassword92"
        let strength = BFPassword.strength(password)
        
        XCTAssert(strength == .average)
    }
}
