//
//  ArrayExtensionTests.swift
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

internal class ArrayExtensionTests: XCTestCase {
    internal static let allTests = [
        ("testFlattenEmpty", testFlattenEmpty),
        ("testFlattenOneElement", testFlattenOneElement),
        ("testFlattenNestedElements", testFlattenNestedElements),
        ("testFlattenMixed", testFlattenMixed),
        ("testIsNotEmpty", testIsNotEmpty),
        ("testCircleObjectAt", testCircleObjectAt),
        ("testRandom", testRandom),
        ("testRemove", testRemove),
        ("testSafeObjectAt", testSafeObjectAt),
        ("testSwapFromTo", testSwapFromTo),
        ("testShuffle", testShuffle),
        ("testShuffled", testShuffled)
    ]
    
    internal var array = [1, 2, 3, 4, 5]
    
    internal func testFlattenEmpty() {
        let flattened: [Int]? = flatten([]) as? [Int]
        
        XCTAssertNotNil(flattened)
        XCTAssertEqual(flattened ?? [], [])
    }
    
    internal func testFlattenOneElement() {
        let flattened: [Int]? = flatten([1])
        
        XCTAssertNotNil(flattened)
        XCTAssertEqual(flattened ?? [], [1])
    }
    
    internal func testFlattenNestedElements() {
        let flattened: [Int]? = flatten([1, 2, [3, 4, [5, 6]], 7, [[[[[8]]]]]]) as? [Int]
        
        XCTAssertNotNil(flattened)
        XCTAssertEqual(flattened ?? [], [1, 2, 3, 4, 5, 6, 7, 8])
    }
    
    internal func testFlattenMixed() {
        let flattened: [Any]? = flatten([1, 2.0, ["3", true, [5, 6]], 7, [[[[[8]]]]]])
        
        XCTAssertNotNil(flattened)
        XCTAssertEqual(flattened?[0] as? Int, 1)
        XCTAssertEqual(flattened?[1] as? Double, 2.0)
        XCTAssertEqual(flattened?[2] as? String, "3")
        XCTAssertEqual(flattened?[3] as? Bool, true)
        XCTAssertEqual(flattened?[4] as? Int, 5)
        XCTAssertEqual(flattened?[5] as? Int, 6)
        XCTAssertEqual(flattened?[6] as? Int, 7)
        XCTAssertEqual(flattened?[7] as? Int, 8)
    }
    
    internal func testIsNotEmpty() {
        XCTAssertTrue(array.isNotEmpty)
    }
    
    internal func testCircleObjectAt() {
        let objectRight = array.circleObject(at: 6)
        let objectLeft = array.circleObject(at: -6)
        
        XCTAssertEqual(objectRight, 2)
        XCTAssertEqual(objectLeft, 5)
    }
    
    internal func testRandom() {
        var random: [Int] = []
        
        for _ in 1...100 {
            random.append(array.random())
        }
        
        if random.contains(1) {
            XCTAssertTrue(true)
        } else {
            XCTFail("`testRandom` error")
        }
        if random.contains(2) {
            XCTAssertTrue(true)
        } else {
            XCTFail("`testRandom` error")
        }
        if random.contains(3) {
            XCTAssertTrue(true)
        } else {
            XCTFail("`testRandom` error")
        }
        if random.contains(4) {
            XCTAssertTrue(true)
        } else {
            XCTFail("`testRandom` error")
        }
        if random.contains(5) {
            XCTAssertTrue(true)
        } else {
            XCTFail("`testRandom` error")
        }
    }
    
    internal func testRemove() {
        var arrayCopy = array
        arrayCopy.remove(4)
        XCTAssertEqual(arrayCopy, [1, 2, 3, 5])
    }
    
    internal func testSafeObjectAt() {
        let object = array.safeObject(at: 4)
        let objectNil = array.safeObject(at: 6)
        
        XCTAssertEqual(object, 5)
        XCTAssertNil(objectNil)
    }
    
    internal func testSwapFromTo() {
        array.swap(from: 0, to: 4)
        
        XCTAssertEqual(array[4], 1)
        XCTAssertEqual(array[0], 2)
        
        array.swap(from: 5, to: 6)
        
        XCTAssertEqual(array[0], 2)
    }
    
    internal func testShuffle() {
        array.shuffle()
        
        XCTAssertEqual(array.count, 5)
    }
    
    internal func testShuffled() {
        let shuffled = array.shuffled()
        
        XCTAssertEqual(shuffled.count, 5)
    }
}
