//
//  UIDeviceExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 31/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIDeviceExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOsVersionEqual() {
        let osVersion = osVersionEqual("10.0")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersionGreater() {
        let osVersion = osVersionGreater("9.2")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersionGreaterOrEqual() {
        let osVersion = osVersionGreaterOrEqual("9.2")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersionLess() {
        let osVersion = osVersionLess("11.0")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersionLessOrEqual() {
        let osVersion = osVersionLessOrEqual("11.0")
        
        XCTAssert(osVersion)
    }
    
    func testOsVersion() {
        let osVersion = UIDevice.osVersion
        
        
        XCTAssert(osVersion == "10.0")
    }
    
    func testOsMajorVersion() {
        let osVersion = UIDevice.osMajorVersion
        
        XCTAssert(osVersion == 10)
    }
    
    func testHardwareModel() {
        let model = UIDevice.hardwareModel
        
        XCTAssert(model == "i386" || model == "x86_64")
    }
    
    func testDetailedModel() {
        let model = UIDevice.detailedModel
        
        XCTAssert(model == "Simulator")
    }
    
    func testCPUFrequency() {
        let frequency = UIDevice.cpuFrequency
        
        XCTAssert(frequency != 0)
    }
    
    func testBUSFrequency() {
        let frequency = UIDevice.busFrequency
        
        XCTAssert(frequency != 0)
    }
    
    func testRamSize() {
        let ramSize = UIDevice.ramSize
        
        XCTAssert(ramSize != 0)
    }
    
    func testCPUSNumber() {
        let cpusNumber = UIDevice.cpusNumber
        
        XCTAssert(cpusNumber != 0)
    }
    
    func testTotalMemory() {
        let totalMemory = UIDevice.totalMemory
        
        XCTAssert(totalMemory != 0)
    }
    
    func testUserMemory() {
        let userMemory = UIDevice.userMemory
        
        XCTAssert(userMemory != 0)
    }
}
