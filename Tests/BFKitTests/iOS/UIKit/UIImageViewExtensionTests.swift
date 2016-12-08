//
//  UIImageViewExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 05/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
import Foundation
import UIKit
@testable import BFKit

class UIImageViewExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFrameImage() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 100), image: image)
        
        XCTAssert(imageView.frame == CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssert(imageView.image == image)
    }
    
    func testInitImageSizeCenter() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        let imageView = UIImageView(image: image, size: CGSize(width: 200, height: 100), center: CGPoint(x: 100, y: 50))
        
        XCTAssert(imageView.frame == CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssert(imageView.image == image)
    }
    
    func testInitImageCenter() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        let imageView = UIImageView(image: image, center: CGPoint(x: 100, y: 50))
        
        XCTAssert(imageView.frame == CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssert(imageView.image == image)
    }
    
    func testImageTemplateTintColor() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        let imageView = UIImageView(imageTemplate: image, tintColor: UIColor.red)
        
        XCTAssert(imageView.frame == CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssert(imageView.image == image)
    }
    
    func testShadowColorRadiusOffsetOpacity() {
        guard let image = UIImage(dummyImage: "200x100") else {
            XCTAssert(false)
            return
        }
        
        let imageView = UIImageView(image: image, center: CGPoint(x: 100, y: 50))
        imageView.shadow(color: UIColor.red, radius: 1, offset: CGSize(width: 1, height: 1), opacity: 1)
        
        XCTAssert(imageView.frame == CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssert(imageView.image == image)
    }
    
    func testMaskImage() {
        guard let image = UIImage(dummyImage: "200x100"), let mask = UIImage(dummyImage: "50x50") else {
            XCTAssert(false)
            return
        }
        
        let imageView = UIImageView(image: image, center: CGPoint(x: 100, y: 50))
        imageView.mask(image: mask)
        
        XCTAssert(imageView.frame == CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssert(imageView.image == image)
        XCTAssert(imageView.layer.mask?.frame == CGRect(x: 0, y: 0, width: 200, height: 100))
    }
}
