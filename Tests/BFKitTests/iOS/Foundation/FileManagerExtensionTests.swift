//
//  FileManagerExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 17/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class FileManagerExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
        
        do {
            try FileManager.default.delete(file: "Test.txt", from: .documents)
            try FileManager.default.delete(file: "Test.plist", from: .documents)
            try FileManager.default.delete(file: "Test2.plist", from: .documents)
            try FileManager.default.delete(file: "Test.plist", from: .library)
        } catch {}
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPathFor() {
        let path = FileManager.default.pathFor(.documents)
        
        XCTAssert(path != "")
    }
    
    func testReadFileOfType() {
        do {
            try FileManager.default.save(file: "Test.txt", in: .documents, content: "Test")
            let file = try FileManager.default.read(file: "Test.txt", from: .documents)
            
            XCTAssert(file != nil)
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
        
        XCTAssertNil(path)
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
