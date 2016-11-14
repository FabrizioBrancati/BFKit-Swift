//
//  DataExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 13/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class DataExtensionTests: XCTestCase {
    let data = Data(base64Encoded: "VGhpcyBpcyBhIHRlc3Q=")!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testToUTF8() {
        guard let utf8: String = data.toUTF8() else {
            XCTFail()
            return
        }
        
        XCTAssert(utf8 == "This is a test")
    }
    
    func testToASCII() {
        guard let ascii: String = data.toASCII() else {
            XCTFail()
            return
        }
        
        XCTAssert(ascii == "This is a test")
    }
    
    /*func testReadableUUID() {
        
    }*/
}
