//
//  BFDateTests.swift
//  BFKit
//
//  Created by Fabrizio on 22/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class BFDateTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStaticLocalizedWeekday() {
        let localizedWeekday = Date.localizedWeekday(weekday: 1)
        
        XCTAssert(localizedWeekday == "Sunday")
    }
    
    func testStaticLocalizedMonth() {
        let localizedMonth = Date.localizedMonth(month: 1)
        
        XCTAssert(localizedMonth == "January")
    }
    
    func testLocalizedWeekday() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let localizedWeekday = date.localizedWeekday()
        
        XCTAssert(localizedWeekday == "Monday")
    }
    
    func testLocalizedMonth() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let localizedMonth = date.localizedMonth()
        
        XCTAssert(localizedMonth == "January")
    }
}
