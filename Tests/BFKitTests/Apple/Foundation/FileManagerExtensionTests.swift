//
//  FileManagerExtensionTests.swift
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

class FileManagerExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
        
        do {
            try FileManager.default.delete(file: "Test.txt", from: .documents)
            try FileManager.default.delete(file: "Test.plist", from: .documents)
            try FileManager.default.delete(file: "Test2.plist", from: .documents)
            try FileManager.default.delete(file: "Test.plist", from: .library)
        } catch {
            /// It's only for testing purpose.
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPathFor() {
        let mainBundlePath = FileManager.default.pathFor(.mainBundle)
        let documentsPath = FileManager.default.pathFor(.documents)
        let libraryPath = FileManager.default.pathFor(.library)
        let cachePath = FileManager.default.pathFor(.cache)
        let applicationSupportPath = FileManager.default.pathFor(.applicationSupport)
        
        XCTAssertNotEqual(mainBundlePath, "")
        XCTAssertNotEqual(documentsPath, "")
        XCTAssertNotEqual(libraryPath, "")
        XCTAssertNotEqual(cachePath, "")
        XCTAssertNotEqual(applicationSupportPath, "")
    }
    
    func testReadFileOfType() {
        do {
            try FileManager.default.save(file: "Test.txt", in: .documents, content: "Test")
            let file = try FileManager.default.read(file: "Test.txt", from: .documents)
            
            XCTAssertNotNil(file)
        } catch {
            XCTFail()
        }
    }
    
    func testSavePlistObjectInFilename() {
        let saved = FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        XCTAssertTrue(saved)
    }
    
    func testReadPlistFromFilename() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        let readed = FileManager.default.readPlist(from: .documents, filename: "Test")
        
        XCTAssertNotNil(readed)
    }
    
    func testMainBundlePathFile() {
        let path = FileManager.default.mainBundlePath()
        
        XCTAssertNotNil(path)
    }
    
    func testDocumentsPathFile() {
        let path = FileManager.default.documentsPath()
        
        XCTAssertNotNil(path)
    }
    
    func testLibraryPathFile() {
        let path = FileManager.default.libraryPath()
        
        XCTAssertNotNil(path)
    }
    
    func testCachePathFile() {
        let path = FileManager.default.cachePath()
        
        XCTAssertNotNil(path)
    }
    
    func testApplicationSupportPathFile() {
        let path = FileManager.default.applicationSupportPath()
        
        XCTAssertNotNil(path)
    }
    
    func testSizeFileFrom() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        do {
            let size = try FileManager.default.size(file: "Test.plist", from: .documents)
            
            XCTAssertNotNil(size)
            
            let sizeNil = try FileManager.default.size(file: "TestNil.plist", from: .documents)
            
            XCTAssertNil(sizeNil)
        } catch {
            XCTFail()
        }
    }
    
    func testDeleteFileFrom() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.delete(file: "Test.plist", from: .documents)
            
            XCTAssertTrue(true)
        } catch {
            XCTFail()
        }
    }
    
    func testMoveFileFromTo() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.move(file: "Test.plist", from: .documents, to: .library)
            
            XCTAssertTrue(true)
        } catch {
            XCTFail()
        }
    }
    
    func testCopyFileFromTo() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.copy(file: "Test.plist", from: .documents, to: .library)
            
            XCTAssertTrue(true)
        } catch {
            XCTFail()
        }
    }
    
    func testCopyFileFromToMainBundle() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.copy(file: "Test.plist", from: .documents, to: .mainBundle)
            
            XCTFail()
        } catch {
            XCTAssertTrue(true)
        }
    }
    
    func testRenameFileInFromTo() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.rename(file: "Test.plist", in: .documents, to: "Test2.plist")
            
            XCTAssertTrue(true)
        } catch {
            XCTFail()
        }
    }
    
    func testSetSettingsFilenameObjectForKey() {
        let settings = FileManager.default.setSettings(filename: "Test", object: ["1", "2", "3", "4", "5"], forKey: "Test")
        
        XCTAssertTrue(settings)
    }
    
    func testGetSettingsFilenameForKey() {
        FileManager.default.setSettings(filename: "Test", object: ["1", "2", "3", "4", "5"], forKey: "Test")
        let settings = FileManager.default.getSettings(filename: "Test", forKey: "Test")
        
        XCTAssertNotNil(settings)
    }
}
