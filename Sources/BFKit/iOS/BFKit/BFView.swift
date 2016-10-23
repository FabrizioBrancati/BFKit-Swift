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

// MARK: - BFView - UIView subclass

/// This class adds some useful functions to UIView that cannot be in an extension.
@IBDesignable public class BFView: UIView {
    // MARK: - Variables
    
    /// Inspectable corners size.
    @IBInspectable public var cornerSize: CGFloat = 0
    /// Inspectable border size.
    @IBInspectable public var borderSize: CGFloat = 0
    /// Inspectable border color.
    @IBInspectable public var borderColor: UIColor = UIColor.black
    /// Inspectable border alpha.
    @IBInspectable public var borderAlpha: CGFloat = 1.0
    /// Inspectable shadow, only shadow or only corner size.
    @IBInspectable public var hasShadow: Bool = false
    /// Inspectable shadow color.
    @IBInspectable public var shadowColor: UIColor = UIColor.black
    /// Inspectable shadow opacity.
    @IBInspectable public var shadowOpacity: Float = 1.0
    /// Inspectable shadow offset x.
    @IBInspectable public var shadowOffsetX: CGFloat = 0.0
    /// Inspectable shadow offset y.
    @IBInspectable public var shadowOffsetY: CGFloat = 0.0
    /// Inspectable shadow radius.
    @IBInspectable public var shadowRadius: CGFloat = 0.0
    
    // MARK: - Functions
    
    /// Draw rect function.
    ///
    /// - parameter rect: The rect to be drawn.
    override public func draw(_ rect: CGRect) {
        if !hasShadow {
            self.layer.cornerRadius = cornerSize
            self.layer.masksToBounds = true
        }
        
        self.layer.borderColor = borderColor.withAlphaComponent(borderAlpha).cgColor
        self.layer.borderWidth = borderSize
        
        if hasShadow {
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowOffset = CGSize(width: shadowOffsetX, height:shadowOffsetY)
            self.layer.shadowRadius = shadowRadius
            self.layer.masksToBounds = false
        }
    }
    
    /// Init function.
    ///
    /// - parameter frame: The frame to be drawn.
    ///
    /// - returns: Returns the created view.
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// Required init function.
    ///
    /// - parameter aDecoder: NSCoder.
    ///
    /// - returns: The initialized instance.
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.cornerSize = CGFloat(aDecoder.decodeFloat(forKey: "CornerSize"))
        self.borderSize = CGFloat(aDecoder.decodeFloat(forKey: "BorderSize"))
        self.borderColor = aDecoder.decodeObject(forKey: "BorderColor") as! UIColor
        self.borderAlpha = CGFloat(aDecoder.decodeFloat(forKey: "BorderAlpha"))
        self.hasShadow = aDecoder.decodeBool(forKey: "HasShadow")
        self.shadowColor = aDecoder.decodeObject(forKey: "ShadowColor") as! UIColor
        self.shadowOpacity = aDecoder.decodeFloat(forKey: "ShadowOpacity")
        self.shadowOffsetX = CGFloat(aDecoder.decodeFloat(forKey: "ShadowOffsetX"))
        self.shadowOffsetY = CGFloat(aDecoder.decodeFloat(forKey: "ShadowOffsetY"))
        self.shadowRadius = CGFloat(aDecoder.decodeFloat(forKey: "ShadowRadius"))
    }
    
    /// Encodes added variables.
    ///
    /// - parameter aCoder: NSCoder.
    open override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        
        aCoder.encode(self.cornerSize, forKey: "CornerSize")
        aCoder.encode(self.borderSize, forKey: "BorderSize")
        aCoder.encode(self.borderColor, forKey: "BorderColor")
        aCoder.encode(self.borderAlpha, forKey: "BorderAlpha")
        aCoder.encode(self.hasShadow, forKey: "HasShadow")
        aCoder.encode(self.shadowColor, forKey: "ShadowColor")
        aCoder.encode(self.shadowOpacity, forKey: "ShadowOpacity")
        aCoder.encode(self.shadowOffsetX, forKey: "ShadowOffsetX")
        aCoder.encode(self.shadowOffsetY, forKey: "ShadowOffsetY")
        aCoder.encode(self.shadowRadius, forKey: "ShadowRadius")
    }
}
