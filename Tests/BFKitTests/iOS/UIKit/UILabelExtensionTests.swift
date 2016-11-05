//
//  UILabelExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 05/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UILabelExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFrameTextFontColorAlignmentLinesShadowColor() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30), text: "This is a test", font: UIFont(fontName: .HelveticaNeue, size: 20), color: UIColor.black, alignment: .left, lines: 1, shadowColor: UIColor.white)
        
        XCTAssert(label.frame == CGRect(x: 0, y: 0, width: 100, height: 30))
        XCTAssert(label.font == UIFont(fontName: .HelveticaNeue, size: 20))
        XCTAssert(label.text == "This is a test")
        XCTAssert(label.textColor == UIColor.black)
        XCTAssert(label.textAlignment == .left)
        XCTAssert(label.numberOfLines == 1)
        XCTAssert(label.shadowColor == UIColor.white)
    }
    
    func testInitFrameTextFontFontSizeColorAlignmentLinesShadowColor() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30), text: "This is a test", font: .HelveticaNeue, fontSize: 20, color: UIColor.black, alignment: .left, lines: 1, shadowColor: UIColor.white)
        
        XCTAssert(label.frame == CGRect(x: 0, y: 0, width: 100, height: 30))
        XCTAssert(label.font == UIFont(fontName: .HelveticaNeue, size: 20))
        XCTAssert(label.text == "This is a test")
        XCTAssert(label.textColor == UIColor.black)
        XCTAssert(label.textAlignment == .left)
        XCTAssert(label.numberOfLines == 1)
        XCTAssert(label.shadowColor == UIColor.white)
    }
    
    func testCalculateHeight() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "This is a test"
        let height = label.calculateHeight()
        
        XCTAssert(height > 0)
    }
    
    func testSetFontFromIndexToIndex() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "This is a test"
        label.setFont(UIFont(fontName: .HelveticaNeueUltraLight, size: 12), fromIndex: 0, toIndex: 4)
        
        XCTAssert(label.attributedText?.length == 14)
    }
    
    func testSetFontFontSizeFromIndexToIndex() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "This is a test"
        label.setFont(.HelveticaNeueUltraLight, fontSize: 12, fromIndex: 0, toIndex: 4)
        
        XCTAssert(label.attributedText?.length == 14)
    }
}
