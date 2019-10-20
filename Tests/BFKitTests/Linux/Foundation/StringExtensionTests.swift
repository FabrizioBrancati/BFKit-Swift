//
//  StringExtensionTests.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2019 Fabrizio Brancati.
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

@testable import BFKit
import Foundation
import XCTest

internal class StringExtensionTests: XCTestCase {
    internal static let allTests = [
        ("testArray", testArray),
        ("testFloatValue", testFloatValue),
        ("testIntValue", testIntValue),
        ("testDataValue", testDataValue),
        ("testURLEncoded", testURLEncoded),
        ("testLocalized", testLocalized),
        ("testNumberValue", testNumberValue),
        ("testBase64Encoded", testBase64Encoded),
        ("testBase64Decoded", testBase64Decoded),
        ("testChatacterAt", testChatacterAt),
        ("testSubstringFromIndex", testSubstringFromIndex),
        ("testSubstringFromCharacter", testSubstringFromCharacter),
        ("testSubstringToIndex", testSubstringToIndex),
        ("testSubstringToCharacter", testSubstringToCharacter),
        ("testSubstringWithRange", testSubstringWithRange),
        ("testSubstringWithCountableClosedRange", testSubstringWithCountableClosedRange),
        ("testIndexOf", testIndexOf),
        ("testRangeOfCaseSensitive", testRangeOfCaseSensitive),
        ("testHasCaseSensitive", testHasCaseSensitive),
        ("testOccurrencesOfCaseSensitive", testOccurrencesOfCaseSensitive),
        ("testSentenceCapitalizedString", testSentenceCapitalizedString),
        ("testQueryStringParameter", testQueryStringParameter),
        ("testQueryDictionary", testQueryDictionary),
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
        ("testReplacingOccurrencesOfWith", testReplacingOccurrencesOfWith),
        ("testCountLowercasedCharacters", testCountLowercasedCharacters),
        ("testCountUppercasedCharacters", testCountUppercasedCharacters),
        ("testCountNumbers", testCountNumbers),
        ("testCountPunctuations", testCountPunctuations),
        ("testStringFromHEX", testStringFromHEX),
        ("testIsAnagramOf", testIsAnagramOf),
        ("testIsPalindrome", testIsPalindrome),
        ("testSubscriptIndexCharacter", testSubscriptIndexCharacter),
        ("testSubscriptCharacter", testSubscriptCharacter),
        ("testSubsriptIndexInt", testSubsriptIndexInt),
        ("testSubscriptRange", testSubscriptRange),
        ("testOptionalDefaultValue", testOptionalDefaultValue)
    ]
    
    internal var string: String = ""
    internal var path: String = ""
    
    override internal func setUp() {
        super.setUp()
        
        string = "This is a test"
        path = "This/is/a/test/file.test"
    }
    
    internal func testArray() {
        let str = string.array
        XCTAssertEqual(str, ["T", "h", "i", "s", " ", "i", "s", " ", "a", " ", "t", "e", "s", "t"])
    }
    
    internal func testFloatValue() {
        let float = "3.5".floatValue
        
        XCTAssertEqual(float, 3.5)
    }
    
    internal func testIntValue() {
        let int = "3".intValue
        
        XCTAssertEqual(int, 3)
    }
    
    internal func testDataValue() {
        guard string.dataValue != nil else {
            XCTFail("`testDataValue` error")
            return
        }
        
        XCTAssertTrue(true)
    }
    
    internal func testURLEncoded() {
        let encoded = string.urlEncoded
        
        XCTAssertEqual(encoded, "This%20is%20a%20test")
    }
    
    internal func testLocalized() {
        let localized = "This is a test".localized
        
        XCTAssertEqual(localized, "This is a test")
    }
    
    internal func testNumberValue() {
        let numberString = "42".numberValue
        
        XCTAssertEqual(numberString, 42)
    }
    
