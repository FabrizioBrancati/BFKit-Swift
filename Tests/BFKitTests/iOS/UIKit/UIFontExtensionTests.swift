//
//  UIFontExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 01/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIFontExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLightFont() {
        UIFont.lightFont = UIFont(fontName: .Helvetica, size: 20)
        
        XCTAssert(UIFont.lightFont.fontName == FontName.Helvetica.rawValue)
    }
    
    func testRegularFont() {
        UIFont.regularFont = UIFont(fontName: .Helvetica, size: 20)
        
        XCTAssert(UIFont.regularFont.fontName == FontName.Helvetica.rawValue)
    }
    
    func testBoldFont() {
        UIFont.boldFont = UIFont(fontName: .Helvetica, size: 20)
        
        XCTAssert(UIFont.boldFont.fontName == FontName.Helvetica.rawValue)
    }
    
    func testInitFontNameSize() {
        let font = UIFont(fontName: .HelveticaNeue, size: 20)
        
        XCTAssert(font.fontName == FontName.HelveticaNeue.rawValue)
    }
    
    func testAllFonts() {
        let fonts = UIFont.allFonts()
        
        XCTAssertNotNil(fonts)
        XCTAssertFalse(fonts.isEmpty)
    }
    
    func testCalculateHeightWidthFontText() {
        let height = UIFont.calculateHeight(width: 320, font: UIFont(fontName: .Helvetica, size: 12), text: "This is a test\nOn multiple\nLines.\n\nBye.")
        
        XCTAssert(height > 0)
    }
    
    func testCalculateHeightWidthFontSizeText() {
        let height = UIFont.calculateHeight(width: 320, font: .Helvetica, fontSize: 12, text: "This is a test\nOn multiple\nLines.\n\nBye.")
        
        XCTAssert(height > 0)
    }
    
    func testFontsNameFamily() {
        let fonts = UIFont.fontsName(family: .Helvetica)
        
        XCTAssertFalse(fonts.isEmpty)
    }
}
