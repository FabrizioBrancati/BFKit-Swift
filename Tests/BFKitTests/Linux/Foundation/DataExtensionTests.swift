//
//  DataExtensionTests.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati.
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

class DataExtensionTests: XCTestCase {
    static let allTests = [
        ("testUTF8", testUTF8),
        ("testASCII", testASCII),
        ("testReadableUUID", testReadableUUID)
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
            XCTFail("`testUTF8` error")
            return
        }
        
        XCTAssertEqual(utf8, "This is a test")
    }
    
    func testASCII() {
        guard let ascii: String = data.ascii() else {
            XCTFail("`testASCII` error")
            return
        }
        
        XCTAssertEqual(ascii, "This is a test")
    }
    
    func testReadableUUID() {
        let uuid = "<EFCE4D7D 539A 42C2 80DB 934ACBA28AD3>".data(using: String.Encoding.utf8)?.readableUUID()
        
        XCTAssertNotNil(uuid)
    }
}
