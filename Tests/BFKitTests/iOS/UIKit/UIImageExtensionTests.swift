//
//  UIImageExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 02/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIImageExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitDummyImage() {
        guard let image = UIImage(dummyImage: "100x100.red") else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testInitHeightWidthColor() {
        guard let image = UIImage(width: 200, height: 200, color: "green") else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 200)
        XCTAssert(image.size.height == 200)
    }
    
    func testInitSizeColor() {
        guard let image = UIImage(size: CGSize(width: 150, height: 150), color: "yellow") else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 150)
        XCTAssert(image.size.height == 150)
    }
    
    func testInitTextFontFontSizeImageSize() {
        guard let image = UIImage(text: "This is a test", font: .Helvetica, fontSize: 16, imageSize: CGSize(width: 100, height: 100)) else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testInitMaskedTextFontFontSizeImageSizeBackgroundColor() {
        guard let image = UIImage(maskedText: "This is a test", font: .Helvetica, fontSize: 20, imageSize: CGSize(width: 100, height: 100), backgroundColor: UIColor.brown) else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testInitColor() {
        guard let image = UIImage(color: UIColor.gray) else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(image.size.width == 1)
        XCTAssert(image.size.height == 1)
    }
    
    func testBlendImageBlendMode() {
        guard var image = UIImage(dummyImage: "100x100.red"), let imageBlend = UIImage(color: UIColor.blue) else {
            XCTAssert(false)
            return
        }
        
        image = image.blend(image: imageBlend, blendMode: .luminosity)
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testImageRect() {
        guard var image = UIImage(dummyImage: "100x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.crop(in: CGRect(x: 0, y: 0, width: 75, height: 75))
        
        XCTAssert(image.size.width == 75)
        XCTAssert(image.size.height == 75)
    }
    
    func testScaleProportionallyToMinimumSize() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        image = image.scaleProportionally(toMinimumSize: CGSize(width: 100, height: 100))
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 100)
    }
    
    func testScaleProportionallyToMaximumSize() {
        guard var image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
     
        image = image.scaleProportionally(toMaximumSize: CGSize(width: 100, height: 100))
        
        XCTAssert(image.size.width == 100)
        XCTAssert(image.size.height == 50)
    }
}
