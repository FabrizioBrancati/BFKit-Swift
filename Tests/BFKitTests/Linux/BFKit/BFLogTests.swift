//
//  BFLogTests.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
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

import XCTest
import Foundation
@testable import BFKit

class BFLogTests: XCTestCase {
    static let allTests = [
        ("testBFLog", testBFLog),
        ("testBFLogString", testBFLogString),
        ("testBFLogDetailedString", testBFLogDetailedString),
        ("testBFLogClear", testBFLogClear)
    ]
    
    override func setUp() {
        super.setUp()
        
        BFLog.active = true
        
        BFLog.log("Test")
    }
    
    override func tearDown() {
        super.tearDown()
        
        BFLog.clear()
    }
    
    func testBFLog() {
        XCTAssert(BFLog.logged == "Test\n")
    }
    
    func testBFLogString() {
        BFLog.log("Test")
        
        XCTAssert(BFLog.logged == "Test\nTest\n")
    }
    
    func testBFLogDetailedString() {
        BFLog.clear()
        
        let filenameWithoutExtension = NSURL(string: String(describing: NSString(utf8String: #file)!))!.deletingPathExtension!.lastPathComponent
        let function = #function
        let line = #line + 2
        
        BFLog.log("Test")
        
        XCTAssert(BFLog.detailedLog == "(\(filenameWithoutExtension):\(line) (\(function)) Test\n")
    }
    
    func testBFLogClear() {
        BFLog.clear()
        
        XCTAssert(BFLog.logged == "")
    }
}
