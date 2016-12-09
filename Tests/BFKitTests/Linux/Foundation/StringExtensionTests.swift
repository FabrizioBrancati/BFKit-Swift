//
//  StringExtensionTests.swift
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

class StringExtensionTests: XCTestCase {
    static let allTests = [
        ("testFloatValue", testFloatValue),
        ("testIntValue", testIntValue),
        ("testDataValue", testDataValue),
        ("testURLEncoded", testURLEncoded),
        ("testBase64Encoded", testBase64Encoded),
        ("testBase64Decoded", testBase64Decoded),
        ("testLength", testLength),
        ("testChatacterAt", testChatacterAt),
        ("testSubstringFromIndex", testSubstringFromIndex),
        ("testSubstringFromCharacter", testSubstringFromCharacter),
        ("testSubstringToIndex", testSubstringToIndex),
        ("testSubstringToCharacter", testSubstringToCharacter),
        ("testSubstringWithRange", testSubstringWithRange),
        ("testSubstringWithCountableClosedRange", testSubstringWithCountableClosedRange),
        ("testIndexOf", testIndexOf),
        ("testRangeOfCaseSensitive", testRangeOfCaseSensitive),
        ("testOccurrencesOfCaseSensitive", testOccurrencesOfCaseSensitive),
        ("testSentenceCapitalizedString", testSentenceCapitalizedString),
        ("testLocalize", testLocalize),
        ("testLastPathComponent", testLastPathComponent),
        ("testPathExtension", testPathExtension),
        ("testDeletingLastPathComponent", testDeletingLastPathComponent),
        ("testDeletingPathExtension", testDeletingPathExtension),
        ("testPathComponents", testPathComponents),
        ("testAppendigPathComponent", testAppendigPathComponent),
        ("testAppendigPathExtension", testAppendigPathExtension),
        ("testReadableUUID", testReadableUUID),
        ("testUppercasedFirst", testUppercasedFirst),
        ("testLowercasedFirst", testLowercasedFirst),
        ("testReversedPreserveFormat", testReversedPreserveFormat),
        ("testHasUppercaseCharacters", testHasUppercaseCharacters),
        ("testHasLowercaseCharacters", testHasLowercaseCharacters),
        ("testRemoveExtraSpaces", testRemoveExtraSpaces),
        ("testCountLowercasedCharacters", testCountLowercasedCharacters),
        ("testCountUppercasedCharacters", testCountUppercasedCharacters),
        ("testCountNumbers", testCountNumbers),
        ("testCountSymbols", testCountSymbols),
        ("testStringFromHEX", testStringFromHEX),
        ("testIsAnagramOf", testIsAnagramOf),
        ("testIsPalindrome", testIsPalindrome),
        ("testSubscriptIndexCharacter", testSubscriptIndexCharacter),
        ("testSubscriptCharacter", testSubscriptCharacter),
        ("testSubsriptIndexInt", testSubsriptIndexInt),
        ("testSubscriptRange", testSubscriptRange)
    ]
    
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
    
    func testOccurrencesOfCaseSensitive() {
        let occurrences = string.occurrences(of: "i")
        
        XCTAssertTrue(occurrences == 2)
    }
    
    func testSentenceCapitalizedString() {
        let capitalized = string.sentenceCapitalizedString()
        let notCapitalized = "this is a test".sentenceCapitalizedString()
        
        XCTAssert(capitalized == "This is a test")
        XCTAssert(notCapitalized == "This is a test")
    }
    
    func testLocalize() {
        let localized = string.localize()
        
        XCTAssert(localized == "This is a test")
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
        let readable = "FB0B0EBF-A783-41E5-87B0-6BE16B19585D".readableUUID()
        
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
    
    func testIsAnagramOf() {
        let anagram = string.reversed()
        
        XCTAssertTrue(string.isAnagram(of: anagram))
    }
    
    func testIsPalindrome() {
        let palindrome = "Test tset"
        
        XCTAssertTrue(palindrome.isPalindrome())
    }
    
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
        func testIsEmail() {
            let isNotEmail = string.isEmail()
            let isEmail = "test@test.test".isEmail()
            
            XCTAssertFalse(isNotEmail)
            XCTAssertTrue(isEmail)
        }
    
        func testIsUUID() {
            let isUUID = "FB0B0EBF-A783-41E5-87B0-6BE16B19585D".isUUID()
            
            XCTAssertTrue(isUUID)
        }
        
        func testIsUUIDForAPNS() {
            let isUUIDForAPNS = "FB0B0EBF-A783-41E5-87B0-6BE16B19585D".isUUIDForAPNS()
            
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
    
        func testLinks() {
            do {
                let links = try "http://www.fabriziobrancati.com www.fabriziobrancati.com".links()
                
                XCTAssert(links.count == 2)
            } catch {
                XCTFail()
            }
        }
    
        func testDates() {
            do {
                let dates = try "5/12/1992 28/02/16".dates()
                
                XCTAssert(dates.count == 2)
            } catch {
                XCTFail()
            }
        }
    
        func testHashtags() {
            do {
                let hashtags = try "#FabrizioBrancati #BrancatiFabrizio".hashtags()
                
                XCTAssert(hashtags.count == 2)
            } catch {
                XCTFail()
            }
        }
        
        func testMentions() {
            do {
                let mentions = try "@FabrizioBrancati @BrancatiFabrizio".mentions()
                
                XCTAssert(mentions.count == 2)
            } catch {
                XCTFail()
            }
        }
    #endif
}
