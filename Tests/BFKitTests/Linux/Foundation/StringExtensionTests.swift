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
    var path = ""
    
    override func setUp() {
        super.setUp()
        
        string = "This is a test"
        path = "This/is/a/test/file.test"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFloatValue() {
        let float = "3.5".floatValue
        
        XCTAssert(float == 3.5)
    }
    
    func testIntValue() {
        let int = "3".intValue
        
        XCTAssert(int == 3)
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
        
        XCTAssert(encoded == "This%20is%20a%20test")
    }
    
    func testBase64Encoded() {
        let encoded = string.base64encoded
        
        XCTAssert(encoded == "VGhpcyBpcyBhIHRlc3Q=")
    }
    
    func testBase64Decoded() {
        let decoded = "VGhpcyBpcyBhIHRlc3Q=".base64decoded
        
        XCTAssert(decoded == string)
    }
    
    func testLength() {
        let length = string.length
        
        XCTAssert(length == 14)
    }
    
    func testChatacterAt() {
        let character = string.character(at: 2)
        
        XCTAssert(character == "i")
    }
    
    func testSubstringFromIndex() {
        let substring = string.substring(from: 5)
        
        XCTAssert(substring == "is a test")
    }
    
    func testSubstringFromCharacter() {
        let substring = string.substring(from: " ")
        
        XCTAssert(substring == "is a test")
    }
    
    func testSubstringToIndex() {
        let substring = string.substring(to: 9)
        
        XCTAssert(substring == "This is a")
    }
    
    func testSubstringToCharacter() {
        let substring = string.substring(to: "t")
        
        XCTAssert(substring == "This is a ")
    }
    
    func testSubstringWithRange() {
        let substring = string.substring(with: 0..<9)
        
        XCTAssert(substring == "This is a")
    }
    
    func testSubstringWithCountableClosedRange() {
        let substring = string.substring(with: 0...9)
        
        XCTAssert(substring == "This is a")
    }
    
    func testIndexOf() {
        let index = string.index(of: "s")
        
        XCTAssert(index == 3)
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
    
    func testSentenceCapitalizedString() {
        let capitalized = string.sentenceCapitalizedString()
        let notCapitalized = "this is a test".sentenceCapitalizedString()
        
        XCTAssert(capitalized == "This is a test")
        XCTAssert(notCapitalized == "This is a test")
    }
    
    func testLastPathComponent() {
        let lastPathComponent = path.lastPathComponent
        
        XCTAssert(lastPathComponent == "file.test")
    }
    
    func testPathExtension() {
        let pathExtension = path.pathExtension
        
        XCTAssert(pathExtension == "test")
    }
    
    func testDeletingLastPathComponent() {
        let deletedLastPathComponent = path.deletingLastPathComponent
        
        XCTAssert(deletedLastPathComponent == "This/is/a/test")
    }
    
    func testDeletingPathExtension() {
        let deletedPathExtension = path.deletingPathExtension
        
        XCTAssert(deletedPathExtension == "This/is/a/test/file")
    }
    
    func testPathComponents() {
        let pathComponents = path.pathComponents
        
        XCTAssert(pathComponents.count == 5)
    }
    
    func testAppendigPathComponent() {
        let finalPath = path.appendingPathComponent("test")
        
        XCTAssert(finalPath == "This/is/a/test/file.test/test")
    }
    
    func testAppendigPathExtension() {
        let finalPath = path.appendingPathExtension("test")
        
        XCTAssert(finalPath == "This/is/a/test/file.test.test")
    }
    
    func testReadableUUID() {
        let readable = UIDevice.generateUniqueIdentifier().readableUUID()
        
        XCTAssert(readable.length == 32)
    }
    
    func testUppercasedFirst() {
        let uppercased = string.uppercasedFirst()
        
        XCTAssert(uppercased == "This is a test")
    }
    
    func testLowercasedFirst() {
        let lowercased = string.lowercasedFirst()
        
        XCTAssert(lowercased == "this is a test")
    }
    
    func testReversedPreserveFormat() {
        let reversed = string.reversed()
        
        XCTAssert(reversed == "tset a si sihT")
    }
    
    func testHasUppercaseCharacters() {
        let hasCharacters = string.hasUppercasedCharacters()
        
        XCTAssertTrue(hasCharacters)
    }
    
    func testHasLowercaseCharacters() {
        let hasCharacters = string.hasLowercasedCharacters()
        
        XCTAssertTrue(hasCharacters)
    }
    
    func testRemoveExtraSpaces() {
        let extraSpacedString = "This    is   a   test".removeExtraSpaces()
        
        XCTAssert(extraSpacedString == "This is a test")
    }
    
    func testCountLowercasedCharacters() {
        let lowercased = string.countLowercasedCharacters()
        
        XCTAssert(lowercased == 10)
    }
    
    func testCountUppercasedCharacters() {
        let uppercased = string.countUppercasedCharacters()
        
        XCTAssert(uppercased == 1)
    }
    
    func testCountNumbers() {
        let numbers = string.countNumbers()
        
        XCTAssert(numbers == 0)
    }
    
    func testCountSymbols() {
        let symbols = string.countSymbols()
        
        XCTAssert(symbols == 0)
    }
    
    func testStringFromHEX() {
        let stringFromHEX = "68 65 6c 6c 6f".stringFromHEX()
        
        XCTAssert(stringFromHEX == "hello")
    }
    
    /*func testHEXSpacing() {
        let hex = "hello".hex(spacing: true)
        
        XCTAssert(hex == "68 65 6c 6c 6f")
    }*/
    
    func testSubscriptIndexCharacter() {
        let character: Character = string[0]
        
        XCTAssert(character == "T")
    }
    
    func testSubscriptCharacter() {
        let index = string["i"]
        
        XCTAssert(index == 2)
    }
    
    func testSubsriptIndexInt() {
        let characterString: String = string[0]
        
        XCTAssert(characterString == "T")
    }
    
    func testSubscriptRange() {
        let range = string[0..<8]
        
        XCTAssert(range == "This is ")
    }
    
    #if !os(Linux)
        func testIsUUID() {
            let isUUID = UIDevice.generateUniqueIdentifier().isUUID()
            
            XCTAssertTrue(isUUID)
        }
        
        func testIsUUIDForAPNS() {
            let isUUIDForAPNS = UIDevice.generateUniqueIdentifier().isUUIDForAPNS()
            
            XCTAssertFalse(isUUIDForAPNS)
        }
        
        func testReplacingMatchesRegexWith() {
            do {
                let replaced = try string.replacingMatches(regex: "\\s", with: "A")
                
                XCTAssert(replaced == "Thisisatest")
            } catch {
                XCTFail()
            }
        }
    #endif
}
