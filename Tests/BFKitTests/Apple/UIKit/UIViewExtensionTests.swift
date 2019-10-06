//
//  UIViewExtensionTests.swift
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

internal class UIViewExtensionTests: XCTestCase {
    internal var view = UIView()
    
    override internal func setUp() {
        super.setUp()
        
        view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    }

    internal func testInitFrameBackgroundColor() {
        let coloredView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100), backgroundColor: UIColor.red)
        
        XCTAssertEqual(coloredView.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
        XCTAssertEqual(coloredView.backgroundColor, UIColor.red)
    }
    
    internal func testBorderColorRadiusWidth() {
        view.border(color: UIColor.red, radius: 5, width: 2)
        
        XCTAssertEqual(view.layer.borderWidth, 2)
        XCTAssertEqual(view.layer.cornerRadius, 5)
        XCTAssertEqual(view.layer.borderColor, UIColor.red.cgColor)
    }
    
    internal func testRemoveBorder() {
        view.border(color: UIColor.red, radius: 5, width: 2)
        view.removeBorder()
        
        XCTAssertEqual(view.layer.borderWidth, 0)
        XCTAssertEqual(view.layer.cornerRadius, 0)
        XCTAssertNil(view.layer.borderColor)
    }
    
    internal func testCornerRadiusCornersRadius() {
        view.cornerRadius(corners: .allCorners, radius: 5)
        
        if #available(iOS 11, *) {
            XCTAssertEqual(view.layer.cornerRadius, 5)
            XCTAssertEqual(view.layer.maskedCorners, [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
        } else {
            XCTAssertNotNil(view.layer.mask)
        }
    }
    
    internal func testCornerRadiusRadius() {
        view.cornerRadius(5)
        
        XCTAssertEqual(view.layer.cornerRadius, 5)
    }
    
    internal func testShadowOffsetOpacityRadiusCornerRadiusColor() {
        view.shadow(offset: CGSize(width: 5, height: 5), opacity: 0.5, radius: 5, cornerRadius: 5, color: UIColor.red)
        
        XCTAssertEqual(view.layer.shadowColor, UIColor.red.cgColor)
        XCTAssertEqual(view.layer.shadowOpacity, 0.5)
        XCTAssertEqual(view.layer.shadowOffset, CGSize(width: 5, height: 5))
        XCTAssertEqual(view.layer.shadowRadius, 5)
        XCTAssertEqual(view.layer.cornerRadius, 5)
    }
    
    internal func testRemoveShadow() {
        view.shadow(offset: CGSize(width: 5, height: 5), opacity: 0.5, radius: 5, cornerRadius: 5, color: UIColor.red)
        view.removeShadow()
        
        XCTAssertNil(view.layer.shadowColor)
        XCTAssertEqual(view.layer.shadowOpacity, 0)
        XCTAssertEqual(view.layer.shadowOffset, CGSize(width: 0, height: 0))
        XCTAssertEqual(view.layer.shadowRadius, 0)
        XCTAssertEqual(view.layer.cornerRadius, 0)
    }
    
    internal func testGradientColorsDirection() {
        view.gradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .vertical)
        view.gradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .horizontal)
        view.gradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .diagonalLeftTopToRightDown)
        view.gradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .diagonalRightTopToLeftDown)
        view.gradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .diagonalLeftDownToRightTop)
        view.gradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .diagonalRightDownToLeftTop)
        view.gradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .custom(startPoint: CGPoint(x: 10, y: 10), endPoint: CGPoint(x: 90, y: 90)))
        
        XCTAssertEqual(view.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
    }
    
    internal func testSmoothGradientColorsDirectionTypeLinear() {
        view.smoothGradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .custom(startPoint: CGPoint(x: 10, y: 10), endPoint: CGPoint(x: 90, y: 90)), type: .linear)
        
        XCTAssertEqual(view.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
    }
    
    internal func testSmoothGradientColorsDirectionTypeGradient() {
        view.smoothGradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .vertical, type: .linear)
        view.smoothGradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .horizontal, type: .linear)
        view.smoothGradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .diagonalLeftTopToRightDown, type: .linear)
        view.smoothGradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .diagonalRightTopToLeftDown, type: .linear)
        view.smoothGradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .diagonalLeftDownToRightTop, type: .linear)
        view.smoothGradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .diagonalRightDownToLeftTop, type: .linear)
        view.smoothGradient(colors: [UIColor.red, UIColor.green, UIColor.blue], direction: .custom(startPoint: CGPoint(x: 10, y: 10), endPoint: CGPoint(x: 90, y: 90)), type: .linear)
        
        XCTAssertEqual(view.frame, CGRect(x: 0, y: 0, width: 200, height: 100))
    }
    
    internal func testApplyMotionEffect() {
        view.applyMotionEffects()
        
        XCTAssertNotEqual(view.motionEffects, [])
    }
    
    internal func testScreenshotSave() {
        guard let screenshot = view.screenshot(save: true) else {
            XCTFail("`testScreenshotSave` error")
            return
        }
        
        XCTAssertNotNil(screenshot)
    }
    
    internal func testRemoveAllSubviews() {
        let view2 = UIView()
        view.addSubview(view2)
        
        XCTAssertEqual(view.subviews.count, 1)
        
        view.removeAllSubviews()
        
        XCTAssertEqual(view.subviews.count, 0)
    }
    
    internal func testShakeCountDurationTranslation() {
        view.shake(count: 5, duration: 1, translation: 10)
        
        XCTAssertNotNil(view.layer.animation(forKey: "shake"))
    }
    
    internal func testPulseCountDuration() {
        view.pulse(count: 5, duration: 1)
        
        XCTAssertNotNil(view.layer.animation(forKey: "pulse"))
    }
    
    internal func testHeartbeatMaxSizeDurationPerBeat() {
        view.heartbeat(count: 5, maxSize: 1.4, durationPerBeat: 1)
        
        XCTAssertNotNil(view.layer.animation(forKey: "heartbeat"))
    }
    
    internal func testFlipDurationDirection() {
        view.flip(duration: 1, direction: .top)
        
//        XCTAssertNotNil(view.layer.action(forKey: "flip"))
    }
    
    internal func testTranslateAroundTopViewDurationDIrectionRepeatAnimationStartFromEdge() {
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 100))
        view.translateAround(topView: topView, duration: 1, direction: .leftToRight, repeatAnimation: true, startFromEdge: true)
        view.translateAround(topView: topView, duration: 1, direction: .rightToLeft, repeatAnimation: false, startFromEdge: false)
        
        XCTAssertEqual(view.frame.width, 200)
        XCTAssertEqual(view.frame.height, 100)
    }
    
    internal func testAnimatePathCountDurationAutoreverses() {
        let path = UIBezierPath()
        path.addLine(to: CGPoint(x: 100, y: 100))
        view.animate(path: path, count: 1, duration: 1, autoreverses: false)
        
        XCTAssertNotNil(view.layer.animation(forKey: "animateAlongPath"))
    }
    
    internal func testBorderWidth() {
        view.borderWidth = 2
        
        XCTAssertEqual(view.borderWidth, 2)
    }
    
    internal func testBorderColor() {
        view.borderColor = UIColor.red
        
        XCTAssertEqual(view.borderColor, UIColor.red)
    }
    
    internal func testMaskToBounds() {
        view.maskToBounds = true
        
        XCTAssertTrue(view.maskToBounds)
    }
    
    internal func testCornerRadius() {
        view.cornerRadius = 5
        
        XCTAssertEqual(view.cornerRadius, 5)
    }
    
    internal func testShadowColor() {
        view.shadowColor = UIColor.blue
        
        XCTAssertEqual(view.shadowColor, UIColor.blue)
    }
    
    internal func testShadowOpacity() {
        view.shadowOpacity = 0.5
        
        XCTAssertEqual(view.shadowOpacity, 0.5)
    }
    
    internal func testShadowOffsetX() {
        view.shadowOffsetX = 2
        let shadowOffsetX = view.shadowOffsetX
        
        XCTAssertEqual(view.layer.shadowOffset, CGSize(width: 2, height: view.layer.shadowOffset.height))
        XCTAssertEqual(shadowOffsetX, 2)
    }
    
    internal func testShadowOffsetY() {
        view.shadowOffsetY = 2
        let shadowOffsetY = view.shadowOffsetY
        
        XCTAssertEqual(view.layer.shadowOffset, CGSize(width: view.layer.shadowOffset.width, height: 2))
        XCTAssertEqual(shadowOffsetY, 2)
    }
    
    internal func testShadowRadius() {
        view.shadowRadius = 5
        
        XCTAssertEqual(view.shadowRadius, 5)
    }
}
