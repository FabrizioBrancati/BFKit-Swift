//
//  CollectionExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 17/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
@testable import BFKit

class CollectionExtensionTests: XCTestCase {
    static let allTests = [
        ("testJSON", testJSON)
    ]
    
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
            
            let braceLeft = json.occurrences(of: "{")
            let braceRight = json.occurrences(of: "}")
            let quotationMarks = json.occurrences(of: "\"")
            
            XCTAssertTrue(braceLeft == 1)
            XCTAssertTrue(braceRight == 1)
            XCTAssertTrue(quotationMarks == 10)
        } catch {
            XCTFail()
        }
    }
}
