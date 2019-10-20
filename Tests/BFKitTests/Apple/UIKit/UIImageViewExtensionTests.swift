//
//  UIImageViewExtensionTests.swift
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

internal class UIImageViewExtensionTests: XCTestCase {
    internal func testInitFrameImage() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTFail("`testInitFrameImage` error")
            return
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 100), image: image)
        
        XCTAssertEqual(imageView.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssertEqual(imageView.image, image)
    }
    
    internal func testInitImageSizeCenter() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTFail("`testInitImageSizeCenter` error")
            return
        }
        
        let imageView = UIImageView(image: image, size: CGSize(width: 200, height: 100), center: CGPoint(x: 100, y: 50))
        
        XCTAssertEqual(imageView.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssertEqual(imageView.image, image)
    }
    
    internal func testInitImageCenter() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTFail("`testInitImageCenter` error")
            return
        }
        
        let imageView = UIImageView(image: image, center: CGPoint(x: 100, y: 50))
        
        XCTAssertEqual(imageView.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssertEqual(imageView.image, image)
    }
    
    internal func testImageTemplateTintColor() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTFail("`testImageTemplateTintColor` error")
            return
        }
        
        let imageView = UIImageView(imageTemplate: image, tintColor: UIColor.red)
        
        XCTAssertEqual(imageView.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssertEqual(imageView.image, image)
    }
    
    internal func testShadowColorRadiusOffsetOpacity() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTFail("`testShadowColorRadiusOffsetOpacity` error")
            return
        }
        
        let imageView = UIImageView(image: image, center: CGPoint(x: 100, y: 50))
        imageView.shadow(color: UIColor.red, radius: 1, offset: CGSize(width: 1, height: 1), opacity: 1)
        
        XCTAssertEqual(imageView.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssertEqual(imageView.image, image)
    }
    
    internal func testMaskImage() {
        guard let image = UIImage(dummyImage: "200x100"), let mask = UIImage(dummyImage: "50x50") else {
            XCTFail("`testMaskImage` error")
            return
        }
        
        let imageView = UIImageView(image: image, center: CGPoint(x: 100, y: 50))
        imageView.mask(image: mask)
        
        XCTAssertEqual(imageView.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssertEqual(imageView.image, image)
        XCTAssertEqual(imageView.layer.mask?.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
    }
}
