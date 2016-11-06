//
//  UIViewExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 06/11/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIViewExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBorderColorRadiusWidth() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.border(color: UIColor.red, radius: 5, width: 2)
        
        XCTAssert(view.layer.borderWidth == 2)
        XCTAssert(view.layer.cornerRadius == 5)
        XCTAssert(view.layer.borderColor == UIColor.red.cgColor)
    }
    
    func testRemoveBorder() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.border(color: UIColor.red, radius: 5, width: 2)
        view.removeBorder()
        
        XCTAssert(view.layer.borderWidth == 0)
        XCTAssert(view.layer.cornerRadius == 0)
        XCTAssert(view.layer.borderColor == nil)
    }
    
    func testCornerRadiusCornersRadius() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.cornerRadius(corners: .allCorners, radius: 5)
        
        XCTAssertNotNil(view.layer.mask)
    }
    
    func testShadowOffsetOpacityRadiusCornerRadiusColor() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.shadow(offset: CGSize(width: 5, height: 5), opacity: 0.5, radius: 5, cornerRadius: 5, color: UIColor.red)
        
        XCTAssert(view.layer.shadowColor == UIColor.red.cgColor)
        XCTAssert(view.layer.shadowOpacity == 0.5)
        XCTAssert(view.layer.shadowOffset == CGSize(width: 5, height: 5))
        XCTAssert(view.layer.shadowRadius == 5)
        XCTAssert(view.layer.cornerRadius == 5)
    }
    
    func testRemoveShadow() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.shadow(offset: CGSize(width: 5, height: 5), opacity: 0.5, radius: 5, cornerRadius: 5, color: UIColor.red)
        view.removeShadow()
        
        XCTAssert(view.layer.shadowColor == nil)
        XCTAssert(view.layer.shadowOpacity == 0)
        XCTAssert(view.layer.shadowOffset == CGSize(width: 0, height: 0))
        XCTAssert(view.layer.shadowRadius == 0)
        XCTAssert(view.layer.cornerRadius == 0)
    }
}
