//
//  UITextViewExtensionTests.swift
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

class UITextViewExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFrameTextFontTextColorAlignmentDataDetectorTypesEditableSelectableReturnKeyTypeKeyboardTypeSecureAutocapitalizationTypeKeyboardAppearenceEnablesReturnKeyAutomaticallyAutocorrectionTypeDelegate() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 500), text: "This is a test", font: UIFont(fontName: .Helvetica, size: 20), textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: true, selectable: true, returnKeyType: .done, keyboardType: .default, secure: false, autocapitalizationType: .sentences, keyboardAppearance: .light, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
        
        XCTAssert(textView.frame == CGRect(x: 0, y: 0, width: 320, height: 500))
        XCTAssert(textView.text == "This is a test")
        XCTAssert(textView.font == UIFont(fontName: .Helvetica, size: 20))
        XCTAssert(textView.textColor == UIColor.black)
        XCTAssert(textView.textAlignment == .left)
        XCTAssert(textView.dataDetectorTypes == .all)
        XCTAssert(textView.isEditable == true)
        XCTAssert(textView.isSelectable == true)
        XCTAssert(textView.returnKeyType == .done)
        XCTAssert(textView.keyboardType == .default)
        XCTAssert(textView.isSecureTextEntry == false)
        XCTAssert(textView.autocapitalizationType == .sentences)
        XCTAssert(textView.keyboardAppearance == .light)
        XCTAssert(textView.enablesReturnKeyAutomatically == true)
        XCTAssert(textView.autocorrectionType == .default)
        XCTAssert(textView.delegate == nil)
    }
    
    func testInitFrameTextFontFontSizeTextColorAlignmentDataDetectorTypesEditableSelectableReturnKeyTypeKeyboardTypeSecureAutocapitalizationTypeKeyboardAppearenceEnablesReturnKeyAutomaticallyAutocorrectionTypeDelegate() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 500), text: "This is a test", font: .Helvetica, fontSize: 20, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: true, selectable: true, returnKeyType: .done, keyboardType: .default, secure: false, autocapitalizationType: .sentences, keyboardAppearance: .light, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
        
        XCTAssert(textView.frame == CGRect(x: 0, y: 0, width: 320, height: 500))
        XCTAssert(textView.text == "This is a test")
        XCTAssert(textView.font == UIFont(fontName: .Helvetica, size: 20))
        XCTAssert(textView.textColor == UIColor.black)
        XCTAssert(textView.textAlignment == .left)
        XCTAssert(textView.dataDetectorTypes == .all)
        XCTAssert(textView.isEditable == true)
        XCTAssert(textView.isSelectable == true)
        XCTAssert(textView.returnKeyType == .done)
        XCTAssert(textView.keyboardType == .default)
        XCTAssert(textView.isSecureTextEntry == false)
        XCTAssert(textView.autocapitalizationType == .sentences)
        XCTAssert(textView.keyboardAppearance == .light)
        XCTAssert(textView.enablesReturnKeyAutomatically == true)
        XCTAssert(textView.autocorrectionType == .default)
        XCTAssert(textView.delegate == nil)
    }
    
    func testPasteFromPasteboard() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
        UIPasteboard.copy(text: "This is a test")
        textView.pasteFromPasteboard()
        
        XCTAssert(textView.text == "This is a test")
    }
    
    func testCopyToPasteboard() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
        textView.text = "This is a test!"
        textView.copyToPasteboard()
        
        XCTAssert(UIPasteboard.getString() == "This is a test!")
    }
}