    internal func testBase64Encoded() {
        let encoded = string.base64encoded
        var encodedNil: String?
        
        encodedNil = encodedNil?.base64encoded
        
        XCTAssertEqual(encoded, "VGhpcyBpcyBhIHRlc3Q=")
        XCTAssertNil(encodedNil)
    }
    
    internal func testBase64Decoded() {
        let decoded = "VGhpcyBpcyBhIHRlc3Q=".base64decoded
        let decodedInvalid = "Test".base64decoded
        
        XCTAssertEqual(decoded, string)
        XCTAssertNotEqual(decodedInvalid, string)
    }
    
    internal func testChatacterAt() {
        let character = string.character(at: 2)
        
        XCTAssertEqual(character, "i")
    }
    
    internal func testSubstringFromIndex() {
        let substring = string.substring(from: 5)
        
        XCTAssertEqual(substring, "is a test")
    }
    
    internal func testSubstringFromCharacter() {
        let substring = string.substring(from: " ")
        let substringInvalid = string.substring(from: "r")
        
        XCTAssertEqual(substring, "is a test")
        XCTAssertEqual(substringInvalid, "")
    }
    
    internal func testSubstringToIndex() {
        let substring = string.substring(to: 9)
        
        XCTAssertEqual(substring, "This is a")
    }
    
    internal func testSubstringToCharacter() {
        let substring = string.substring(to: "t")
        let substringInvalid = string.substring(to: "r")
        
        XCTAssertEqual(substring, "This is a ")
        XCTAssertEqual(substringInvalid, "")
    }
    
    internal func testSubstringWithRange() {
        let substring = string.substring(with: 0..<9)
        
        XCTAssertEqual(substring, "This is a")
    }
    
    internal func testSubstringWithCountableClosedRange() {
        let substring = string.substring(with: 0...8)
        
        XCTAssertEqual(substring, "This is a")
    }
    
    internal func testIndexOf() {
        let index = string.index(of: "s")
        let indexInvalid = string.index(of: "r")
        
        XCTAssertEqual(index, 3)
        XCTAssertEqual(indexInvalid, -1)
    }
    
    internal func testRangeOfCaseSensitive() {
        let hasString = string.range(of: "is", caseSensitive: true)
        let hasStringInsensitive = string.range(of: "test", caseSensitive: false)
        
        XCTAssertTrue(hasString)
        XCTAssertTrue(hasStringInsensitive)
    }
    
    internal func testHasCaseSensitive() {
        let hasString = string.has("is", caseSensitive: true)
        
        XCTAssertTrue(hasString)
    }
    
    internal func testOccurrencesOfCaseSensitive() {
        let occurrences = string.occurrences(of: "i", caseSensitive: true)
        let occurrencesInsensitive = string.occurrences(of: "I", caseSensitive: false)
        
        XCTAssertTrue(occurrences == 2)
        XCTAssertTrue(occurrencesInsensitive == 2)
    }
    
    internal func testSentenceCapitalizedString() {
        let capitalized = string.sentenceCapitalizedString()
        let notCapitalized = "this is a test".sentenceCapitalizedString()
        let zeroLength = "".sentenceCapitalizedString()
        
        XCTAssertEqual(capitalized, "This is a test")
        XCTAssertEqual(notCapitalized, "This is a test")
        XCTAssertEqual(zeroLength, "")
    }
    
    internal func testQueryStringParameter() {
        let url = "https://www.google.com/search?q=test&oq=test&sourceid=chrome&ie=UTF-8"
        let parameter = url.queryStringParameter(parameter: "sourceid")
        
        XCTAssertEqual(parameter, "chrome")
    }
    
    internal func testQueryDictionary() {
        let url = "q=test&oq=test&sourceid=chrome&ie=UTF-8"
        let parameters = url.queryDictionary()
        
        XCTAssertEqual(parameters, ["q": "test", "oq": "test", "sourceid": "chrome", "ie": "UTF-8"])
    }
    
