//
//  UITextFieldExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 06/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
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
    }
}
