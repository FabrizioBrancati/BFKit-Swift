//
//  BFDataStructuresTests.swift
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

class BFDataStructuresTests: XCTestCase {
    static let allTests = [
        ("testListDescription", testListDescription),
        ("testListDeleteIndex", testListDeleteIndex),
        ("testListDeleteElement", testListDeleteElement),
        ("testListInsert", testListInsert),
        ("testListSearchIndex", testListSearchIndex),
        ("testListSearchElement", testListSearchElement),
        ("testQueueDescription", testQueueDescription),
        ("testQueueDequeue", testQueueDequeue),
        ("testQueueEmpty", testQueueEmpty),
        ("testQueueEnqueue", testQueueEnqueue),
        ("testQueueTop", testQueueTop),
        ("testStackDescription", testStackDescription),
        ("testStackEmpty", testStackEmpty),
        ("testStackPop", testStackPop),
        ("testStackPush", testStackPush)
    ]
    
    var list = List<Int>()
    var queue = Queue<Int>()
    var stack = Stack<Int>()
    
    override func setUp() {
        super.setUp()
        
        list.insert(1)
        list.insert(2)
        list.insert(3)
        
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - List tests
    
    func testListDescription() {
        XCTAssert(list.description != "")
    }
    
    func testListDeleteIndex() {
        list.delete(at: 0)
        
        XCTAssert(list.count == 2, "List hasn't 2 elements")
        XCTAssert(list.search(at: 0) == 2, "Element 0 of the list is not 2")
        XCTAssert(list.search(at: 1) == 3, "Element 1 of the list is not 3")
    }
    
    func testListDeleteElement() {
        XCTAssert(list.delete(1), "Element delete error")
        XCTAssert(list.count == 2, "List hasn't 2 elements")
        XCTAssert(list.search(at: 0) == 2, "Element 0 of the list is not 2")
        XCTAssert(list.search(at: 1) == 3, "Element 1 of the list is not 3")
    }
    
    func testListInsert() {
        list.insert(4)
        
        XCTAssert(list.count == 4)
    }
    
    func testListSearchIndex() {
        XCTAssert(list.search(at: 0) == 1)
    }
    
    func testListSearchElement() {
        XCTAssert(list.search(1) == 0)
    }
    
    // MARK: - Queue tests
    
    func testQueueDescription() {
        XCTAssert(queue.description != "")
    }
    
    func testQueueDequeue() {
        XCTAssert(queue.dequeue())
        XCTAssert(queue.dequeue())
        XCTAssert(queue.dequeue())
        XCTAssertFalse(queue.dequeue())
    }
    
    func testQueueEmpty() {
        queue.empty()
        XCTAssertFalse(queue.dequeue())
    }
    
    func testQueueEnqueue() {
        queue.enqueue(4)
        XCTAssert(queue.count == 4)
    }
    
    func testQueueTop() {
        XCTAssert(queue.top() == 1)
    }
    
    // MARK: - Stack tests
    
    func testStackDescription() {
        XCTAssert(stack.description != "")
    }
    
    func testStackEmpty() {
        XCTAssert(stack.empty() == false)
    }
    
    func testStackPop() {
        let element = stack.pop()
        
        XCTAssert(stack.count == 2)
        XCTAssert(element == 3)
    }
    
    func testStackPush() {
        stack.push(4)
        
        XCTAssert(stack.count == 4)
    }
}
