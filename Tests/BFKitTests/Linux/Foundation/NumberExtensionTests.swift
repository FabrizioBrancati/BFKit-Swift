//
//  NumberExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 23/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class NumberExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDegreesToRadians() {
        let radians = degreesToRadians(180)
        
        XCTAssert(radians > 3.14 && radians < 3.15)
    }
    
    func testRadiansToDegrees() {
        let degrees = radiansToDegrees(Float(π))
        
        XCTAssert(degrees >= 179 && degrees <= 181)
    }
    
    func testRandomIntMinMax() {
        let random = randomInt(min: 10, max: 100)
        
        XCTAssert(random >= 10 && random <= 100)
    }
    
    func testRandomIntRange() {
        let random = randomInt(range: 10...100)
        
        XCTAssert(random >= 10 && random <= 100)
    }
    
    func testRandomFloat() {
        let random = randomFloat()
        
        XCTAssert(random >= 0.0 && random <= 1.0)
    }
    
    func testRandomFloatMinMax() {
        let random = randomFloat(min: 2.0, max: 2.5)
        
        XCTAssert(random >= 2.0 && random <= 2.5)
    }
}
