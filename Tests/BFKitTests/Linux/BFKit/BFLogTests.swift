//
//  BFLogTests.swift
//  BFKit
//
//  Created by Fabrizio on 02/07/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

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
        
        BFLogActive = true
        
        BFLog("Test")
    }
    
    override func tearDown() {
        super.tearDown()
        
        BFLogClear()
    }
    
    func testBFLog() {
        XCTAssert(BFLogString == "Test\n")
    }
    
    func testBFLogString() {
        BFLog("Test")
        
        XCTAssert(BFLogString == "Test\nTest\n")
    }
    
    func testBFLogDetailedString() {
        BFLogClear()
        
        let filenameWithoutExtension = NSURL(string: String(describing: NSString(utf8String: #file)!))!.deletingPathExtension!.lastPathComponent
        let function = #function
        let line = #line + 2
        
        BFLog("Test")
        
        XCTAssert(BFLogDetailedString == "(\(filenameWithoutExtension):\(line) (\(function)) Test\n")
    }
    
    func testBFLogClear() {
        BFLogClear()
        
        XCTAssert(BFLogString == "")
    }
}
