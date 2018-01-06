//
//  BFButtonTests.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati. All rights reserved.
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

class BFButtonTests: XCTestCase {
    var button: BFButton = BFButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44), image: UIImage(color: UIColor.red)!, highlightedImage: UIImage(color: UIColor.red)!, fadeDuration: 1)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEncodeDecode() {
        FileManager.default.savePlist(object: button, in: .cache, filename: "BFButton")
        let decoded = FileManager.default.readPlist(from: .cache, filename: "BFButton") as? BFButton
        
        XCTAssertEqual(decoded?.frame, CGRect(x: 0, y: 0, width: 100, height: 44))
    }
    
    func testIsHighlighted() {
        button.isHighlighted = true
        XCTAssertTrue(button.isHighlighted, "isHighlighted is not true")
        
        button.isHighlighted = false
        XCTAssertTrue(!button.isHighlighted, "isHighlighted is not false")
    }
    
    func testOverlayImageView() {
        button.overlayImageView = UIImageView(image: UIImage(color: UIColor.red))
        
        XCTAssertNotNil(button.overlayImageView.image)
    }
    
    func testInitFrame() {
        XCTAssertTrue(!button.isHighlighted)
    }
}
