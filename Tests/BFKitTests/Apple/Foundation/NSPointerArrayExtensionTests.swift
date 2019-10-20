//
//  NSPointerArrayExtensionTests.swift
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

internal class NSPointerArrayExtensionTests: XCTestCase {
    internal static let allTests = [
        ("testAdd", testAdd),
        ("testInsert", testInsert),
        ("testReplace", testReplace),
        ("testGet", testGet),
        ("testRemove", testRemove)
    ]
    
    internal let array = NSPointerArray.weakObjects()
    
    internal func testAdd() {
        let array1 = NSArray(array: [1, 2])
        let array2 = NSArray(array: [3, 4])
        
        array.add(array1)
        array.add(array2)
        array.add(nil)
        
        let array1Test: NSArray = array.object(at: 0) as! NSArray // swiftlint:disable:this force_cast
        let array2Test: NSArray = array.object(at: 1) as! NSArray // swiftlint:disable:this force_cast
        
        XCTAssertEqual(array1Test, array1)
        XCTAssertEqual(array2Test, array2)
    }
    
    internal func testInsert() {
        let array1 = NSArray(array: [1, 2])
        let array2 = NSArray(array: [3, 4])
        
        array.add(array1)
        array.insert(array2, at: 0)
        array.insert(nil, at: 0)
        
        let array1Test: NSArray = array.object(at: 0) as! NSArray // swiftlint:disable:this force_cast
        let array2Test: NSArray = array.object(at: 1) as! NSArray // swiftlint:disable:this force_cast
        
        XCTAssertEqual(array1Test, array2)
        XCTAssertEqual(array2Test, array1)
    }
    
    internal func testReplace() {
        let array1 = NSArray(array: [1, 2])
        let array2 = NSArray(array: [3, 4])
        
        array.add(array1)
        array.replace(at: 0, with: array2)
        array.replace(at: 0, with: nil)
        
        let array1Test: NSArray = array.object(at: 0) as! NSArray // swiftlint:disable:this force_cast
        
        XCTAssertEqual(array1Test, array2)
    }
    
    internal func testGet() {
        let array1 = NSArray(array: [1, 2])
        
        array.add(array1)
        
        let array1Test: NSArray = array.object(at: 0) as! NSArray // swiftlint:disable:this force_cast
        let arrayNil = array.object(at: 10)
        
        XCTAssertEqual(array1Test, array1)
        XCTAssertNil(arrayNil)
    }
    
    internal func testRemove() {
        let array1 = NSArray(array: [1, 2])
        let array2 = NSArray(array: [3, 4])
        
        array.add(array1)
        array.add(array2)
        array.remove(at: 0)
        array.remove(at: 10)
        
        let array2Test = array.object(at: 0) as! NSArray // swiftlint:disable:this force_cast
        
        XCTAssertEqual(array2Test, array2)
    }
}
