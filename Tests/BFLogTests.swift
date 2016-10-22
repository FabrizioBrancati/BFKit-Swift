//
//  BFLogTests.swift
//  BFKit
//
//  Created by Fabrizio on 02/07/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class BFLogTests: XCTestCase {
    override func setUp() {
        BFLog("Test")
        
        super.setUp()
    }
    
    override func tearDown() {
        BFLogClear()
        
        super.tearDown()
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
        
        let filenameWithoutExtension = NSURL(string: NSString(utf8String: #file)! as String)!.deletingPathExtension!.lastPathComponent
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
