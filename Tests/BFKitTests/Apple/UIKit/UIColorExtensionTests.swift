//
//  UIColorExtensionTests.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2017 Fabrizio Brancati. All rights reserved.
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

class UIColorExtensionTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRGBA() {
        let color = RGBA(255, 0, 0, 1)
        
        XCTAssertEqual(color, UIColor.red)
    }
    
    func testARGB() {
        let color = ARGB(1, 0, 255, 0)
        
        XCTAssertEqual(color, UIColor.green)
    }
    
    func testRGB() {
        let color = RGB(0, 0, 255)
        
        XCTAssertEqual(color, UIColor.blue)
    }
    
    func testRedComponent() {
        let color = UIColor.purple /// 0.5, 0.0, 0.5 RGB
        
        XCTAssertEqual(color.redComponent, 0.5)
    }
    
    func testGreenComponent() {
        let color = UIColor.orange /// 1.0, 0.5, 0.0 RGB
        
        XCTAssertEqual(color.greenComponent, 0.5)
    }
    
    func testBlueComponent() {
        let color = UIColor.purple /// 0.5, 0.0, 0.5 RGB
        
        XCTAssertEqual(color.blueComponent, 0.5)
    }
    
    func testWhiteComponent() {
        let color = UIColor.gray /// 0.5 white
        
        XCTAssertEqual(color.whiteComponent, 0.5)
    }
    
    func testLuminance() {
        let colorLight = UIColor.green
        let colorDark = UIColor.black
        
        XCTAssertGreaterThan(colorLight.luminance, 0.5)
        XCTAssertLessThan(colorDark.luminance, 0.5)
    }
    
    func testAlpha() {
        let color = UIColor.color(color: UIColor.red, alpha: 0.5)
        
        XCTAssertEqual(color.cgColor.alpha, 0.5)
    }
    
    func testHue() {
        let color = UIColor.cyan
        
        XCTAssertEqual(color.hue, 0.5)
    }
    
    func testSaturation() {
        let color = UIColor.blue
        
        XCTAssertEqual(color.saturation, 1)
    }
    
    func testBrightness() {
        let color = UIColor.brown
        
        XCTAssertEqual(color.brightness, 0.6)
    }
    
    func testHex() {
        let color = UIColor.magenta
        
        XCTAssertEqual(color.hex, "#FF00FF".lowercased())
    }
    
    func testInitHexAlpha() {
        let color = UIColor(hex: 0xFFFF00)
        
        XCTAssertEqual(color, UIColor.yellow)
    }
    
    func testInitHexAlphaFirst() {
        let color = UIColor(hex: "#00FFFFFF", alphaFirst: false)
        
        XCTAssertEqual(color, UIColor.cyan)
    }
    
    func testContrasting() {
        let colorDark = UIColor.brown
        
        XCTAssertEqual(colorDark.contrasting(), UIColor.white)
    }
    
    func testComplementary() {
        let color = UIColor.orange
        
        XCTAssertEqual(color.hex, "#FF7F00".lowercased()) /// Dark orange
    }
    
    func testCanProvideRGBComponents() {
        let rgbColor = UIColor.orange
        
        XCTAssertTrue(rgbColor.canProvideRGBComponents())
    }
    
    func testRandomAlpha() {
        let randomColor = UIColor.random(alpha: 1)
        
        XCTAssertTrue(randomColor.canProvideRGBComponents())
    }
    
    func testColorString() {
        let color = UIColor.color(string: "cyan")
        
        XCTAssertEqual(color, UIColor.cyan)
    }
    
    func testInitString() {
        let color = UIColor(string: "blue")
        
        XCTAssertEqual(color, UIColor.blue)
    }
    
    func testColorAlpha() {
        let color = UIColor.color(color: UIColor.red, alpha: 0.5)
        
        XCTAssertEqual(color.alpha, 0.5)
    }
}
