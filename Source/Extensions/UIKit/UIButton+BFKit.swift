//
//  UIButton+BFKit.swift
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

/// This extesion adds some useful functions to UIButton
public extension UIButton {
    // MARK: - Init functions -
    
    /**
     Create an UIButton in a frame with a title and a clear color
    
     - parameter frame: Button's frame
     - parameter title: Button's title, the title color will be white
    
     - returns: Returns the UIButton instance
     */
    @available(*, obsoleted=1.2.0, message="Use UIButton(_, title:, backgroundImage:, highlightedBackgroundImage:)")
    public convenience init(frame: CGRect, title: String) {
        self.init(frame: frame, title: title, backgroundImage: nil, highlightedBackgroundImage: nil)
    }
    
    /**
     Create an UIButton in a frame with a title and a background image
    
     - parameter frame:           Button's frame
     - parameter title:           Button's title
     - parameter backgroundImage: Button's background image
    
     - returns: Returns the UIButton instance
     */
    @available(*, obsoleted=1.2.0, message="Use UIButton(_, title:, backgroundImage:, highlightedBackgroundImage:)")
    public convenience init(frame: CGRect, title: String, backgroundImage: UIImage?) {
        self.init(frame: frame, title: title, backgroundImage: backgroundImage, highlightedBackgroundImage: nil)
    }
    
    /**
     Create an UIButton in a frame with a title, a background image and highlighted background image
    
     - parameter frame:                      Button's frame
     - parameter title:                      Button's title
     - parameter backgroundImage:            Button's background image
     - parameter highlightedBackgroundImage: Button's highlighted background image
    
     - returns: Returns the UIButton instance
     */
    public convenience init(frame: CGRect, title: String, backgroundImage: UIImage? = nil, highlightedBackgroundImage: UIImage? = nil) {
        self.init(frame: frame)
        self.frame = frame
        self.setTitle(title, forState: .Normal)
        self.setBackgroundImage(backgroundImage, forState: .Normal)
        self.setBackgroundImage(highlightedBackgroundImage, forState: .Highlighted)
    }
    
    /**
     Create an UIButton in a frame with a title and a color
    
     - parameter frame: Button's frame
     - parameter title: Button's title
     - parameter color: Button's color, the highlighted color will be automatically created
    
     - returns: Returns the UIButton instance
     */
    public convenience init(frame: CGRect, title: String, color: UIColor) {
        let components: UnsafePointer<CGFloat> = CGColorGetComponents(color.CGColor)
        self.init(frame: frame, title: title, backgroundImage: UIImage(color: color), highlightedBackgroundImage: UIImage(color: UIColor(red: components[0]-0.1, green: components[1]-0.1, blue: components[2]-0.1, alpha: 1)))
    }
    
    /**
     Create an UIButton in a frame with a title, a color and highlighted color
    
     - parameter frame:            Button's frame
     - parameter title:            Button's title
     - parameter color:            Button's color
     - parameter highlightedColor: Button's highlighted color
    
     - returns: Returns the UIButton instance
     */
    public convenience init(frame: CGRect, title: String, color: UIColor, highlightedColor: UIColor) {
        self.init(frame: frame, title: title, backgroundImage: UIImage(color: color), highlightedBackgroundImage: UIImage(color: highlightedColor))
    }
    
    /**
     Create an UIButton in a frame with an image
    
     - parameter frame: Button's frame
     - parameter image: Button's image
    
     - returns: Returns the UIButton instance
     */
    @available(*, obsoleted=1.2.0, message="Use UIButton(_, image:, highlightedImage:)")
    public convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame, image: image, highlightedImage: nil)
    }
    
    /**
     Create an UIButton in a frame with an image
    
     - parameter frame:            Button's frame
     - parameter image:            Button's image
     - parameter highlightedImage: Button's highlighted image
    
     - returns: eturns the UIButton instance
     */
    public convenience init(frame: CGRect, image: UIImage, highlightedImage: UIImage? = nil) {
        self.init(frame: frame)
        self.frame = frame
        self.setImage(image, forState: .Normal)
        self.setImage(highlightedImage, forState: .Highlighted)
    }
    
    // MARK: - Instance functions -
    
    /**
     Set the title font with a size
    
     - parameter fontName: Font name from the FontName enum declared in UIFont+BFKit
     - parameter size:     Font size
     */
    public func setTitleFont(fontName: FontName, size: CGFloat) {
        self.titleLabel!.font = UIFont(fontName: fontName, size: size)
    }
    
    /**
     Set the title color
    
     - parameter color: Font color, the highlighted color will be automatically created
     */
    public func setTitleColor(color: UIColor) {
        self.setTitleColor(color, highlightedColor: color.colorWithAlphaComponent(0.4))
    }
    
    /**
     Set the title color and highlighted color
    
     - parameter color:            Button's color
     - parameter highlightedColor: Button's highlighted color
     */
    public func setTitleColor(color: UIColor, highlightedColor: UIColor) {
        self.setTitleColor(color, forState: .Normal)
        self.setTitleColor(highlightedColor, forState: .Highlighted)
    }
}
