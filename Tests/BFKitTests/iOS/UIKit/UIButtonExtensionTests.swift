//
//  UIButtonExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 23/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
import UIKit
@testable import BFKit

class UIButtonExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFrameTitleBackgroundImageHighlightedBackgroundImage() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test", backgroundImage: UIImage(color: UIColor.red), highlightedBackgroundImage: UIImage(color: UIColor.blue))
        
        XCTAssert(button.frame.origin.x == 0)
        XCTAssert(button.frame.origin.y == 0)
        XCTAssert(button.frame.size.width == 320)
        XCTAssert(button.frame.size.height == 44)
        XCTAssert(button.title(for: .normal) == "Test")
    }
    
    func testInitFrameTitleColor() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test", color: UIColor.red)
        
        XCTAssert(button.frame.origin.x == 0)
        XCTAssert(button.frame.origin.y == 0)
        XCTAssert(button.frame.size.width == 320)
        XCTAssert(button.frame.size.height == 44)
        XCTAssert(button.title(for: .normal) == "Test")
    }
    
    func testInitFrameTitleColorHighlightedColor() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test", color: UIColor.red, highlightedColor: UIColor.blue)
        
        XCTAssert(button.frame.origin.x == 0)
        XCTAssert(button.frame.origin.y == 0)
        XCTAssert(button.frame.size.width == 320)
        XCTAssert(button.frame.size.height == 44)
        XCTAssert(button.title(for: .normal) == "Test")
    }
    
    func testInitFrameImageHighlightedImage() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), image: UIImage(color: UIColor.red)!, highlightedImage: UIImage(color: UIColor.blue))
        
        XCTAssert(button.frame.origin.x == 0)
        XCTAssert(button.frame.origin.y == 0)
        XCTAssert(button.frame.size.width == 320)
        XCTAssert(button.frame.size.height == 44)
    }
    
    func testSetTitleFont() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test")
        button.setTitleFont(.Helvetica, size: 18)
        
        XCTAssert(button.frame.origin.x == 0)
        XCTAssert(button.frame.origin.y == 0)
        XCTAssert(button.frame.size.width == 320)
        XCTAssert(button.frame.size.height == 44)
        XCTAssert(button.title(for: .normal) == "Test")
        XCTAssert(button.titleLabel?.font!.fontName == "Helvetica")
        XCTAssert(button.titleLabel?.font!.pointSize == 18)
    }
    
    func testSetTitleColor() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test")
        button.setTitleColor(UIColor.red)
        
        XCTAssert(button.frame.origin.x == 0)
        XCTAssert(button.frame.origin.y == 0)
        XCTAssert(button.frame.size.width == 320)
        XCTAssert(button.frame.size.height == 44)
        XCTAssert(button.title(for: .normal) == "Test")
        XCTAssert(button.titleColor(for: .normal) == UIColor.red)
    }
    
    func testSetTitleColorHighlightedColor() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 44), title: "Test")
        button.setTitleColor(UIColor.red, highlightedColor: UIColor.blue)
        
        XCTAssert(button.frame.origin.x == 0)
        XCTAssert(button.frame.origin.y == 0)
        XCTAssert(button.frame.size.width == 320)
        XCTAssert(button.frame.size.height == 44)
        XCTAssert(button.title(for: .normal) == "Test")
        XCTAssert(button.titleColor(for: .normal) == UIColor.red)
        XCTAssert(button.titleColor(for: .highlighted) == UIColor.blue)
    }
}
