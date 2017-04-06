//
//  ArrayExtensionTests.swift
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

class ArrayExtensionTests: XCTestCase {
    static let allTests = [
        ("testCircleObjectAt", testCircleObjectAt),
        ("testRandom", testRandom),
        ("testRemove", testRemove),
        ("testSafeObjectAt", testSafeObjectAt),
        ("testSwapFromTo", testSwapFromTo),
        ("testShuffle", testShuffle),
        ("testShuffled", testShuffled)
    ]
    
    var array = [1, 2, 3, 4, 5]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCircleObjectAt() {
        let objectRight = array.circleObject(at: 6)
        let objectLeft = array.circleObject(at: -6)
        
        XCTAssertEqual(objectRight, 2)
        XCTAssertEqual(objectLeft, 5)
    }
    
    func testRandom() {
        var random: [Int] = []
        
        for _ in 1...100 {
            random.append(array.random())
        }
        
        if random.contains(1) {
            XCTAssertTrue(true)
        } else {
            XCTFail()
        }
        if random.contains(2) {
            XCTAssertTrue(true)
        } else {
            XCTFail()
        }
        if random.contains(3) {
            XCTAssertTrue(true)
        } else {
            XCTFail()
        }
        if random.contains(4) {
            XCTAssertTrue(true)
        } else {
            XCTFail()
        }
        if random.contains(5) {
            XCTAssertTrue(true)
        } else {
            XCTFail()
        }
    }
    
    func testRemove() {
        var arrayCopy = array
        arrayCopy.remove(4)
        XCTAssertEqual(arrayCopy, [1, 2, 3, 5])
    }
    
    func testSafeObjectAt() {
        let object = array.safeObject(at: 4)
        let objectNil = array.safeObject(at: 6)
        
        XCTAssertEqual(object, 5)
        XCTAssertNil(objectNil)
    }
    
    func testSwapFromTo() {
        array.swap(from: 0, to: 4)
        
        XCTAssertEqual(array[4], 1)
        XCTAssertEqual(array[0], 2)
        
        array.swap(from: 5, to: 6)
        
        XCTAssertEqual(array[0], 2)
    }
    
    func testShuffle() {
        array.shuffle()
        
        XCTAssertEqual(array.count, 5)
    }
    
    func testShuffled() {
        let shuffled = array.shuffled()
        
        XCTAssertEqual(shuffled.count, 5)
    }
}
