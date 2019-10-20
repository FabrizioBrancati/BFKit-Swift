//
//  DateExtensionTests.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2019 Fabrizio Brancati.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

@testable import BFKit
import Foundation
import XCTest

internal class DateExtensionTests: XCTestCase {
    internal static let allTests = [
        ("testYear", testYear),
        ("testMonth", testMonth),
        ("testDay", testDay),
        ("testHour", testHour),
        ("testMinute", testMinute),
        ("testSecond", testSecond),
        ("testWeekday", testWeekday),
        ("testInitYearMonthDayHourMinuteSecond", testInitYearMonthDayHourMinuteSecond),
        ("testInitParseFormat", testInitParseFormat),
        ("testInitDateTime", testInitDateTime),
        ("testInitISO8601", testInitISO8601),
        ("testDaysBetween", testDaysBetween),
        ("testIsToday", testIsToday),
        ("testIsSameDay", testIsSameDay),
        ("testAddingDays", testAddingDays),
        ("testAddDays", testAddDays),
        ("testYearString", testYearString),
        ("testDateString", testDateString),
        ("testShortDate", testShortDate),
        ("testIsGreaterThan", testIsGreaterThan),
        ("testIsLessThan", testIsLessThan),
        ("testIsEqual", testIsEqual),
        ("testYesterday", testYesterday),
        ("testDecriptionDateSeparatorUSFormatNanosecond", testDecriptionDateSeparatorUSFormatNanosecond)
//        ("testISO8601", testISO8601),
//        ("testNanosecond", testNanosecond),
//        ("testMonthsBetween", testMonthsBetween),
//        ("testLocalizedWeekday", testLocalizedWeekday),
//        ("testLocalizedMonth", testLocalizedMonth)
    ]
    
    internal var date = Date(year: 2016, month: 10, day: 9, hour: 10, minute: 9, second: 30)! // swiftlint:disable:this force_unwrapping
    
    internal func testYear() {
        date.year = 2017
        
        XCTAssertEqual(date.year, 2017)
        XCTAssertEqual(date.month, 10)
        XCTAssertEqual(date.day, 9)
        XCTAssertEqual(date.hour, 10)
        XCTAssertEqual(date.minute, 9)
        XCTAssertEqual(date.second, 30)
    }
    
    internal func testMonth() {
        date.month = 11
        
        XCTAssertEqual(date.year, 2016)
        XCTAssertEqual(date.month, 11)
        XCTAssertEqual(date.day, 9)
        XCTAssertEqual(date.hour, 10)
        XCTAssertEqual(date.minute, 9)
        XCTAssertEqual(date.second, 30)
    }
    
    internal func testDay() {
        date.day = 10
        
        XCTAssertEqual(date.year, 2016)
        XCTAssertEqual(date.month, 10)
        XCTAssertEqual(date.day, 10)
        XCTAssertEqual(date.hour, 10)
        XCTAssertEqual(date.minute, 9)
        XCTAssertEqual(date.second, 30)
    }
    
    internal func testHour() {
        date.hour = 11
        
        XCTAssertEqual(date.year, 2016)
        XCTAssertEqual(date.month, 10)
        XCTAssertEqual(date.day, 9)
        XCTAssertEqual(date.hour, 11)
        XCTAssertEqual(date.minute, 9)
        XCTAssertEqual(date.second, 30)
    }
    
    internal func testMinute() {
        date.minute = 10
        
        XCTAssertEqual(date.year, 2016)
        XCTAssertEqual(date.month, 10)
        XCTAssertEqual(date.day, 9)
        XCTAssertEqual(date.hour, 10)
        XCTAssertEqual(date.minute, 10)
        XCTAssertEqual(date.second, 30)
    }
    
    internal func testSecond() {
        date.second = 40
        
        XCTAssertEqual(date.year, 2016)
        XCTAssertEqual(date.month, 10)
        XCTAssertEqual(date.day, 9)
        XCTAssertEqual(date.hour, 10)
        XCTAssertEqual(date.minute, 9)
        XCTAssertEqual(date.second, 40)
    }
    
    internal func testWeekday() {
        XCTAssertEqual(date.weekday, 1)
    }
    
    internal func testInitYearMonthDayHourMinuteSecond() {
        guard let newDate = Date(year: 2016, month: 10, day: 9) else {
            XCTFail("`testInitYearMonthDayHourMinuteSecond` error")
            return
        }
        
        XCTAssertEqual(newDate.year, 2016)
        XCTAssertEqual(newDate.month, 10)
        XCTAssertEqual(newDate.day, 9)
    }
    
    internal func testInitParseFormat() {
        guard let parsed = Date(parse: "2016-10-09") else {
            XCTFail("`testInitParseFormat` error")
            return
        }
        
        XCTAssertEqual(parsed.year, 2016)
        XCTAssertEqual(parsed.month, 10)
        XCTAssertEqual(parsed.day, 9)
    }
    
    internal func testInitDateTime() {
        guard let newDate = Date(year: 2016, month: 10, day: 9), let composed = Date(date: newDate, time: date) else {
            XCTFail("`testInitDateTime` error")
            return
        }
        
        XCTAssertEqual(composed.year, 2016)
        XCTAssertEqual(composed.month, 10)
        XCTAssertEqual(composed.day, 9)
        XCTAssertEqual(composed.hour, 10)
        XCTAssertEqual(composed.minute, 9)
    }
    
