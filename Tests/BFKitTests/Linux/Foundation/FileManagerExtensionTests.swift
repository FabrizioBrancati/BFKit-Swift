//
//  FileManagerExtensionTests.swift
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

internal class FileManagerExtensionTests: XCTestCase {
    override internal func setUp() {
        super.setUp()
        
        try? FileManager.default.delete(file: "Test.txt", from: .documents)
        try? FileManager.default.delete(file: "Test.plist", from: .documents)
        try? FileManager.default.delete(file: "Test2.plist", from: .documents)
        try? FileManager.default.delete(file: "Test.plist", from: .library)
    }
    
    internal func testPathFor() {
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
    
    internal func testReadFileOfType() {
        do {
            try FileManager.default.save(file: "Test.txt", in: .temporary, content: "Test")
            let file = try FileManager.default.read(file: "Test.txt", from: .temporary)
            
            XCTAssertNotNil(file)
        } catch {
            XCTFail("`testReadFileOfType` error: \(error.localizedDescription)")
        }
    }
    
    internal func testSavePlistObjectInFilename() {
        let saved = FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .temporary, filename: "Test")
        
        XCTAssertTrue(saved)
    }
    
    internal func testReadPlistFromFilename() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .temporary, filename: "Test")
        let readed = FileManager.default.readPlist(from: .temporary, filename: "Test")
        
        XCTAssertNotNil(readed)
    }
    
    internal func testMainBundlePathFile() {
        let path = FileManager.default.mainBundlePath()
        
        XCTAssertNotNil(path)
    }
    
    internal func testDocumentsPathFile() {
        let path = FileManager.default.documentsPath()
        
        XCTAssertNotNil(path)
    }
    
    internal func testLibraryPathFile() {
        let path = FileManager.default.libraryPath()
        
        XCTAssertNotNil(path)
    }
    
    internal func testCachePathFile() {
        let path = FileManager.default.cachePath()
        
        XCTAssertNotNil(path)
    }
    
    internal func testApplicationSupportPathFile() {
        let path = FileManager.default.applicationSupportPath()
        
        XCTAssertNotNil(path)
    }
    
    internal func testTemporaryPathFile() {
        let path = FileManager.default.temporaryPath()
        
        XCTAssertNotNil(path)
    }
    
    internal func testSizeFileFrom() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .temporary, filename: "Test")
        
        do {
            let size = try FileManager.default.size(file: "Test.plist", from: .temporary)
            
            XCTAssertNotNil(size)
            
            let sizeNil = try FileManager.default.size(file: "TestNil.plist", from: .temporary)
            
            XCTAssertNil(sizeNil)
        } catch {
            XCTFail("`testSizeFileFrom` error")
        }
    }
    
    internal func testDeleteFileFrom() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.delete(file: "Test.plist", from: .documents)
            
            XCTAssertTrue(true)
        } catch {
            XCTFail("`testDeleteFileFrom` error")
        }
    }
    
    internal func testMoveFileFromTo() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.move(file: "Test.plist", from: .documents, to: .library)
            
            XCTAssertTrue(true)
        } catch {
            XCTFail("`testMoveFileFromTo` error")
        }
    }
    
    internal func testCopyFileFromTo() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.copy(file: "Test.plist", from: .documents, to: .library)
            
            XCTAssertTrue(true)
        } catch {
            XCTFail("`testCopyFileFromTo` error")
        }
    }
    
    internal func testCopyFileFromToMainBundle() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.copy(file: "Test.plist", from: .documents, to: .mainBundle)
            
            XCTFail("`testCopyFileFromToMainBundle` error")
        } catch {
            XCTAssertTrue(true)
        }
    }
    
    internal func testRenameFileInFromTo() {
        FileManager.default.savePlist(object: ["1", "2", "3", "4", "5"], in: .documents, filename: "Test")
        
        do {
            try FileManager.default.rename(file: "Test.plist", in: .documents, to: "Test2.plist")
            
            XCTAssertTrue(true)
        } catch {
            XCTFail("`testRenameFileInFromTo` error")
        }
    }
    
    internal func testSetSettingsFilenameObjectForKey() {
        let settings = FileManager.default.setSettings(filename: "Test", object: ["1", "2", "3", "4", "5"], forKey: "Test")
        
        XCTAssertTrue(settings)
    }
    
    internal func testGetSettingsFilenameForKey() {
        FileManager.default.setSettings(filename: "Test", object: ["1", "2", "3", "4", "5"], forKey: "Test")
        let settings = FileManager.default.getSettings(filename: "Test", forKey: "Test")
        
        XCTAssertNotNil(settings)
    }
    
    internal func testGetEmptySettingsFilenameForKey() {
        let settings = FileManager.default.getSettings(filename: "Test3", forKey: "Test")
        
        XCTAssertNil(settings)
    }
}
