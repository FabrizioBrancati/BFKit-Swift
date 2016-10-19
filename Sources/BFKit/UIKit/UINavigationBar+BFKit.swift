//
//  UINavigationBar+BFKit.swift
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

/// This extesion adds some useful functions to UINavigationBar
public extension UINavigationBar {
    // MARK: - Instance functions -
    
    /**
     Set the UINavigationBar to transparent or not
    
     - parameter transparent: true to set it transparent, false to not
     - parameter translucent: A Boolean value indicating whether the navigation bar is translucent or not
     */
    public func setTransparent(_ transparent: Bool, translucent: Bool = true) {
        if transparent {
            self.setBackgroundImage(UIImage(), for: .default)
            self.shadowImage = UIImage()
            self.isTranslucent = translucent
        } else {
            self.setBackgroundImage(nil, for: .default)
            self.shadowImage = nil
            self.isTranslucent = translucent
        }
    }
}
