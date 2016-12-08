//
//  BFTextFieldTests.swift
//  BFKit
//
//  Created by Fabrizio on 22/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
import UIKit
@testable import BFKit

class BFTextFieldTests: XCTestCase {
    var textField: BFTextField? = BFTextField(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /*func testDecode() {
    
    }*/
    
    /*func testEncode() {
    
    }*/
    
    func testInitFrame() {
        XCTAssert(textField!.maxNumberOfCharacters == 0)
        XCTAssert(textField!.frame.size.width == 320)
    }
    
    func testTextFieldDidChange() {
        textField!.maxNumberOfCharacters = 20
        textField!.text = "Testing"
        
        XCTAssert(textField!.text == "Testing")
        
        textField!.text = "TestingMoreThan20Characters"
        NotificationCenter.default.post(name: Notification.Name.UITextFieldTextDidChange, object: textField)
        
        XCTAssert(textField!.text?.characters.count == 20)
    }
    
    func testDeinit() {
        textField = nil
    }
}
