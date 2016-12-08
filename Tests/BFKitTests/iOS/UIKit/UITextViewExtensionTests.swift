//
//  UITextViewExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 06/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

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
