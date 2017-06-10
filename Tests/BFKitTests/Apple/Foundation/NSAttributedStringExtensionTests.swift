//
//  NSAttributedStringTests.swift
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

class NSAttributedStringExtensionTests: XCTestCase {
    static let allTests = [
        ("testAttributedString", testAttributedString),
        ("testFont", testFont),
        ("testParagraphStyle", testParagraphStyle),
        ("testForegroundColor", testForegroundColor),
        ("testBackgroundColor", testBackgroundColor),
        ("testLigature", testLigature),
        ("testStrikethroughStyle", testStrikethroughStyle),
        ("testUnderlineStyle", testUnderlineStyle),
        ("testStrokeColor", testStrokeColor),
        ("testStrokeWidth", testStrokeWidth),
        ("testShadow", testShadow),
        ("testTextEffect", testTextEffect),
        ("testAttachment", testAttachment),
        ("testLink", testLink),
        ("testBaselineOffset", testBaselineOffset),
        ("testUnderlineColor", testUnderlineColor),
        ("testStrikethroughColor", testStrikethroughColor),
        ("testObliqueness", testObliqueness),
        ("testExpansion", testExpansion),
        ("testWritingDirection", testWritingDirection),
        ("testVerticalGlyphForm", testVerticalGlyphForm)
    ]
    
    var string: String = ""
    var attributedString: NSAttributedString = NSAttributedString()
    
    override func setUp() {
        super.setUp()
        
        string = "This is a test"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAttributedString() {
        attributedString = string.attributedString.font(UIFont.systemFont(ofSize: 18))
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
    }
    
    func testFont() {
        let font = UIFont.systemFont(ofSize: 18)
        attributedString = string.attributedString.font(font)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.font] as? UIFont, font)
    }
    
    func testParagraphStyle() {
        let paragraphStyle = NSParagraphStyle.default
        attributedString = string.attributedString.paragraphStyle(paragraphStyle)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle, paragraphStyle)
    }
    
    func testForegroundColor() {
        let foregroundColor = UIColor.red
        attributedString = string.attributedString.foregroundColor(foregroundColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.foregroundColor] as? UIColor, foregroundColor)
    }
    
    func testBackgroundColor() {
        let backgroundColor = UIColor.blue
        attributedString = string.attributedString.backgroundColor(backgroundColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.backgroundColor] as? UIColor, backgroundColor)
    }
    
    func testLigature() {
        let ligature = true
        attributedString = string.attributedString.ligature(ligature)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.ligature] as? Bool, ligature)
    }
    
    func testKern() {
        let kern: Float = 10.0
        attributedString = string.attributedString.kern(kern)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.kern] as? Float, kern)
    }
    
    func testStrikethroughStyle() {
        let strikethroughStyle = 5
        attributedString = string.attributedString.strikethroughStyle(strikethroughStyle)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.strikethroughStyle] as? Int, strikethroughStyle)
    }
    
    func testUnderlineStyle() {
        let underlineStyle = NSUnderlineStyle.patternDashDot
        attributedString = string.attributedString.underlineStyle(underlineStyle)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.underlineStyle] as? NSUnderlineStyle, underlineStyle)
    }
    
    func testStrokeColor() {
        let strokeColor = UIColor.green
        attributedString = string.attributedString.strokeColor(strokeColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.strokeColor] as? UIColor, strokeColor)
    }
    
    func testStrokeWidth() {
        let strokeWidth: Float = 6.0
        attributedString = string.attributedString.strokeWidth(strokeWidth)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.strokeWidth] as? Float, strokeWidth)
    }
    
    func testShadow() {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 10, height: 10)
        attributedString = string.attributedString.shadow(shadow)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.shadow] as? NSShadow, shadow)
    }
    
    func testTextEffect() {
        let textEffect = NSAttributedString.TextEffectStyle.letterpressStyle
        attributedString = string.attributedString.textEffect(textEffect.rawValue)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.textEffect] as? String, textEffect)
    }
    
    func testAttachment() {
        let attachment = NSTextAttachment(data: nil, ofType: "test")
        attributedString = string.attributedString.attachment(attachment)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.attachment] as? NSTextAttachment, attachment)
    }
    
    func testLink() {
        let link = NSURL(fileURLWithPath: "test/test.test")
        attributedString = string.attributedString.link(link)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.link] as? NSURL, link)
    }
    
    func testBaselineOffset() {
        let baselineOffset: Float = 3.0
        attributedString = string.attributedString.baselineOffset(baselineOffset)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.baselineOffset] as? Float, baselineOffset)
    }
    
    func testUnderlineColor() {
        let underlineColor = UIColor.black
        attributedString = string.attributedString.underlineColor(underlineColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.underlineColor] as? UIColor, underlineColor)
    }
    
    func testStrikethroughColor() {
        let strikethroughColor = UIColor.gray
        attributedString = string.attributedString.strikethroughColor(strikethroughColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.strikethroughColor] as? UIColor, strikethroughColor)
    }
    
    func testObliqueness() {
        let obliqueness: Float = 7.0
        attributedString = string.attributedString.obliqueness(obliqueness)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.obliqueness] as? Float, obliqueness)
    }
    
    func testExpansion() {
        let expansion: Float = 9.0
        attributedString = string.attributedString.expansion(expansion)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.expansion] as? Float, expansion)
    }
    
    func testWritingDirection() {
        let writingDirection: [Int] = [NSWritingDirection.rightToLeft.rawValue]
        attributedString = string.attributedString.writingDirection(writingDirection)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.writingDirection] as? [Int])!, writingDirection)
    }
    
    func testVerticalGlyphForm() {
        let verticalGlyphForm = true
        attributedString = string.attributedString.verticalGlyphForm(verticalGlyphForm)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.verticalGlyphForm] as? Bool, verticalGlyphForm)
    }
    
    func testTextAlignmentLeft() {
        var textAlignment = NSMutableParagraphStyle().alignment
        textAlignment = .left
        attributedString = string.attributedString.textAlignmentLeft()
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle)?.alignment, textAlignment)
    }
    
    func testTextAlignmentRight() {
        var textAlignment = NSMutableParagraphStyle().alignment
        textAlignment = .right
        attributedString = string.attributedString.textAlignmentRight()
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle)?.alignment, textAlignment)
    }
    
    func testTextAlignmentCenter() {
        var textAlignment = NSMutableParagraphStyle().alignment
        textAlignment = .center
        attributedString = string.attributedString.textAlignmentCenter()
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle)?.alignment, textAlignment)
    }
    
    func testTextAlignmentJustified() {
        var textAlignment = NSMutableParagraphStyle().alignment
        textAlignment = .justified
        attributedString = string.attributedString.textAlignmentJustified()
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle)?.alignment, textAlignment)
    }
}
