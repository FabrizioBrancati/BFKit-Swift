//
//  UIPasteboardExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 05/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIPasteboardExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCopy() {
        UIPasteboard.copy(text: "This is a test")
        
        XCTAssert(UIPasteboard.general.string == "This is a test")
    }
    
    func testGet() {
        let pasteboard = UIPasteboard.getString()
        
        XCTAssert(pasteboard == "This is a test")
    }
}
