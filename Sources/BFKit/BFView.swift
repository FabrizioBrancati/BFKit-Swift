//
//  BFButton.swift
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

/// This class adds some useful functions to UIView that cannot be in an extension
@IBDesignable public class BFView: UIView {
    // MARK: - Variables -
    
    /// Inspectable corners size
    @IBInspectable public var cornerSize: CGFloat = 0
    /// Inspectable border size
    @IBInspectable public var borderSize: CGFloat = 0
    /// Inspectable border color
    @IBInspectable public var borderColor: UIColor = UIColor.black
    /// Inspectable border alpha
    @IBInspectable public var borderAlpha: CGFloat = 1.0
    /// Inspectable shadow, only shadow or only corner size
    @IBInspectable public var shadow: Bool = false
    /// Inspectable shadow color
    @IBInspectable public var shadowColor: UIColor = UIColor.black
    /// Inspectable shadow opacity
    @IBInspectable public var shadowOpacity: Float = 1.0
    /// Inspectable shadow offset x
    @IBInspectable public var shadowOffsetX: CGFloat = 0.0
    /// Inspectable shadow offset y
    @IBInspectable public var shadowOffsetY: CGFloat = 0.0
    /// Inspectable shadow radius
    @IBInspectable public var shadowRadius: CGFloat = 0.0
    
    // MARK: - Draw functions -
    
    /**
     Draw rect function
     
     - parameter rect: The rect to be drawn
     */
    override public func draw(_ rect: CGRect) {
        if !shadow {
            self.layer.cornerRadius = cornerSize
            self.layer.masksToBounds = true
        }
        
        self.layer.borderColor = borderColor.withAlphaComponent(borderAlpha).cgColor
        self.layer.borderWidth = borderSize
        
        if shadow {
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowOffset = CGSize(width: shadowOffsetX, height:shadowOffsetY)
            self.layer.shadowRadius = shadowRadius
            self.layer.masksToBounds = false
        }
    }
    
    // MARK: - Init functions -
    
    /**
     Init function
     
     - parameter frame: The frame to be drawn
     
     - returns: Returns self
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /**
     Required init function
     
     - parameter aDecoder: NSCoder
     
     - returns: The initialized instance
     */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
