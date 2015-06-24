//
//  UIImage+BFKit.swift
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

extension UIImage
{
    // MARK: - Instance functions -
    
    // MARK: - Class functions -
    
    static func imageWithTextMask(#imageSize: CGSize, backgroundColor: UIColor, maskedText: String, font: UIFont, fontSize: CGFloat) -> UIImage
    {
        // TODO: Use fonts enum
        //let fontName = UIFont.fontForFontName(font, size: fontSize)
        let textAttributes = [NSFontAttributeName: font]
        
        let textSize: CGSize = maskedText.sizeWithAttributes(textAttributes)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.mainScreen().scale)
        let ctx: CGContextRef = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(ctx, backgroundColor.CGColor)
        
        let path: UIBezierPath = UIBezierPath(rect: CGRectMake(0, 0, imageSize.width, imageSize.height))
        CGContextAddPath(ctx, path.CGPath);
        CGContextFillPath(ctx);
        
        CGContextSetBlendMode(ctx, kCGBlendModeDestinationOut);
        let center: CGPoint = CGPointMake(imageSize.width / 2 - textSize.width / 2, imageSize.height / 2 - textSize.height / 2);
        maskedText.drawAtPoint(center, withAttributes: textAttributes)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return image
    }
    
    static func imageWithColor(color: UIColor) -> UIImage
    {
        let rect: CGRect = CGRectMake(0, 0, 1, 1);
        UIGraphicsBeginImageContext(rect.size);
        let context: CGContextRef = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        
        CGContextFillRect(context, rect);
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
}
