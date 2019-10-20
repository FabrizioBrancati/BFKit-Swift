//
//  UIColorExtensionTests.swift
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

import Foundation
import XCTest
#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif
@testable import BFKit

internal class UIColorExtensionTests: XCTestCase {
    #if canImport(UIKit)
        internal let red = Color.red
        internal let green = Color.green
        internal let blue = Color.blue
        internal let yellow = Color.yellow
        internal let cyan = Color.cyan
    #elseif canImport(AppKit)
        internal let red = Color(colorSpace: NSColorSpace.genericRGB, components: [1, 0, 0, 1], count: 4)
        internal let green = Color(colorSpace: NSColorSpace.genericRGB, components: [0, 1, 0, 1], count: 4)
        internal let blue = Color(colorSpace: NSColorSpace.genericRGB, components: [0, 0, 1, 1], count: 4)
        internal let yellow = Color(colorSpace: NSColorSpace.genericRGB, components: [1, 1, 0, 1], count: 4)
        internal let cyan = Color(colorSpace: NSColorSpace.genericRGB, components: [0, 1, 1, 1], count: 4)
    #endif

    internal func testRGBA() {
        let color = RGBA(255, 0, 0, 1)
        
        XCTAssertEqual(color, red)
    }
    
    internal func testARGB() {
        let color = ARGB(1, 0, 255, 0)
        
        XCTAssertEqual(color, green)
    }
    
    internal func testRGB() {
        let color = RGB(0, 0, 255)
        
        XCTAssertEqual(color, blue)
    }
    
    internal func testRedComponent() {
        let color = Color.purple /// 0.5, 0.0, 0.5 RGB
        
        XCTAssertEqual(color.redComponent, 0.5)
    }
    
    internal func testGreenComponent() {
        let color = Color.orange /// 1.0, 0.5, 0.0 RGB
        
        XCTAssertEqual(color.greenComponent, 0.5)
    }
    
    internal func testBlueComponent() {
        let color = Color.purple /// 0.5, 0.0, 0.5 RGB
        
        XCTAssertEqual(color.blueComponent, 0.5)
    }
    
    internal func testWhiteComponent() {
        let color = Color.gray /// 0.5 white
        
        XCTAssertEqual(color.whiteComponent, 0.5)
    }
    
    internal func testLuminance() {
        let colorLight = Color.green
        let colorDark = Color.black
        
        XCTAssertGreaterThan(colorLight.luminance, 0.5)
        XCTAssertLessThan(colorDark.luminance, 0.5)
    }
    
    internal func testAlpha() {
        let color = Color.color(color: Color.red, alpha: 0.5)
        
        XCTAssertEqual(color.cgColor.alpha, 0.5)
    }
    
    internal func testHue() {
        let color = Color.cyan
        
        XCTAssertEqual(color.hue, 0.5)
    }
    
    internal func testSaturation() {
        let color = Color.blue
        
        XCTAssertEqual(color.saturation, 1)
    }
    
    internal func testBrightness() {
        let color = Color.brown
        
        XCTAssertEqual(color.brightness, 0.6)
    }
    
    internal func testHex() {
        let color = Color.magenta
        
        XCTAssertEqual(color.hex, "#FF00FF".lowercased())
    }
    
    internal func testInitHexAlpha() {
        let color = Color(hex: 0xFFFF00)
        
        XCTAssertEqual(color, yellow)
    }
    
    internal func testInitHexAlphaFirst() {
        let color = Color(hex: "0FF")
        let color2 = Color(hex: "00FF", alphaFirst: true)
        let color3 = Color(hex: "0FF0")
        let color4 = Color(hex: "00FFFF")
        let color5 = Color(hex: "#00FFFFFF", alphaFirst: false)
        let color6 = Color(hex: "#FF00FFFF", alphaFirst: true)
        
        XCTAssertEqual(color, cyan)
        XCTAssertEqual(color2, cyan.withAlphaComponent(0))
        XCTAssertEqual(color3, cyan.withAlphaComponent(0))
        XCTAssertEqual(color4, cyan)
        XCTAssertEqual(color5, cyan)
        XCTAssertEqual(color6, cyan)
    }
    
    internal func testContrasting() {
        let colorDark = Color.brown
        let colorLight = Color.yellow
        
        XCTAssertEqual(colorDark.contrasting(), Color.white)
        XCTAssertEqual(colorLight.contrasting(), Color.black)
    }
    
    internal func testComplementary() {
        let color = Color.orange
        
        XCTAssertEqual(color.hex, "#FF7F00".lowercased()) /// Dark orange
    }
    
    internal func testCanProvideRGBComponents() {
        let rgbColor = Color.orange
        
        XCTAssertTrue(rgbColor.canProvideRGBComponents())
    }
    
    internal func testRandomAlpha() {
        let randomColor = Color.random(alpha: 1)
        
        XCTAssertTrue(randomColor.canProvideRGBComponents())
    }
    
    internal func testColorString() {
        _ = Color.color(string: "black")
        _ = Color.color(string: "darkGray")
        _ = Color.color(string: "lightGray")
        let white = Color.color(string: "white")
        let gray = Color.color(string: "gray")
        let red = Color.color(string: "red")
        let green = Color.color(string: "green")
        let blue = Color.color(string: "blue")
        let cyan = Color.color(string: "cyan")
        let yellow = Color.color(string: "yellow")
        let magenta = Color.color(string: "magenta")
        let orange = Color.color(string: "orange")
        let purple = Color.color(string: "purple")
        let brown = Color.color(string: "brown")
        let clear = Color.color(string: "clear")
        
//        XCTAssertEqual(black, Color.black)
//        XCTAssertEqual(darkGray, Color.darkGray)
//        XCTAssertEqual(lightGray, Color.lightGray)
        XCTAssertEqual(white, Color.white)
        XCTAssertEqual(gray, Color.gray)
        XCTAssertEqual(red, Color.red)
        XCTAssertEqual(green, Color.green)
        XCTAssertEqual(blue, Color.blue)
        XCTAssertEqual(cyan, Color.cyan)
        XCTAssertEqual(yellow, Color.yellow)
        XCTAssertEqual(magenta, Color.magenta)
        XCTAssertEqual(orange, Color.orange)
        XCTAssertEqual(purple, Color.purple)
        XCTAssertEqual(brown, Color.brown)
        XCTAssertEqual(clear, Color.clear)
        
        _ = Color.color(string: "darkOrange")
        let color3 = Color.color(string: "")
        
//        XCTAssertEqual(color2, Color.black)
        XCTAssertEqual(color3, Color.black)
    }
    
    internal func testInitString() {
        let color = Color(string: "blue")
        
        XCTAssertEqual(color, Color.blue)
    }
    
    internal func testColorAlpha() {
        let color = Color.color(color: Color.red, alpha: 0.5)
        
        XCTAssertEqual(color.alpha, 0.5)
    }
}
