//
//  StringExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 24/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class StringExtensionTests: XCTestCase {
    var string = ""
    
    override func setUp() {
        super.setUp()
        
        string = "This is a test"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFloatValue() {
        let float = "3.5".floatValue
        
        XCTAssertTrue(float == 3.5)
    }
    
    func testIntValue() {
        let int = "3".intValue
        
        XCTAssertTrue(int == 3)
    }
    
    func testDataValue() {
        guard string.dataValue != nil else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(true)
    }
    
    func testURLEncoded() {
        let encoded = string.urlEncoded
        
        XCTAssertTrue(encoded == "This%20is%20a%20test")
    }
    
    func testBase64Encoded() {
        let encoded = string.base64encoded
        
        XCTAssertTrue(encoded == "VGhpcyBpcyBhIHRlc3Q=")
    }
    
    func testBase64Decoded() {
        let decoded = "VGhpcyBpcyBhIHRlc3Q=".base64decoded
        
        XCTAssertTrue(decoded == string)
    }
    
    func testLength() {
        let length = string.length
        
        XCTAssertTrue(length == 14)
    }
    
    func testChatacterAt() {
        let character = string.character(at: 2)
        
        XCTAssertTrue(character == "i")
    }
    
    func testSubstringFromIndex() {
        let substring = string.substring(from: 5)
        
        XCTAssertTrue(substring == "is a test")
    }
    
    func testSubstringFromCharacter() {
        let substring = string.substring(from: " ")
        
        XCTAssertTrue(substring == "is a test")
    }
    
    func testSubstringToIndex() {
        let substring = string.substring(to: 9)
        
        XCTAssertTrue(substring == "This is a")
    }
    
    func testSubstringToCharacter() {
        let substring = string.substring(to: "t")
        
        XCTAssertTrue(substring == "This is a ")
    }
    
    func testSubstringWithRange() {
        let substring = string.substring(with: 0..<9)
        
        XCTAssertTrue(substring == "This is a")
    }
    
    func testSubstringWithCountableClosedRange() {
        let substring = string.substring(with: 0...9)
        
        XCTAssertTrue(substring == "This is a")
    }
    
    func testIndexOf() {
        let index = string.index(of: "s")
        
        XCTAssertTrue(index == 3)
    }
    
    func testRangeOfCaseSensitive() {
        let hasString = string.range(of: "is", caseSensitive: true)
        
        XCTAssertTrue(hasString)
    }
    
    func testIsEmail() {
        let isNotEmail = string.isEmail()
        let isEmail = "test@test.test".isEmail()
        
        XCTAssertFalse(isNotEmail)
        XCTAssertTrue(isEmail)
    }
    
    func testBase64Encode() {
        let encoded = string.base64encode()
        
        XCTAssertTrue(encoded == "VGhpcyBpcyBhIHRlc3Q=")
    }
    
    func testBase64Decode() {
        let decoded = "VGhpcyBpcyBhIHRlc3Q=".base64decode()
        
        XCTAssertTrue(decoded == string)
    }
    
    func testData() {
        guard string.data() != nil else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(true)
    }
    
    func testSentenceCapitalizedString() {
        let capitalized = string.sentenceCapitalizedString()
        let notCapitalized = "this is a test".sentenceCapitalizedString()
        
        XCTAssertTrue(capitalized == "This is a test")
        XCTAssertTrue(notCapitalized == "This is a test")
    }
}
