//
//  NumberExtensionTests.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2017 Fabrizio Brancati. All rights reserved.
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

class NumberExtensionTests: XCTestCase {
    static let allTests = [
        ("testDegreesToRadians", testDegreesToRadians),
        ("testRadiansToDegrees", testRadiansToDegrees),
        ("testRandomIntMinMax", testRandomIntMinMax),
        ("testRandomIntRange", testRandomIntRange),
        ("testRandomFloat", testRandomFloat),
        ("testRandomFloatMinMax", testRandomFloatMinMax),
        ("testIntArray", testIntArray),
        ("testFloatArray", testFloatArray),
        ("testDoubleArray", testDoubleArray)
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDegreesToRadians() {
        let radians = degreesToRadians(180)
        
        XCTAssert(radians > 3.14 && radians < 3.15)
    }
    
    func testRadiansToDegrees() {
        let degrees = radiansToDegrees(Float.pi)
        
        XCTAssert(degrees >= 179 && degrees <= 181)
    }
    
    func testRandomIntMinMax() {
        var random: [Int] = []
        
        for _ in 0...10 {
            random.append(randomInt(min: 0, max: 1))
        }
        
        if random.contains(0) {
            XCTAssertTrue(true)
        } else {
            XCTFail("`testRandomIntMinMax` error")
        }
        if random.contains(1) {
            XCTAssertTrue(true)
        } else {
            XCTFail("`testRandomIntMinMax` error")
        }
    }
    
    func testRandomIntRange() {
        var random: [Int] = []
        
        for _ in 0...10 {
            random.append(randomInt(range: 0...1))
        }
        
        if random.contains(0) {
            XCTAssertTrue(true)
        } else {
            XCTFail("`testRandomIntRange` error")
        }
        if random.contains(1) {
            XCTAssertTrue(true)
        } else {
            XCTFail("`testRandomIntRange` error")
        }
    }
    
    func testRandomFloat() {
        let random = randomFloat()
        
        XCTAssert(random >= 0.0 && random <= 1.0)
    }
    
    func testRandomFloatMinMax() {
        let random = randomFloat(min: 2.0, max: 2.5)
        
        XCTAssert(random >= 2.0 && random <= 2.5)
    }
    
    func testIntArray() {
        let int = 123456
        let negInt = -3895
        XCTAssertEqual(int.array, [1, 2, 3, 4, 5, 6])
        XCTAssertEqual(negInt.array, [0, 3, 8, 9, 5])
    }
    
    func testFloatArray() {
        let float: Float = 92.456
        XCTAssertEqual(float.array, [9, 2, 0, 4, 5, 6])
    }
    
    func testDoubleArray() {
        let double: Double = 832.746201
        XCTAssertEqual(double.array, [8, 3, 2, 0, 7, 4, 6, 2, 0, 1])
    }
}
