//
//  NumberExtensionTests.swift
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

internal class NumberExtensionTests: XCTestCase {
    internal static let allTests = [
        ("testDegreesToRadians", testDegreesToRadians),
        ("testRadiansToDegrees", testRadiansToDegrees),
        ("testIntArray", testIntArray),
        ("testFloatArray", testFloatArray),
        ("testDoubleArray", testDoubleArray)
    ]
    
    internal func testDegreesToRadians() {
        let radians = degreesToRadians(180)
        
        XCTAssert(radians > 3.14 && radians < 3.15)
    }
    
    internal func testRadiansToDegrees() {
        let degrees = radiansToDegrees(Double.pi)
        
        XCTAssert(degrees >= 179 && degrees <= 181)
    }
    
    internal func testIntArray() {
        let int = 123_456
        let negInt = -3895
        XCTAssertEqual(int.array, [1, 2, 3, 4, 5, 6])
        XCTAssertEqual(negInt.array, [0, 3, 8, 9, 5])
    }
    
    internal func testFloatArray() {
        let float: Float = 92.456
        XCTAssertEqual(float.array, [9, 2, 0, 4, 5, 6])
    }
    
    internal func testDoubleArray() {
        let double: Double = 832.746_201
        XCTAssertEqual(double.array, [8, 3, 2, 0, 7, 4, 6, 2, 0, 1])
    }
    
    internal func testComparisionMajorMinorButNotEqual() {
        let number = 10
        
        XCTAssertTrue(number <> (9, 11))
        XCTAssertFalse(number <> (9, 10))
        XCTAssertFalse(number <> (11, 12))
    }
    
    internal func testComparisionMajorMinorEqual() {
        let number = 10
        
        XCTAssertTrue(number <=> (10, 11))
        XCTAssertTrue(number <=> (10, 10))
        XCTAssertFalse(number <=> (1, 9))
        XCTAssertFalse(number <=> (11, 19))
    }
}
