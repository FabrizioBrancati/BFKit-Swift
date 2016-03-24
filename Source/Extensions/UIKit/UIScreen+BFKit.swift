//
//  UIScreen+BFKit.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
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
import UIKit

// MARK: - Global variables -

/// Get the screen width
public var SCREEN_WIDTH: CGFloat {
    get {
        return UIScreen.mainScreen().fixedScreenSize().width
    }
}

/// Get the screen height
public var SCREEN_HEIGHT: CGFloat {
    get {
        return UIScreen.mainScreen().fixedScreenSize().height
    }
}

/// Get the maximum screen length
public var SCREEN_MAX_LENGTH: CGFloat {
    get {
        return max(SCREEN_WIDTH, SCREEN_HEIGHT)
    }
}
/// Get the minimum screen length
public var SCREEN_MIN_LENGTH: CGFloat {
    get {
        return min(SCREEN_WIDTH, SCREEN_HEIGHT)
    }
}

/**
 *  A structure of Bool to check the screen size
 */
public struct SCREENSIZE {
    public static let IS_IPHONE_4_OR_LESS = UIDevice.currentDevice().userInterfaceIdiom == .Phone && SCREEN_MAX_LENGTH < 568.0
    public static let IS_IPHONE_5 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && SCREEN_MAX_LENGTH == 568.0
    public static let IS_IPHONE_6 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && SCREEN_MAX_LENGTH == 667.0
    public static let IS_IPHONE_6P = UIDevice.currentDevice().userInterfaceIdiom == .Phone && SCREEN_MAX_LENGTH == 736.0
    public static let IS_IPAD = UIDevice.currentDevice().userInterfaceIdiom == .Pad && SCREEN_MAX_LENGTH == 1024.0
}

/// This extesion adds some useful functions to UIScreen
public extension UIScreen {
    // MARK: - Class functions -
    
    /**
     Check if the current device has a Retina display
    
     - returns: Returns true if it has a Retina display, false if not
     */
    public static func isRetina() -> Bool {
        if UIScreen.mainScreen().respondsToSelector(#selector(UIScreen.displayLinkWithTarget(_:selector:))) && (UIScreen.mainScreen().scale == 2.0 || UIScreen.mainScreen().scale == 3.0) {
            return true
        } else {
            return false
        }
    }
    
    /**
     Check if the current device has a Retina HD display
    
     - returns: Returns true if it has a Retina HD display, false if not
     */
    public static func isRetinaHD() -> Bool {
        if UIScreen.mainScreen().respondsToSelector(#selector(UIScreen.displayLinkWithTarget(_:selector:))) && UIScreen.mainScreen().scale == 3.0 {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Instance functions -
    
    /**
     Returns the fixed screen size, based on device orientation
    
     - returns: Returns a GCSize with the fixed screen size
     */
    public func fixedScreenSize() -> CGSize {
        let screenSize = self.bounds.size
        
        if NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1 && UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation) {
            return CGSizeMake(screenSize.height, screenSize.width)
        }
        
        return screenSize
    }
    
    /// 0.0 to 1.0, where 1.0 is maximum brightness
    public static var brightness: Float {
        get {
            return Float(UIScreen.brightness)
        }
        set(newValue) {
            UIScreen.brightness = newValue
        }
    }
}
