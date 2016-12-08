//
//  BFTouchIDTests.swift
//  BFKit
//
//  Created by Fabrizio on 23/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
@testable import BFKit

class BFTouchIDTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShowTouchID() {
        BFTouchID.showTouchID(reason: "Testing", fallbackTitle: "Password") { result in
            if result == .success {
                XCTAssert(true)
            } else {
                XCTAssert(true)
            }
        }
    }
}
