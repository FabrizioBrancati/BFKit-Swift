//
//  ThreadExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 23/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
@testable import BFKit

class ThreadExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRunOnMainThread() {
        let testExpectation = expectation(description: "Run on Main Thread")
        
        runOnMainThread {
            XCTAssertTrue(true)
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Something went horribly wrong.")
        })
    }
    
    func testRunInBackgroun() {
        let testExpectation = expectation(description: "Run in Background")
        
        runInBackground {
            XCTAssertTrue(true)
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Something went horribly wrong.")
        })
    }
}
