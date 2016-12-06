//
//  DataExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 13/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
@testable import BFKit

class DataExtensionTests: XCTestCase {
    static let allTests = [
        ("testUTF8", testUTF8),
        ("testASCII", testASCII)
    ]
    
    let data = Data(base64Encoded: "VGhpcyBpcyBhIHRlc3Q=")!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUTF8() {
        guard let utf8: String = data.utf8() else {
            XCTFail()
            return
        }
        
        XCTAssert(utf8 == "This is a test")
    }
    
    func testASCII() {
        guard let ascii: String = data.ascii() else {
            XCTFail()
            return
        }
        
        XCTAssert(ascii == "This is a test")
    }
    
    /*func testReadableUUID() {
        
    }*/
}
