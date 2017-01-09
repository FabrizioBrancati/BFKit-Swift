//
//  UITextFieldExtensionTests.swift
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

class UITextFieldExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFramePlaceholderFontFontSizeTextColorReturnKeyTypeKeyboardTypeSecureBorderStyleAutocapitalizationKeyboardAppearanceEnablesReturnKeyAutomaticallyClearButtonModeAutocorrectionTypeDelegate() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 320, height: 35), placeholder: "This is a test", font: .Helvetica, fontSize: 20, textColor: UIColor.black, returnKeyType: .done, keyboardType: .default, secure: false, borderStyle: .roundedRect, autocapitalizationType: .sentences, keyboardAppearance: .dark, enablesReturnKeyAutomatically: true, clearButtonMode: .whileEditing, autocorrectionType: .default, delegate: nil)
        
        XCTAssert(textField.frame == CGRect(x: 0, y: 0, width: 320, height: 35))
        XCTAssert(textField.placeholder == "This is a test")
        XCTAssert(textField.font == UIFont(fontName: .Helvetica, size: 20))
        XCTAssert(textField.textColor == UIColor.black)
        XCTAssert(textField.returnKeyType == .done)
        XCTAssert(textField.keyboardType == .default)
        XCTAssert(textField.isSecureTextEntry == false)
        XCTAssert(textField.borderStyle == .roundedRect)
        XCTAssert(textField.autocapitalizationType == .sentences)
        XCTAssert(textField.keyboardAppearance == .dark)
        XCTAssert(textField.enablesReturnKeyAutomatically == true)
        XCTAssert(textField.clearButtonMode == .whileEditing)
        XCTAssert(textField.autocorrectionType == .default)
        XCTAssert(textField.delegate == nil)
    }
    
    func testInitFramePlaceholderFontTextColorReturnKeyTypeKeyboardTypeSecureBorderStyleAutocapitalizationKeyboardAppearanceEnablesReturnKeyAutomaticallyClearButtonModeAutocorrectionTypeDelegate() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 320, height: 35), placeholder: "This is a test", font: UIFont(fontName: .Helvetica, size: 20), textColor: UIColor.black, returnKeyType: .done, keyboardType: .default, secure: false, borderStyle: .roundedRect, autocapitalizationType: .sentences, keyboardAppearance: .dark, enablesReturnKeyAutomatically: true, clearButtonMode: .whileEditing, autocorrectionType: .default, delegate: nil)
        
        XCTAssert(textField.frame == CGRect(x: 0, y: 0, width: 320, height: 35))
        XCTAssert(textField.placeholder == "This is a test")
        XCTAssert(textField.font == UIFont(fontName: .Helvetica, size: 20))
        XCTAssert(textField.textColor == UIColor.black)
        XCTAssert(textField.returnKeyType == .done)
        XCTAssert(textField.keyboardType == .default)
        XCTAssert(textField.isSecureTextEntry == false)
        XCTAssert(textField.borderStyle == .roundedRect)
        XCTAssert(textField.autocapitalizationType == .sentences)
        XCTAssert(textField.keyboardAppearance == .dark)
        XCTAssert(textField.enablesReturnKeyAutomatically == true)
        XCTAssert(textField.clearButtonMode == .whileEditing)
        XCTAssert(textField.autocorrectionType == .default)
        XCTAssert(textField.delegate == nil)
    }
    
    func testPasteFromPasteboard() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
        UIPasteboard.copy(text: "This is a test")
        textField.pasteFromPasteboard()
        
        XCTAssert(textField.text == "This is a test")
    }
    
    func testCopyToPasteboard() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
        textField.text = "This is a test!"
        textField.copyToPasteboard()
        
        XCTAssert(UIPasteboard.getString() == "This is a test!")
        
        textField.text = nil
        textField.copyToPasteboard()
        
        XCTAssert(UIPasteboard.getString() == "")
    }
}
