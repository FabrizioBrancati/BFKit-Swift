//
//  ArrayExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 13/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
@testable import BFKit

class ArrayExtensionTests: XCTestCase {
    var array = [1, 2, 3, 4, 5]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSafeObjectAt() {
        let object = array.safeObject(at: 4)
        let objectNil = array.safeObject(at: 6)
        
        XCTAssert(object == 5)
        XCTAssert(objectNil == nil)
    }
    
    func testCircleObjectAt() {
        let object = array.circleObject(at: 6)
        
        XCTAssert(object == 2)
    }
    
    func testMoveFromTo() {
        array.move(from: 0, to: 5)
        
        XCTAssert(array[4] == 1)
    }
}
