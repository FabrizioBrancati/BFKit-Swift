//
//  DateExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 13/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class DateExtensionTests: XCTestCase {
    var date = Date(year: 2016, month: 10, day: 9, hour: 10, minute: 9, second: 30)!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testYear() {
        date.year = 2017
        
        XCTAssert(date.year == 2017)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
    }
    
    func testMonth() {
        date.month = 11
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 11)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
    }
    
    func testDay() {
        date.day = 10
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 10)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
    }
    
    func testHour() {
        date.hour = 11
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 11)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
    }
    
    func testMinute() {
        date.minute = 10
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 10)
        XCTAssert(date.second == 30)
    }
    
    func testSecond() {
        date.second = 40
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 40)
    }
    
    func testNanosecond() {
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
        XCTAssert(date.nanosecond == 0)
    }
    
    func testWeekday() {
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
        XCTAssert(date.nanosecond == 0)
        XCTAssert(date.weekday == 1)
    }
}
