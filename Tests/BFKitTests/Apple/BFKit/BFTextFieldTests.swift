//
//  BFTextFieldTests.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati. All rights reserved.
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
import UIKit
@testable import BFKit

class BFTextFieldTests: XCTestCase {
    weak var textField: BFTextField? = BFTextField(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEncodeDecode() {
        FileManager.default.savePlist(object: textField!, in: .cache, filename: "BFTextField")
        let decoded = FileManager.default.readPlist(from: .cache, filename: "BFTextField") as? BFTextField
        
        XCTAssertEqual(decoded?.frame, CGRect(x: 0, y: 0, width: 320, height: 30))
    }
    
    func testInitFrame() {
        XCTAssertEqual(textField?.maxNumberOfCharacters, 0)
        XCTAssertEqual(textField?.frame.size.width, 320)
    }
    
    func testTextFieldDidChange() {
        textField?.maxNumberOfCharacters = 20
        textField?.text = "Testing"
        
        XCTAssertEqual(textField?.text, "Testing")
        
        textField?.text = "TestingMoreThan20Characters"
        NotificationCenter.default.post(name: .UITextFieldTextDidChange, object: textField)
        
        XCTAssertEqual(textField!.text?.count, 20)
    }
    
    func testDeinit() {
        textField = nil
        XCTAssertNil(textField)
    }
}
