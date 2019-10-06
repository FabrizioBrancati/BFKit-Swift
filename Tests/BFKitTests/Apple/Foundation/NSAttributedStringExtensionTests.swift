//
//  NSAttributedStringExtensionTests.swift
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

internal class NSAttributedStringExtensionTests: XCTestCase {
    internal static let allTests = [
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
        ("testVerticalGlyphForm", testVerticalGlyphForm),
        ("testTextAlignmentLeft", testTextAlignmentLeft),
        ("testTextAlignmentRight", testTextAlignmentRight),
        ("testTextAlignmentCenter", testTextAlignmentCenter),
        ("testTextAlignmentJustified", testTextAlignmentJustified),
        ("testMultipleAttributes", testMultipleAttributes)
    ]
    
    internal var string = ""
    internal var attributedString = NSAttributedString()
    
    override internal func setUp() {
        super.setUp()
        
        string = "This is a test"
    }
    
    internal func testAttributedString() {
        attributedString = string.attributedString.font(Font.systemFont(ofSize: 18))
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
    }
    
    internal func testFont() {
        let font = Font.systemFont(ofSize: 18)
        attributedString = string.attributedString.font(font)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.font] as? Font, font)
    }
    
    internal func testParagraphStyle() {
        let paragraphStyle = NSParagraphStyle.default
        attributedString = string.attributedString.paragraphStyle(paragraphStyle)
            
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle, paragraphStyle)
    }
    
    internal func testForegroundColor() {
        let foregroundColor = Color.red
        attributedString = string.attributedString.foregroundColor(foregroundColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? Color, foregroundColor)
    }
    
    internal func testBackgroundColor() {
        let backgroundColor = Color.blue
        attributedString = string.attributedString.backgroundColor(backgroundColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.backgroundColor] as? Color, backgroundColor)
    }
    
    internal func testLigature() {
        let ligature = true
        attributedString = string.attributedString.ligature(ligature)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.ligature] as? Bool, ligature)
    }
    
    internal func testKern() {
        let kern: Float = 10.0
        attributedString = string.attributedString.kern(kern)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.kern] as? Float, kern)
    }
    
    internal func testStrikethroughStyle() {
        let strikethroughStyle = 5
        attributedString = string.attributedString.strikethroughStyle(strikethroughStyle)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.strikethroughStyle] as? Int, strikethroughStyle)
    }
    
    internal func testUnderlineStyle() {
        let underlineStyle = NSUnderlineStyle.patternDashDot
        attributedString = string.attributedString.underlineStyle(underlineStyle)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.underlineStyle] as? NSUnderlineStyle, underlineStyle)
    }
    
    internal func testStrokeColor() {
        let strokeColor = Color.green
        attributedString = string.attributedString.strokeColor(strokeColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.strokeColor] as? Color, strokeColor)
    }
    
    internal func testStrokeWidth() {
        let strokeWidth: Float = 6.0
        attributedString = string.attributedString.strokeWidth(strokeWidth)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.strokeWidth] as? Float, strokeWidth)
    }
    
    internal func testShadow() {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 10, height: 10)
        attributedString = string.attributedString.shadow(shadow)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.shadow] as? NSShadow, shadow)
    }
    
    internal func testTextEffect() {
        let textEffect = NSAttributedString.TextEffectStyle.letterpressStyle
        attributedString = string.attributedString.textEffect(textEffect.rawValue)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.textEffect] as? NSAttributedString.TextEffectStyle, textEffect)
    }
    
    internal func testAttachment() {
        let attachment = NSTextAttachment(data: nil, ofType: "test")
        attributedString = string.attributedString.attachment(attachment)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.attachment] as? NSTextAttachment, attachment)
    }
    
    internal func testLink() {
        let link = NSURL(fileURLWithPath: "test/test.test")
        attributedString = string.attributedString.link(link)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.link] as? NSURL, link)
    }
    
    internal func testBaselineOffset() {
        let baselineOffset: Float = 3.0
        attributedString = string.attributedString.baselineOffset(baselineOffset)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.baselineOffset] as? Float, baselineOffset)
    }
    
    internal func testUnderlineColor() {
        let underlineColor = Color.black
        attributedString = string.attributedString.underlineColor(underlineColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.underlineColor] as? Color, underlineColor)
    }
    
    internal func testStrikethroughColor() {
        let strikethroughColor = Color.gray
        attributedString = string.attributedString.strikethroughColor(strikethroughColor)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.strikethroughColor] as? Color, strikethroughColor)
    }
    
    internal func testObliqueness() {
        let obliqueness: Float = 7.0
        attributedString = string.attributedString.obliqueness(obliqueness)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.obliqueness] as? Float, obliqueness)
    }
    
    internal func testExpansion() {
        let expansion: Float = 9.0
        attributedString = string.attributedString.expansion(expansion)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.expansion] as? Float, expansion)
    }
    
    internal func testWritingDirection() {
        let writingDirection: [Int] = [NSWritingDirection.rightToLeft.rawValue]
        attributedString = string.attributedString.writingDirection(writingDirection)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.writingDirection] as? [Int])!, writingDirection) // swiftlint:disable:this force_unwrapping
    }
    
    internal func testVerticalGlyphForm() {
        let verticalGlyphForm = true
        attributedString = string.attributedString.verticalGlyphForm(verticalGlyphForm)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.verticalGlyphForm] as? Bool, verticalGlyphForm)
    }
    
    internal func testTextAlignmentLeft() {
        var textAlignment = NSMutableParagraphStyle().alignment
        textAlignment = .left
        attributedString = string.attributedString.textAlignmentLeft()
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle)?.alignment, textAlignment)
    }
    
    internal func testTextAlignmentRight() {
        var textAlignment = NSMutableParagraphStyle().alignment
        textAlignment = .right
        attributedString = string.attributedString.textAlignmentRight()
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle)?.alignment, textAlignment)
    }
    
    internal func testTextAlignmentCenter() {
        var textAlignment = NSMutableParagraphStyle().alignment
        textAlignment = .center
        attributedString = string.attributedString.textAlignmentCenter()
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle)?.alignment, textAlignment)
    }
    
    internal func testTextAlignmentJustified() {
        var textAlignment = NSMutableParagraphStyle().alignment
        textAlignment = .justified
        attributedString = string.attributedString.textAlignmentJustified()
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 1)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle)?.alignment, textAlignment)
    }
    
    internal func testMultipleAttributes() {
        var textAlignment = NSMutableParagraphStyle().alignment
        textAlignment = .center
        let font = Font.systemFont(ofSize: 18)
        attributedString = string.attributedString.textAlignmentCenter().font(font)
        
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil).count, 2)
        XCTAssertEqual((attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle)?.alignment, textAlignment)
        XCTAssertEqual(attributedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.font] as? Font, font)
    }
}
