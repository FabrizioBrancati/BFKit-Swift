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
#if os(iOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif
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
        
        XCTAssertEqual(color, Color.red)
    }
    
    func testARGB() {
        let color = ARGB(1, 0, 255, 0)
        
        XCTAssertEqual(color, Color.green)
    }
    
    func testRGB() {
        let color = RGB(0, 0, 255)
        
        XCTAssertEqual(color, Color.blue)
    }
    
    func testRedComponent() {
        let color = Color.purple /// 0.5, 0.0, 0.5 RGB
        
        XCTAssertEqual(color.redComponent, 0.5)
    }
    
    func testGreenComponent() {
        let color = Color.orange /// 1.0, 0.5, 0.0 RGB
        
        XCTAssertEqual(color.greenComponent, 0.5)
    }
    
    func testBlueComponent() {
        let color = Color.purple /// 0.5, 0.0, 0.5 RGB
        
        XCTAssertEqual(color.blueComponent, 0.5)
    }
    
    func testWhiteComponent() {
        let color = Color.gray /// 0.5 white
        
        XCTAssertEqual(color.whiteComponent, 0.5)
    }
    
    func testLuminance() {
        let colorLight = Color.green
        let colorDark = Color.black
        
        XCTAssertGreaterThan(colorLight.luminance, 0.5)
        XCTAssertLessThan(colorDark.luminance, 0.5)
    }
    
    func testAlpha() {
        let color = Color.color(color: Color.red, alpha: 0.5)
        
        XCTAssertEqual(color.cgColor.alpha, 0.5)
    }
    
    func testHue() {
        let color = Color.cyan
        
        XCTAssertEqual(color.hue, 0.5)
    }
    
    func testSaturation() {
        let color = Color.blue
        
        XCTAssertEqual(color.saturation, 1)
    }
    
    func testBrightness() {
        let color = Color.brown
        
        XCTAssertEqual(color.brightness, 0.6)
    }
    
    func testHex() {
        let color = Color.magenta
        
        XCTAssertEqual(color.hex, "#FF00FF".lowercased())
    }
    
    func testInitHexAlpha() {
        let color = Color(hex: 0xFFFF00)
        
        XCTAssertEqual(color, Color.yellow)
    }
    
    func testInitHexAlphaFirst() {
        let color = Color(hex: "#00FFFFFF", alphaFirst: false)
        
        XCTAssertEqual(color, Color.cyan)
    }
    
    func testContrasting() {
        let colorDark = Color.brown
        
        XCTAssertEqual(colorDark.contrasting(), Color.white)
    }
    
    func testComplementary() {
        let color = Color.orange
        
        XCTAssertEqual(color.hex, "#FF7F00".lowercased()) /// Dark orange
    }
    
    func testCanProvideRGBComponents() {
        let rgbColor = Color.orange
        
        XCTAssertTrue(rgbColor.canProvideRGBComponents())
    }
    
    func testRandomAlpha() {
        let randomColor = Color.random(alpha: 1)
        
        XCTAssertTrue(randomColor.canProvideRGBComponents())
    }
    
    func testColorString() {
        let color = Color.color(string: "cyan")
        
        XCTAssertEqual(color, Color.cyan)
    }
    
    func testInitString() {
        let color = Color(string: "blue")
        
        XCTAssertEqual(color, Color.blue)
    }
    
    func testColorAlpha() {
        let color = Color.color(color: Color.red, alpha: 0.5)
        
        XCTAssertEqual(color.alpha, 0.5)
    }
}
