//
//  UITextFieldExtensionTests.swift
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
import UIKit
import XCTest

internal class UITextFieldExtensionTests: XCTestCase {
    internal func testInitFramePlaceholderFontFontSizeTextColorReturnKeyTypeKeyboardTypeSecureBorderStyleAutocapitalizationKeyboardAppearanceEnablesReturnKeyAutomaticallyClearButtonModeAutocorrectionTypeDelegate() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 320, height: 35), placeholder: "This is a test", font: .helvetica, fontSize: 20, textColor: UIColor.black, returnKeyType: .done, keyboardType: .default, secure: false, borderStyle: .roundedRect, autocapitalizationType: .sentences, keyboardAppearance: .dark, enablesReturnKeyAutomatically: true, clearButtonMode: .whileEditing, autocorrectionType: .default, delegate: nil)
        
        XCTAssertEqual(textField.frame, CGRect(x: 0, y: 0, width: 320, height: 35))
        XCTAssertEqual(textField.placeholder, "This is a test")
        XCTAssertEqual(textField.font, UIFont(fontName: .helvetica, size: 20))
        XCTAssertEqual(textField.textColor, UIColor.black)
        XCTAssertEqual(textField.returnKeyType, .done)
        XCTAssertEqual(textField.keyboardType, .default)
        XCTAssertFalse(textField.isSecureTextEntry)
        XCTAssertEqual(textField.borderStyle, .roundedRect)
        XCTAssertEqual(textField.autocapitalizationType, .sentences)
        XCTAssertEqual(textField.keyboardAppearance, .dark)
        XCTAssertTrue(textField.enablesReturnKeyAutomatically)
        XCTAssertEqual(textField.clearButtonMode, .whileEditing)
        XCTAssertEqual(textField.autocorrectionType, .default)
        XCTAssertNil(textField.delegate)
    }
    
    internal func testInitFramePlaceholderFontTextColorReturnKeyTypeKeyboardTypeSecureBorderStyleAutocapitalizationKeyboardAppearanceEnablesReturnKeyAutomaticallyClearButtonModeAutocorrectionTypeDelegate() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 320, height: 35), placeholder: "This is a test", font: UIFont(fontName: .helvetica, size: 20)!, textColor: UIColor.black, returnKeyType: .done, keyboardType: .default, secure: false, borderStyle: .roundedRect, autocapitalizationType: .sentences, keyboardAppearance: .dark, enablesReturnKeyAutomatically: true, clearButtonMode: .whileEditing, autocorrectionType: .default, delegate: nil) // swiftlint:disable:this force_unwrapping
        
        XCTAssertEqual(textField.frame, CGRect(x: 0, y: 0, width: 320, height: 35))
        XCTAssertEqual(textField.placeholder, "This is a test")
        XCTAssertEqual(textField.font, UIFont(fontName: .helvetica, size: 20))
        XCTAssertEqual(textField.textColor, UIColor.black)
        XCTAssertEqual(textField.returnKeyType, .done)
        XCTAssertEqual(textField.keyboardType, .default)
        XCTAssertFalse(textField.isSecureTextEntry)
        XCTAssertEqual(textField.borderStyle, .roundedRect)
        XCTAssertEqual(textField.autocapitalizationType, .sentences)
        XCTAssertEqual(textField.keyboardAppearance, .dark)
        XCTAssertTrue(textField.enablesReturnKeyAutomatically)
        XCTAssertEqual(textField.clearButtonMode, .whileEditing)
        XCTAssertEqual(textField.autocorrectionType, .default)
        XCTAssertNil(textField.delegate)
    }
    
    internal func testPasteFromPasteboard() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
        UIPasteboard.copy(text: "This is a test")
        textField.pasteFromPasteboard()
        
        XCTAssertEqual(textField.text, "This is a test")
    }
    
    internal func testCopyToPasteboard() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
        textField.text = "This is a test!"
        textField.copyToPasteboard()
        
        XCTAssertEqual(UIPasteboard.getString(), "This is a test!")
        
        textField.text = nil
        textField.copyToPasteboard()
        
        XCTAssertEqual(UIPasteboard.getString(), "")
    }
}
