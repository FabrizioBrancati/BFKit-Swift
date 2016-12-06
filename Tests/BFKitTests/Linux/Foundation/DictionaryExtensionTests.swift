//
//  DictionaryExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 17/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
@testable import BFKit

class DictionaryExtensionTests: XCTestCase {
    static let allTests = [
        ("testSafeObjectForKey", testSafeObjectForKey)
    ]
    
    let dictionary = ["1": 1, "2": 2, "3": 3, "4": 4, "5": 5]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSafeObjectForKey() {
        let object: Int = dictionary.safeObject(forKey: "4") as! Int
        let objectNil = dictionary.safeObject(forKey: "6")
        
        XCTAssert(object == 4)
        XCTAssert(objectNil == nil)
    }
}
