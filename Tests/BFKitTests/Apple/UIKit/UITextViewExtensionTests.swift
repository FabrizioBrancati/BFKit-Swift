//
//  UITextViewExtensionTests.swift
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

internal class UITextViewExtensionTests: XCTestCase {
    internal func testInitFrameTextFontTextColorAlignmentDataDetectorTypesEditableSelectableReturnKeyTypeKeyboardTypeSecureAutocapitalizationTypeKeyboardAppearenceEnablesReturnKeyAutomaticallyAutocorrectionTypeDelegate() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 500), text: "This is a test", font: UIFont(fontName: .helvetica, size: 20)!, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: true, selectable: true, returnKeyType: .done, keyboardType: .default, secure: false, autocapitalizationType: .sentences, keyboardAppearance: .light, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil) // swiftlint:disable:this force_unwrapping
        
        XCTAssertEqual(textView.frame, CGRect(x: 0, y: 0, width: 320, height: 500))
        XCTAssertEqual(textView.text, "This is a test")
        XCTAssertEqual(textView.font, UIFont(fontName: .helvetica, size: 20))
        XCTAssertEqual(textView.textColor, UIColor.black)
        XCTAssertEqual(textView.textAlignment, .left)
        XCTAssertEqual(textView.dataDetectorTypes, .all)
        XCTAssertTrue(textView.isEditable)
        XCTAssertTrue(textView.isSelectable)
        XCTAssertEqual(textView.returnKeyType, .done)
        XCTAssertEqual(textView.keyboardType, .default)
        XCTAssertFalse(textView.isSecureTextEntry)
        XCTAssertEqual(textView.autocapitalizationType, .sentences)
        XCTAssertEqual(textView.keyboardAppearance, .light)
        XCTAssertTrue(textView.enablesReturnKeyAutomatically)
        XCTAssertEqual(textView.autocorrectionType, .default)
        XCTAssertNil(textView.delegate)
    }
    
    internal func testInitFrameTextFontFontSizeTextColorAlignmentDataDetectorTypesEditableSelectableReturnKeyTypeKeyboardTypeSecureAutocapitalizationTypeKeyboardAppearenceEnablesReturnKeyAutomaticallyAutocorrectionTypeDelegate() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 500), text: "This is a test", font: .helvetica, fontSize: 20, textColor: UIColor.black, alignment: .left, dataDetectorTypes: .all, editable: true, selectable: true, returnKeyType: .done, keyboardType: .default, secure: false, autocapitalizationType: .sentences, keyboardAppearance: .light, enablesReturnKeyAutomatically: true, autocorrectionType: .default, delegate: nil)
        
        XCTAssertEqual(textView.frame, CGRect(x: 0, y: 0, width: 320, height: 500))
        XCTAssertEqual(textView.text, "This is a test")
        XCTAssertEqual(textView.font, UIFont(fontName: .helvetica, size: 20))
        XCTAssertEqual(textView.textColor, UIColor.black)
        XCTAssertEqual(textView.textAlignment, .left)
        XCTAssertEqual(textView.dataDetectorTypes, .all)
        XCTAssertTrue(textView.isEditable)
        XCTAssertTrue(textView.isSelectable)
        XCTAssertEqual(textView.returnKeyType, .done)
        XCTAssertEqual(textView.keyboardType, .default)
        XCTAssertFalse(textView.isSecureTextEntry)
        XCTAssertEqual(textView.autocapitalizationType, .sentences)
        XCTAssertEqual(textView.keyboardAppearance, .light)
        XCTAssertTrue(textView.enablesReturnKeyAutomatically)
        XCTAssertEqual(textView.autocorrectionType, .default)
        XCTAssertNil(textView.delegate)
    }
    
    internal func testPasteFromPasteboard() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
        UIPasteboard.copy(text: "This is a test")
        textView.pasteFromPasteboard()
        
        XCTAssertEqual(textView.text, "This is a test")
    }
    
    internal func testCopyToPasteboard() {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
        textView.text = "This is a test!"
        textView.copyToPasteboard()
        
        XCTAssertEqual(UIPasteboard.getString(), "This is a test!")
        
        textView.text = nil
        textView.copyToPasteboard()
        
        XCTAssertEqual(UIPasteboard.getString(), "")
    }
}
