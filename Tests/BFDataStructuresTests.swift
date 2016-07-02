//
//  BFDataStructuresTests.swift
//  BFKit
//
//  Created by Fabrizio on 29/06/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class BFDataStructuresTests: XCTestCase {
    var list = List<Int>()
    
    override func setUp() {
        super.setUp()
        
        list.insert(1)
        list.insert(2)
        list.insert(3)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: List tests
    
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
}
