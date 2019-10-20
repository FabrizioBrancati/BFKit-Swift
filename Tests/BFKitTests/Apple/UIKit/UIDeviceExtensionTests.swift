//
//  UIDeviceExtensionTests.swift
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
import UIKit
import XCTest

internal class UIDeviceExtensionTests: XCTestCase {
    internal func testOsVersionEqual() {
        let osVersion = osVersionEqual("7.0")
        
        XCTAssertFalse(osVersion)
    }
    
    internal func testOsVersionGreater() {
        let osVersion = osVersionGreaterThan("10.2")
        
        XCTAssertTrue(osVersion)
    }
    
    internal func testOsVersionGreaterOrEqual() {
        let osVersion = osVersionGreaterThanOrEqual("10.2")
        
        XCTAssertTrue(osVersion)
    }
    
    internal func testOsVersionLess() {
        let osVersion = osVersionLessThan("15.0")
        
        XCTAssertTrue(osVersion)
    }
    
    internal func testOsVersionLessOrEqual() {
        let osVersion = osVersionLessThanOrEqual("15.0")
        
        XCTAssertTrue(osVersion)
    }
    
    internal func testOsVersion() {
        let osVersion = UIDevice.osVersion.substring(to: ".")
        
        XCTAssertGreaterThan(osVersion.intValue, 7)
    }
    
    internal func testOsMajorVersion() {
        let osVersion = UIDevice.osMajorVersion
        
        XCTAssertGreaterThan(osVersion, 7)
    }
    
    internal func testHardwareModel() {
        let model = UIDevice.hardwareModel
        
        XCTAssert(model == "i386" || model == "x86_64")
    }
    
    internal func testDetailedModel() {
        let model = UIDevice.detailedModel
        
        XCTAssertEqual(model, "Simulator")
    }
    
    internal func testCPUFrequency() {
        let frequency = UIDevice.cpuFrequency
        
        XCTAssertNotEqual(frequency, 0)
    }
    
    internal func testBUSFrequency() {
        let frequency = UIDevice.busFrequency
        
        XCTAssertNotEqual(frequency, 0)
    }
    
    internal func testRamSize() {
        let ramSize = UIDevice.ramSize
        
        XCTAssertNotEqual(ramSize, 0)
    }
    
    internal func testCPUSNumber() {
        let cpusNumber = UIDevice.cpusNumber
        
        XCTAssertNotEqual(cpusNumber, 0)
    }
    
    internal func testTotalMemory() {
        let totalMemory = UIDevice.totalMemory
        
        XCTAssertNotEqual(totalMemory, 0)
    }
    
    internal func testUserMemory() {
        let userMemory = UIDevice.userMemory
        
        XCTAssertNotEqual(userMemory, 0)
    }
    
    @available(iOS 9.0, *)
    internal func testIsLowPowerModeEnabled() {
        let isLowPowerMode = UIDevice.isLowPowerModeEnabled
        
        XCTAssertFalse(isLowPowerMode)
    }
    
    @available(iOS 9.0, *)
    internal func testLowPowerModeChanged() {
        let testExpectation = expectation(description: "Low Power Mode Changed")
        
        UIDevice.lowPowerModeChanged { isLowPowerModeEnabled in
            XCTAssertFalse(isLowPowerModeEnabled)
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Something went horribly wrong.")
        }
    }
    
    internal func testIsPhone() {
        let device = UIDevice.isPhone()
        
        XCTAssertFalse(device)
    }
    
    internal func testIsPad() {
        let device = UIDevice.isPad()
        
        XCTAssertFalse(device)
    }
    
    internal func testIsPod() {
        let device = UIDevice.isPod()
        
        XCTAssertFalse(device)
    }
    
    internal func testIsTV() {
        let device = UIDevice.isTV()
        
        XCTAssertFalse(device)
    }
    
    internal func testIsWatch() {
        let device = UIDevice.isWatch()
        
        XCTAssertFalse(device)
    }
    
    internal func testIsSimulator() {
        let device = UIDevice.isSimulator()
        
        XCTAssertTrue(device)
    }
    
    internal func testIsJailbroken() {
        let jailbroken = UIDevice.isJailbroken()
        
        XCTAssertTrue(jailbroken)
    }
    
    internal func testUptime() {
        let uptime = UIDevice.uptime()
        
        XCTAssertGreaterThan(uptime, 0)
    }
    
    internal func testUptimeDate() {
        let uptimeDate = UIDevice.uptimeDate()
        
        XCTAssertLessThan(uptimeDate, Date())
    }
    
    internal func testTotalDiskSpace() {
        let totalDiskSpace = UIDevice.totalDiskSpace()
        
        XCTAssertNotEqual(totalDiskSpace, 0.0)
    }
    
    internal func testFreeDiskSpace() {
        let freeDiskSpace = UIDevice.freeDiskSpace()
        
        XCTAssertNotEqual(freeDiskSpace, 0.0)
    }
    
    internal func testGenerateUniqueIdentifier() {
        var uuid = UIDevice.generateUniqueIdentifier()
        var uuid2 = UIDevice.generateUniqueIdentifier()
        
        XCTAssertEqual(uuid.count, 36)
        XCTAssertNotEqual(uuid, uuid2)
        
        UserDefaults.standard.set(nil, forKey: BFDeviceIdentifierDefaultsKey)
        
        uuid = UIDevice.generateUniqueIdentifier(save: true)
        uuid2 = UIDevice.generateUniqueIdentifier(save: true)
        
        XCTAssertEqual(uuid, uuid2)
        
        UserDefaults.standard.set(nil, forKey: BFDeviceIdentifierDefaultsKey)
        
        uuid = UIDevice.generateUniqueIdentifier(save: true, force: true)
        uuid2 = UIDevice.generateUniqueIdentifier(save: true, force: true)
        
        XCTAssertNotEqual(uuid, uuid2)
        
        UserDefaults.standard.set(nil, forKey: BFDeviceIdentifierDefaultsKey)
        
        uuid = UIDevice.generateUniqueIdentifier(save: true, force: true)
        uuid2 = UIDevice.generateUniqueIdentifier(save: true)
        
        XCTAssertEqual(uuid, uuid2)
        
        UserDefaults.standard.set(nil, forKey: BFDeviceIdentifierDefaultsKey)
        
        uuid = UIDevice.generateUniqueIdentifier(save: true)
        uuid2 = UIDevice.generateUniqueIdentifier(save: true, force: true)
        
        XCTAssertNotEqual(uuid, uuid2)
    }
    
    internal func testSaveAPNSIdentifier() {
        let testExpectation = expectation(description: "Save APNS Identifier")
        let uuid = UIDevice.generateUniqueIdentifier()
        
        UIDevice.saveAPNSIdentifier(uuid) { isValid, needsUpdate, _, newUUID in
            XCTAssertTrue(isValid)
            XCTAssertTrue(needsUpdate)
            XCTAssertNotNil(newUUID)
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Something went horribly wrong.")
        }
    }
}
