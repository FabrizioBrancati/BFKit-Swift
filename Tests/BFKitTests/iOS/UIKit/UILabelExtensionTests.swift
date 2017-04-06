//
//  UILabelExtensionTests.swift
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
import UIKit
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
        
        XCTAssertEqual(label.frame, CGRect(x: 0, y: 0, width: 100, height: 30))
        XCTAssertEqual(label.font, UIFont(fontName: .HelveticaNeue, size: 20))
        XCTAssertEqual(label.text, "This is a test")
        XCTAssertEqual(label.textColor, UIColor.black)
        XCTAssertEqual(label.textAlignment, .left)
        XCTAssertEqual(label.numberOfLines, 1)
        XCTAssertEqual(label.shadowColor, UIColor.white)
    }
    
    func testInitFrameTextFontFontSizeColorAlignmentLinesShadowColor() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30), text: "This is a test", font: .HelveticaNeue, fontSize: 20, color: UIColor.black, alignment: .left, lines: 1, shadowColor: UIColor.white)
        
        XCTAssertEqual(label.frame, CGRect(x: 0, y: 0, width: 100, height: 30))
        XCTAssertEqual(label.font, UIFont(fontName: .HelveticaNeue, size: 20))
        XCTAssertEqual(label.text, "This is a test")
        XCTAssertEqual(label.textColor, UIColor.black)
        XCTAssertEqual(label.textAlignment, .left)
        XCTAssertEqual(label.numberOfLines, 1)
        XCTAssertEqual(label.shadowColor, UIColor.white)
    }
    
    func testCalculateHeight() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "This is a test"
        let height = label.calculateHeight()
        
        XCTAssertGreaterThan(height, 0)
    }
    
    func testSetFontFromIndexToIndex() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "This is a test"
        label.setFont(UIFont(fontName: .HelveticaNeueUltraLight, size: 12), fromIndex: 0, toIndex: 4)
        
        XCTAssertEqual(label.attributedText?.length, 14)
        
        label.text = nil
        label.setFont(UIFont(fontName: .HelveticaNeueUltraLight, size: 12), fromIndex: 0, toIndex: 4)
        
        XCTAssertNil(label.attributedText)
    }
    
    func testSetFontFontSizeFromIndexToIndex() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        label.text = "This is a test"
        label.setFont(.HelveticaNeueUltraLight, fontSize: 12, fromIndex: 0, toIndex: 4)
        
        XCTAssertEqual(label.attributedText?.length, 14)
        
        label.text = nil
        label.setFont(.HelveticaNeueUltraLight, fontSize: 12, fromIndex: 0, toIndex: 4)
        
        XCTAssertNil(label.attributedText)
    }
}
