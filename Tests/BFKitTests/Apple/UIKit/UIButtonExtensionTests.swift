//
//  UIButtonExtensionTests.swift
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

internal class UIButtonExtensionTests: XCTestCase {
    internal func testInitFrameTitleBackgroundImageHighlightedBackgroundImage() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test", backgroundImage: UIImage(color: UIColor.red), highlightedBackgroundImage: UIImage(color: UIColor.blue))
        
        XCTAssertEqual(button.frame.origin.x, 0)
        XCTAssertEqual(button.frame.origin.y, 0)
        XCTAssertEqual(button.frame.size.width, 320)
        XCTAssertEqual(button.frame.size.height, 44)
        XCTAssertEqual(button.title(for: UIControl.State.normal), "Test")
    }
    
    internal func testInitFrameTitleColor() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test", color: UIColor.red)
        
        XCTAssertEqual(button.frame.origin.x, 0)
        XCTAssertEqual(button.frame.origin.y, 0)
        XCTAssertEqual(button.frame.size.width, 320)
        XCTAssertEqual(button.frame.size.height, 44)
        XCTAssertEqual(button.title(for: UIControl.State.normal), "Test")
    }
    
    internal func testInitFrameTitleColorHighlightedColor() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test", color: UIColor.red, highlightedColor: UIColor.blue)
        
        XCTAssertEqual(button.frame.origin.x, 0)
        XCTAssertEqual(button.frame.origin.y, 0)
        XCTAssertEqual(button.frame.size.width, 320)
        XCTAssertEqual(button.frame.size.height, 44)
        XCTAssertEqual(button.title(for: UIControl.State.normal), "Test")
    }
    
    internal func testInitFrameImageHighlightedImage() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), image: UIImage(color: UIColor.red)!, highlightedImage: UIImage(color: UIColor.blue)) // swiftlint:disable:this force_unwrapping
        
        XCTAssertEqual(button.frame.origin.x, 0)
        XCTAssertEqual(button.frame.origin.y, 0)
        XCTAssertEqual(button.frame.size.width, 320)
        XCTAssertEqual(button.frame.size.height, 44)
    }
    
    internal func testSetTitleFont() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test")
        button.setTitleFont(.helvetica, size: 18)
        
        XCTAssertEqual(button.frame.origin.x, 0)
        XCTAssertEqual(button.frame.origin.y, 0)
        XCTAssertEqual(button.frame.size.width, 320)
        XCTAssertEqual(button.frame.size.height, 44)
        XCTAssertEqual(button.title(for: UIControl.State.normal), "Test")
        XCTAssertEqual(button.titleLabel?.font?.fontName, "Helvetica")
        XCTAssertEqual(button.titleLabel?.font?.pointSize, 18)
    }
    
    internal func testSetTitleColor() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test")
        button.setTitleColor(UIColor.red)
        
        XCTAssertEqual(button.frame.origin.x, 0)
        XCTAssertEqual(button.frame.origin.y, 0)
        XCTAssertEqual(button.frame.size.width, 320)
        XCTAssertEqual(button.frame.size.height, 44)
        XCTAssertEqual(button.title(for: UIControl.State.normal), "Test")
        XCTAssertEqual(button.titleColor(for: UIControl.State.normal), UIColor.red)
    }
    
    internal func testSetTitleColorHighlightedColor() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test")
        button.setTitleColor(UIColor.red, highlightedColor: UIColor.blue)
        
        XCTAssertEqual(button.frame.origin.x, 0)
        XCTAssertEqual(button.frame.origin.y, 0)
        XCTAssertEqual(button.frame.size.width, 320)
        XCTAssertEqual(button.frame.size.height, 44)
        XCTAssertEqual(button.title(for: UIControl.State.normal), "Test")
        XCTAssertEqual(button.titleColor(for: UIControl.State.normal), UIColor.red)
        XCTAssertEqual(button.titleColor(for: UIControl.State.highlighted), UIColor.blue)
    }
}
