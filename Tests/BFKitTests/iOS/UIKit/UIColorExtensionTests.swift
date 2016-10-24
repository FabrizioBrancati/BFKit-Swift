//
//  UIColorExtensionTests.swift
//  BFKit
//
//  Created by Fabrizio on 24/10/16.
//  Copyright © 2016 Fabrizio Brancati. All rights reserved.
//

import XCTest
@testable import BFKit

class UIColorExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRGBA() {
        let color = RGBA(255, 0, 0, 1)
        
        XCTAssert(color == UIColor.red)
    }
    
    func testARGB() {
        let color = ARGB(1, 0, 255, 0)
        
        XCTAssert(color == UIColor.green)
    }
    
    func testRGB() {
        let color = RGB(0, 0, 255)
        
        XCTAssert(color == UIColor.blue)
    }
    
    func testRedComponent() {
        let color = UIColor.purple /// 0.5, 0.0, 0.5 RGB
        
        XCTAssert(color.redComponent == 0.5)
    }
    
    func testGreenComponent() {
        let color = UIColor.orange /// 1.0, 0.5, 0.0 RGB
        
        XCTAssert(color.greenComponent == 0.5)
    }
    
    func testBlueComponent() {
        let color = UIColor.purple /// 0.5, 0.0, 0.5 RGB
        
        XCTAssert(color.blueComponent == 0.5)
    }
    
    func testWhiteComponent() {
        let color = UIColor.gray /// 0.5 white
        
        XCTAssert(color.whiteComponent == 0.5)
    }
    
    func testHue() {
        let color = UIColor.cyan
        
        XCTAssert(color.hue == 0.5)
    }
    
    func testSaturation() {
        let color = UIColor.blue
        
        XCTAssert(color.saturation == 1)
    }
    
    func testBrightness() {
        let color = UIColor.brown
        
        XCTAssert(color.brightness == 0.6)
    }
    
    func testAlpha() {
        let color = UIColor.color(color: UIColor.red, alpha: 0.5)
        
        XCTAssert(color.cgColor.alpha == 0.5)
    }
    
    func testLuminance() {
        let colorGreen = UIColor.green
        let colorBlack = UIColor.black
        
        XCTAssert(colorGreen.luminance > 0.5)
        XCTAssert(colorBlack.luminance < 0.5)
    }
}