    internal func testInitISO8601() {
        let iso8601: String = "2016-10-09T10:30:45.500Z"
        let date = Date(iso8601: iso8601)
        
        XCTAssertEqual(date?.year, 2016)
        XCTAssertEqual(date?.month, 10)
        XCTAssertEqual(date?.day, 9)
        XCTAssertEqual(date?.hour, 10 + TimeZone.current.secondsFromGMT() / 60 / 60)
        XCTAssertEqual(date?.minute, 30)
        XCTAssertEqual(date?.second, 45)
        
        let iso8601Empty: String = ""
        let dateNil = Date(iso8601: iso8601Empty)
        
        XCTAssertNil(dateNil)
    }
    
    internal func testDaysBetween() {
        guard let newDate = Date(year: 2016, month: 9, day: 9) else {
            XCTFail("`testDaysBetween` error")
            return
        }
        let daysBetween = newDate.daysBetween(date)
        
        XCTAssertEqual(daysBetween, 30)
    }
    
    internal func testIsToday() {
        let isToday = date.isToday()
        
        XCTAssertFalse(isToday)
    }
    
    internal func testIsSameDay() {
        guard let newDate = Date(year: 2016, month: 10, day: 9) else {
            XCTFail("`testIsSameDay` error")
            return
        }
        let isSame = newDate.isSame(date)
        
        XCTAssertTrue(isSame)
    }
    
    internal func testAddingDays() {
        guard let dateAdded = date.addingDays(10) else {
            XCTFail("`testAddingDays` error")
            return
        }
        date = dateAdded
        
        XCTAssertEqual(date.year, 2016)
        XCTAssertEqual(date.month, 10)
        XCTAssertEqual(date.day, 19)
    }
    
    internal func testAddDays() {
        date.addDays(10)
        
        XCTAssertEqual(date.year, 2016)
        XCTAssertEqual(date.month, 10)
        XCTAssertEqual(date.day, 19)
    }
    
    internal func testYearString() {
        let year = date.yearString()
        
        XCTAssertEqual(year, "2016")
    }
    
    internal func testDateString() {
        let dateString = date.dateString()
        
        XCTAssertEqual(dateString, "2016-10-09")
    }
    
    internal func testShortDate() {
        let shortDate = date.shortDate()
        
        XCTAssertEqual(shortDate.year, 2016)
        XCTAssertEqual(shortDate.month, 10)
        XCTAssertEqual(shortDate.day, 9)
    }
    
    internal func testIsGreaterThan() {
        guard let newDate = Date(year: 2016, month: 11, day: 9) else {
            XCTFail("`testIsGreaterThan` error")
            return
        }
        let isGreaterThan = newDate.isGreaterThan(date)
        
        XCTAssertTrue(isGreaterThan)
    }
    
    internal func testIsLessThan() {
        guard let newDate = Date(year: 2016, month: 9, day: 9) else {
            XCTFail("`testIsLessThan` error")
            return
        }
        let isLessThan = newDate.isLessThan(date)
        
        XCTAssertTrue(isLessThan)
    }
    
    internal func testIsEqual() {
        guard let newDate = Date(year: 2016, month: 10, day: 9) else {
            XCTFail("`testIsEqual` error")
            return
        }
        let isEqual = newDate.isEqual(date)
        
        XCTAssertTrue(isEqual)
    }
    
    internal func testYesterday() {
        let yesterday = date.yesterday()
        
        XCTAssertEqual(yesterday.year, 2016)
        XCTAssertEqual(yesterday.month, 10)
        XCTAssertEqual(yesterday.day, 8)
    }
    
    internal func testDecriptionDateSeparatorUSFormatNanosecond() {
        let description = date.description(dateSeparator: "-", usFormat: false, nanosecond: false)
        
        XCTAssertEqual(description, "10-09-2016 10:09:30")
    }
    
    #if !os(Linux)
        internal func testISO8601() {
            var isoDate = date
            isoDate.hour = 12
            let iso8601: String = isoDate.iso8601()
            
            XCTAssertEqual(iso8601, "\(isoDate.year)-\(isoDate.month)-0\(isoDate.day)T\(isoDate.hour - TimeZone.current.secondsFromGMT() / 60 / 60):0\(isoDate.minute):\(isoDate.second).00\(isoDate.nanosecond)Z")
        }
    #endif
    
    internal func testNanosecond() {
        XCTAssertEqual(date.nanosecond, 0)
    }

    internal func testMonthsBetween() {
        guard let newDate = Date(year: 2016, month: 5, day: 9) else {
            XCTFail("`testMonthsBetween` error")
            return
        }
        let monthsBetween = newDate.monthsBetween(date)
        
        XCTAssertEqual(monthsBetween, 5)
    }

    internal func testLocalizedWeekday() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let localizedWeekday = date.localizedWeekday()
        
        XCTAssert(localizedWeekday == "Monday" || localizedWeekday == "Lunedì")
    }
    
    internal func testLocalizedMonth() {
        let date = Date(timeIntervalSinceReferenceDate: 0)
        let localizedMonth = date.localizedMonth()
        
        XCTAssert(localizedMonth == "January" || localizedMonth == "Gennaio")
    }
}
