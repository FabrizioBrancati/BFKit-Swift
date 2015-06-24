//
//  UIButton+BFKit.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Fabrizio Brancati. All rights reserved.
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

extension UIButton
{
    // MARK: - Class functions -
    
    static func initWithFrame(frame: CGRect) -> UIButton
    {
        return self.initWithFrame(frame, title: nil)
    }
    
    static func initWithFrame(frame: CGRect, title: String?) -> UIButton
    {
        return self.initWithFrame(frame, title: title, backgroundImage: nil)
    }
    
    static func initWithFrame(frame: CGRect, title: String?, backgroundImage: UIImage?) -> UIButton
    {
        return self.initWithFrame(frame, title: title, backgroundImage: backgroundImage, highlightedBackgroundImage: nil)
    }
    
    static func initWithFrame(frame: CGRect, title: String?, backgroundImage: UIImage?, highlightedBackgroundImage: UIImage?) -> UIButton
    {
        var button: UIButton = buttonWithType(.Custom) as! UIButton
        button.frame = frame
        button.setTitle(title, forState: .Normal)
        button.setBackgroundImage(backgroundImage, forState: .Normal)
        button.setBackgroundImage(highlightedBackgroundImage, forState: .Highlighted)
        
        return button
    }
    
    static func initWithFrame(frame: CGRect, title: String, color: UIColor) -> UIButton
    {
        let components: UnsafePointer<CGFloat> = CGColorGetComponents(color.CGColor)
        return self.initWithFrame(frame, title: title, backgroundImage: UIImage.imageWithColor(color), highlightedBackgroundImage: UIImage.imageWithColor(UIColor(red: components[0]-0.1, green: components[1]-0.1, blue: components[2]-0.1, alpha: 1)))
    }
    
    static func initWithFrame(frame: CGRect, title: String, color: UIColor, highlightedColor: UIColor) -> UIButton
    {
        return self.initWithFrame(frame, title: title, backgroundImage: UIImage.imageWithColor(color), highlightedBackgroundImage: UIImage.imageWithColor(highlightedColor))
    }
    
    static func initWithFrame(frame: CGRect, image: UIImage) -> UIButton
    {
        return self.initWithFrame(frame, image: image, highlightedImage: nil)
    }
    
    static func initWithFrame(frame: CGRect, image: UIImage, highlightedImage: UIImage?) -> UIButton
    {
        var button: UIButton = buttonWithType(.Custom) as! UIButton
        button.frame = frame
        button.setImage(image, forState: .Normal)
        button.setImage(highlightedImage, forState: .Highlighted)
        
        return button
    }
    
    // MARK: - Instance functions -
    
    // TODO: Fix it
    /*
    func setTitleFont(fontName: FontName, size: Float)
    {
        self.titleLabel.font = UIFont.fontForFontName(fontName, size: size)
    }*/
    
    func setTitleColor(color: UIColor)
    {
        self.setTitleColor(color, highlightedColor: color.colorWithAlphaComponent(0.4))
    }
    
    func setTitleColor(color: UIColor, highlightedColor: UIColor)
    {
        self.setTitleColor(color, forState: .Normal)
        self.setTitleColor(highlightedColor, forState: .Highlighted)
    }
}