    internal func testLastPathComponent() {
        let lastPathComponent = path.lastPathComponent
        
        XCTAssertEqual(lastPathComponent, "file.test")
    }
    
    internal func testPathExtension() {
        let pathExtension = path.pathExtension
        
        XCTAssertEqual(pathExtension, "test")
    }
    
    internal func testDeletingLastPathComponent() {
        let deletedLastPathComponent = path.deletingLastPathComponent
        
        XCTAssertEqual(deletedLastPathComponent, "This/is/a/test")
    }
    
    internal func testDeletingPathExtension() {
        let deletedPathExtension = path.deletingPathExtension
        
        XCTAssertEqual(deletedPathExtension, "This/is/a/test/file")
    }
    
    internal func testPathComponents() {
        let pathComponents = path.pathComponents
        
        XCTAssertEqual(pathComponents.count, 5)
    }
    
    internal func testAppendigPathComponent() {
        let finalPath = path.appendingPathComponent("test")
        
        XCTAssertEqual(finalPath, "This/is/a/test/file.test/test")
    }
    
    internal func testAppendigPathExtension() {
        let finalPath = path.appendingPathExtension("test")
        
        XCTAssertEqual(finalPath, "This/is/a/test/file.test.test")
    }
    
    internal func testReadableUUID() {
        let readable = "FB0B0EBF-A783-41E5-87B0-6BE16B19585D".readableUUID()
        
        XCTAssertEqual(readable.count, 32)
    }
    
    internal func testUppercasedFirst() {
        let uppercased = string.uppercasedFirst()
        
        XCTAssertEqual(uppercased, "This is a test")
    }
    
    internal func testLowercasedFirst() {
        let lowercased = string.lowercasedFirst()
        
        XCTAssertEqual(lowercased, "this is a test")
    }
    
    internal func testReversedPreserveFormat() {
        let reversed = string.reversed(preserveFormat: false)
        let zeroLength = "".reversed(preserveFormat: false)
        let preservingFormat = (string + " ").reversed(preserveFormat: true)
        
        XCTAssertEqual(reversed, "tset a si sihT")
        XCTAssertEqual(zeroLength, "")
        XCTAssertEqual(preservingFormat, "tset a si Siht")
    }
    
    internal func testHasUppercaseCharacters() {
        let hasCharacters = string.hasUppercasedCharacters()
        
        XCTAssertTrue(hasCharacters)
    }
    
    internal func testHasLowercaseCharacters() {
        let hasCharacters = string.hasLowercasedCharacters()
        
        XCTAssertTrue(hasCharacters)
    }
    
    internal func testRemoveExtraSpaces() {
        let extraSpacedString = "This    is   a   test".removeExtraSpaces()
        let extraSpacedEmojiString = "😜   This    is   a   test     😁".removeExtraSpaces()
        
        XCTAssertEqual(extraSpacedString, "This is a test")
        XCTAssertEqual(extraSpacedEmojiString, "😜 This is a test 😁")
    }
    
    internal func testReplacingOccurrencesOfWith() {
        let replaced = string.replacingOccurrences(of: ["This", "test"], with: "A")
        
        XCTAssertEqual(replaced, "A is a A")
    }
    
    internal func testCountLowercasedCharacters() {
        let lowercased = string.countLowercasedCharacters()
        
        XCTAssertEqual(lowercased, 10)
    }
    
    internal func testCountUppercasedCharacters() {
        let uppercased = string.countUppercasedCharacters()
        
        XCTAssertEqual(uppercased, 1)
    }
    
    internal func testCountNumbers() {
        let numbers = string.countNumbers()
        
        XCTAssertEqual(numbers, 0)
    }
    
    internal func testCountPunctuations() {
        let symbols = string.countPunctuations()
        let hasSymbols = "-.,!/".countPunctuations()
        
        XCTAssertEqual(symbols, 0)
        XCTAssertEqual(hasSymbols, 5)
    }
    
