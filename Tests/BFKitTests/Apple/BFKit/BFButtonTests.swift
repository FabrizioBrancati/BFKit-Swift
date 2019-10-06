//
//  BFButtonTests.swift
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

internal class BFButtonTests: XCTestCase {
    internal var button = BFButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44), image: UIImage(color: UIColor.red)!, highlightedImage: UIImage(color: UIColor.red)!, fadeDuration: 1) // swiftlint:disable:this force_unwrapping
    
    internal func testEncodeDecode() {
        FileManager.default.savePlist(object: button, in: .cache, filename: "BFButton")
        let decoded = FileManager.default.readPlist(from: .cache, filename: "BFButton") as? BFButton
        
        XCTAssertEqual(decoded?.frame, CGRect(x: 0, y: 0, width: 100, height: 44))
    }
    
    internal func testIsHighlighted() {
        button.isHighlighted = true
        XCTAssertTrue(button.isHighlighted, "isHighlighted is not true")
        
        button.isHighlighted = false
        XCTAssertTrue(!button.isHighlighted, "isHighlighted is not false")
    }
    
    internal func testOverlayImageView() {
        button.overlayImageView = UIImageView(image: UIImage(color: UIColor.red))
        
        XCTAssertNotNil(button.overlayImageView.image)
    }
    
    internal func testInitFrame() {
        XCTAssertTrue(!button.isHighlighted)
    }
}
