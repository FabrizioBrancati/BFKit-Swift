//
//  UIScrollView+BFKit.swift
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

/// This extesion adds some useful functions to UIScrollView
public extension UIScrollView {
    // MARK: - Init functions -
    
    /**
     Create an UIScrollView and set some parameters
    
     - parameter frame:                ScrollView's frame
     - parameter contentSize:          ScrollView's content size
     - parameter clipsToBounds:        Set if ScrollView has to clips to bounds
     - parameter pagingEnabled:        Set if ScrollView has paging enabled
     - parameter showScrollIndicators: Set if ScrollView has to show the scroll indicators, vertical and horizontal
     - parameter delegate:             ScrollView's delegate
    
     - returns: Returns the created UIScrollView
     */
    public convenience init(frame: CGRect, contentSize: CGSize, clipsToBounds: Bool, pagingEnabled: Bool, showScrollIndicators: Bool, delegate: UIScrollViewDelegate?) {
        self.init(frame: frame)
        self.delegate = delegate
        self.isPagingEnabled = pagingEnabled
        self.clipsToBounds = clipsToBounds
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.contentSize = contentSize
    }
}
