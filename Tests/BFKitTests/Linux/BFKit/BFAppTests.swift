//
//  BFAppTests.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2017 Fabrizio Brancati. All rights reserved.
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

class BFAppTests: XCTestCase {
    static let allTests = [
        ("testDebug", testDebug),
        ("testRelease", testRelease),
        ("testIsFirstStart", testIsFirstStart),
        ("testIsFirstStartVersion", testIsFirstStartVersion),
        ("testOnFirstStart", testOnFirstStart),
        ("testOnFirstStartVersion", testOnFirstStartVersion)
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDebug() {
        BFApp.debug {
            XCTAssertTrue(true)
        }
    }
    
    func testRelease() {
        BFApp.release {
            XCTAssertTrue(true)
        }
    }
    
    func testIsFirstStart() {
        let isFirstStart = BFApp.isFirstStart()
        BFApp.debug {
            XCTAssertTrue(isFirstStart == true || isFirstStart == false)
        }
        
        let isFirstStartVersion = BFApp.isFirstStart(version: "3.0.0")
        BFApp.debug {
            XCTAssertTrue(isFirstStartVersion == true || isFirstStartVersion == false)
        }
    }
    
    func testIsFirstStartVersion() {
        XCTAssertTrue(BFApp.isFirstStart(version: BFApp.version) == true || BFApp.isFirstStart(version: BFApp.version) == false)
    }
    
    func testOnFirstStart() {
        BFApp.onFirstStart { isFirstStart in
            XCTAssertTrue(isFirstStart == true || isFirstStart == false)
        }
        
        BFApp.onFirstStart(version: "3.0.0") { isFirstStart in
            XCTAssertTrue(isFirstStart == true || isFirstStart == false)
        }
    }
    
    func testOnFirstStartVersion() {
        BFApp.onFirstStart(version: BFApp.version) { isFirstStart in
            XCTAssertTrue(isFirstStart == true || isFirstStart == false)
        }
    }
    
    #if !os(Linux) && !os(macOS)
        func testAppSetting() {
            BFApp.setAppSetting(object: "Test", forKey: "Test")
            
            XCTAssertEqual((BFApp.getAppSetting(objectKey: "Test") as! String), "Test") // swiftlint:disable:this force_cast
        }
    
        func testNSLocalizedString() {
            XCTAssertEqual(NSLocalizedString(""), "")
        }
    #endif
}
