//
//  BFPasswordTests.swift
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

internal class BFPasswordTests: XCTestCase {
    internal static let allTests = [
        ("testStrengthVeryWeak", testStrengthVeryWeak),
        ("testStrengthWeak", testStrengthWeak),
        ("testStrengthAverage", testStrengthAverage),
        ("testStrengthStrong", testStrengthStrong),
        ("testStrengthVeryStrong", testStrengthVeryStrong),
        ("testStrengthSecure", testStrengthSecure),
        ("testStrengthVerySecure", testStrengthVerySecure)
    ]
    
    internal func testEmpty() {
        let password = "" // swiftlint:disable:this hardcoded_credential
        let strength = BFPassword.strength(password: password)
        
        XCTAssertEqual(strength, .veryWeak)
    }
    
    internal func testStrengthVeryWeak() {
        let password = "Test9"
        let strength = BFPassword.strength(password: password)
        
        XCTAssertEqual(strength, .veryWeak)
        
        let password2 = "te"
        let strength2 = BFPassword.strength(password: password2)
        
        XCTAssertEqual(strength2, .veryWeak)
        
        let password3 = "t!"
        let strength3 = BFPassword.strength(password: password3)
        
        XCTAssertEqual(strength3, .veryWeak)
    }
    
    internal func testStrengthWeak() {
        let password = "Test992"
        let strength = BFPassword.strength(password: password)
        
        XCTAssertEqual(strength, .weak)
    }
    
    internal func testStrengthAverage() {
        let password = "TestPassword92"
        let strength = BFPassword.strength(password: password)
        
        XCTAssertEqual(strength, .average)
    }
    
    internal func testStrengthStrong() {
        let password = "TestPassword9!!"
        let strength = BFPassword.strength(password: password)
        
        XCTAssertEqual(strength, .strong)
    }
    
    internal func testStrengthVeryStrong() {
        let password = "TestPassword92!?="
        let strength = BFPassword.strength(password: password)
        
        XCTAssertEqual(strength, .veryStrong)
    }
    
    internal func testStrengthSecure() {
        let password = "TestPassword992!!!!"
        let strength = BFPassword.strength(password: password)
        
        XCTAssertEqual(strength, .secure)
    }
    
    internal func testStrengthVerySecure() {
        let password = "TestPasswordP992=?!)"
        let strength = BFPassword.strength(password: password)
        
        XCTAssertEqual(strength, .verySecure)
    }
}