    internal func testStringFromHEX() {
        let stringFromHEX = "68 65 6c 6c 6f".stringFromHEX()
        
        XCTAssertEqual(stringFromHEX, "hello")
    }
    
    internal func testIsAnagramOf() {
        let anagram = string.reversed(preserveFormat: false)
        
        XCTAssertTrue(string.isAnagram(of: anagram))
    }
    
    internal func testIsPalindrome() {
        let palindrome = "Test tset"
        
        XCTAssertTrue(palindrome.isPalindrome())
    }
    
    internal func testSubscriptIndexCharacter() {
        let character: Character = string[0]
        
        XCTAssertEqual(character, "T")
    }
    
    internal func testSubscriptCharacter() {
        let index = string["i"]
        
        XCTAssertEqual(index, 2)
    }
    
    internal func testSubsriptIndexInt() {
        let characterString: String = string[0]
        
        XCTAssertEqual(characterString, "T")
    }
    
    internal func testSubscriptRange() {
        let range = string[0..<8]
        
        XCTAssertEqual(range, "This is ")
    }
    
    internal func testOptionalDefaultValue() {
        var testNil: String?
        testNil = testNil ??? "Test"
        let testNotNil = "Test" ??? "Nil"
        
        XCTAssertEqual(testNil, "Test")
        XCTAssertEqual(testNotNil, "Test")
    }
    
    internal func testIsUUID() {
        let isUUID = "FB0B0EBF-A783-41E5-87B0-6BE16B19585D".isUUID()
        
        XCTAssertTrue(isUUID)
    }
    
    internal func testIsUUIDForAPNS() {
        let isUUIDForAPNS = "FB0B0EBF-A783-41E5-87B0-6BE16B19585D".isUUIDForAPNS()
        
        XCTAssertFalse(isUUIDForAPNS)
    }
    
    internal func testReplacingMatchesRegexWith() {
        do {
            let replaced = try string.replacingMatches(regex: "\\s", with: "A")
            
            XCTAssertEqual(replaced, "Thisisatest")
        } catch {
            XCTFail("`testReplacingMatchesRegexWith` error")
        }
    }
    
    internal func testLocalize() {
        let localized = string.localize()
        
        XCTAssertEqual(localized, "This is a test")
    }
    
    #if !os(Linux)
        internal func testIsEmail() {
            let isNotEmail = string.isEmail()
            let isEmail = "test@test.test".isEmail()
            
            XCTAssertFalse(isNotEmail)
            XCTAssertTrue(isEmail)
        }

        internal func testLinks() {
            do {
                let links = try "http://www.fabriziobrancati.com www.fabriziobrancati.com".links()
                
                XCTAssertEqual(links.count, 2)
            } catch {
                XCTFail("`testLinks` error")
            }
        }

        internal func testDates() {
            do {
                let dates = try "5/12/1992 28/02/16".dates()
                
                XCTAssertEqual(dates.count, 2)
            } catch {
                XCTFail("`testDates` error")
            }
        }
    
        internal func testHashtags() {
            do {
                let hashtags = try "#FabrizioBrancati #BrancatiFabrizio".hashtags()
                
                XCTAssertEqual(hashtags.count, 2)
            } catch {
                XCTFail("`testHashtags` error")
            }
        }
    
        internal func testMentions() {
            do {
                let mentions = try "@FabrizioBrancati @BrancatiFabrizio".mentions()
                
                XCTAssertEqual(mentions.count, 2)
            } catch {
                XCTFail("`testMentions` error")
            }
        }
    
        internal func testIsURLValid() {
            let url = "https://www.google.com/search?q=test&oq=test&sourceid=chrome&ie=UTF-8"
            let isValid = url.isURLValid()
            
            XCTAssertTrue(isValid)
        }
    #endif
}
