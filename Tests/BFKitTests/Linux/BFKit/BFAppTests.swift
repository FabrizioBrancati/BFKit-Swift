//
//  BFAppTests.swift
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

internal class BFAppTests: XCTestCase {
    internal static let allTests = [
        ("testDebug", testDebug),
        ("testRelease", testRelease),
        ("testIsFirstStart", testIsFirstStart),
        ("testIsFirstStartVersion", testIsFirstStartVersion),
        ("testOnFirstStart", testOnFirstStart),
        ("testOnFirstStartVersion", testOnFirstStartVersion),
        ("testResetFirstStart", testResetFirstStart),
        ("testResetFirstStartVersion", testResetFirstStartVersion),
        ("testIsFromTestFlight", testIsFromTestFlight)
    ]
    
    internal let testVersion = "10.0.0"
    
    internal func testDebug() {
        BFApp.isDebug = true
        BFApp.debug {
            XCTAssertTrue(true)
        }
    }
    
    internal func testRelease() {
        BFApp.isDebug = false
        BFApp.release {
            XCTAssertTrue(true)
        }
    }
    
    internal func testIsFirstStart() {
        let isFirstStart = BFApp.isFirstStart()
        BFApp.debug {
            XCTAssertTrue(isFirstStart == true || isFirstStart == false)
        }
        
        let isFirstStartVersion = BFApp.isFirstStart(version: testVersion)
        BFApp.debug {
            XCTAssertTrue(isFirstStartVersion == true || isFirstStartVersion == false)
        }
    }
    
    internal func testIsFirstStartVersion() {
        XCTAssertTrue(BFApp.isFirstStart(version: BFApp.version) == true || BFApp.isFirstStart(version: BFApp.version) == false)
    }
    
    internal func testOnFirstStart() {
        BFApp.onFirstStart { isFirstStart in
            XCTAssertTrue(isFirstStart == true || isFirstStart == false)
        }
        
        BFApp.onFirstStart(version: testVersion) { isFirstStart in
            XCTAssertTrue(isFirstStart == true || isFirstStart == false)
        }
    }
    
    internal func testOnFirstStartVersion() {
        BFApp.onFirstStart(version: BFApp.version) { isFirstStart in
            XCTAssertTrue(isFirstStart == true || isFirstStart == false)
        }
    }
    
    internal func testResetFirstStart() {
        BFApp.resetFirstStart()
        
        XCTAssertFalse(UserDefaults.standard.bool(forKey: BFApp.BFAppHasBeenOpened))
    }
    
    internal func testResetFirstStartVersion() {
        BFApp.resetFirstStart(version: testVersion)
        
        XCTAssertFalse(UserDefaults.standard.bool(forKey: BFApp.BFAppHasBeenOpened + testVersion))
    }
    
    internal func testAppSetting() {
        BFApp.setAppSetting(object: "Test", forKey: "Test")
        
        XCTAssertEqual((BFApp.getAppSetting(objectKey: "Test") as? String), "Test")
    }

    internal func testNSLocalizedString() {
        XCTAssertEqual(NSLocalizedString(""), "")
    }
    
    internal func testIsFromTestFlight() {
        XCTAssertFalse(BFApp.isFromTestFlight())
    }
}
