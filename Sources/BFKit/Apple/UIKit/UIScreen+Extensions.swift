//
//  UIScreen+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati.
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

// MARK: - UIScreen extension

/// This extesion adds some useful functions to UIScreen.
public extension UIScreen {
    // MARK: - Variables
    
    /// Get the screen width.
    public static var screenWidth: CGFloat {
        return UIScreen.fixedScreenSize().width
    }
    
    /// Get the screen height.
    public static var screenHeight: CGFloat {
        return UIScreen.fixedScreenSize().height
    }
    
    /// Get the maximum screen length.
    public static var maxScreenLength: CGFloat {
        return max(screenWidth, screenHeight)
    }
    /// Get the minimum screen length.
    public static var minScreenLength: CGFloat {
        return min(screenWidth, screenHeight)
    }
    
    // MARK: - Functions
    
    /// Check if current device has a Retina display.
    ///
    /// - Returns: Returns true if it has a Retina display, otherwise false.
    public static func isRetina() -> Bool {
        return UIScreen.main.responds(to: #selector(UIScreen.displayLink(withTarget:selector:))) && UIScreen.main.scale == 2.0
    }
    
    /// Check if current device has a Retina HD display.
    ///
    /// - Returns: Returns true if it has a Retina HD display, otherwise false.
    public static func isRetinaHD() -> Bool {
        return UIScreen.main.responds(to: #selector(UIScreen.displayLink(withTarget:selector:))) && UIScreen.main.scale == 3.0
    }
    
    /// Returns fixed screen size, based on device orientation.
    ///
    /// - Returns: Returns a GCSize with the fixed screen size.
    public static func fixedScreenSize() -> CGSize {
        return UIScreen.main.bounds.size
    }
}
