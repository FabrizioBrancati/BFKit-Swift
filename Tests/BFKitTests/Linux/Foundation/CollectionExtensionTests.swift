//
//  CollectionExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 17/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class CollectionExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testJSON() {
        let array = [1, 2, 3, 4, 5]
        
        do {
            let json = try array.json()
            
            XCTAssert(json == "[1,2,3,4,5]")
        } catch {
            XCTFail()
        }
        
        let dictionary = ["1": 1, "2": 2, "3": 3, "4": 4, "5": 5]
        
        do {
            let json = try dictionary.json()
            
            XCTAssert(json == "{\"4\":4,\"2\":2,\"1\":1,\"5\":5,\"3\":3}")
        } catch {
            XCTFail()
        }
    }
}
