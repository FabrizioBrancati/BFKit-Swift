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
    
    func blendMode(blendMode: CGBlendMode) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), false, UIScreen.mainScreen().scale)
        self.drawInRect(CGRectMake(0.0, 0.0, self.size.width, self.size.height), blendMode: blendMode, alpha: 1)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func blendOverlay() -> UIImage
    {
        return self.blendMode(kCGBlendModeOverlay)
    }
    
    func imageAtRect(rect: CGRect) -> UIImage
    {
        let imageRef: CGImageRef = CGImageCreateWithImageInRect(self.CGImage, rect)
        let subImage: UIImage = UIImage(CGImage: imageRef)!
        
        return subImage
    }
    
    func imageByScalingProportionallyToMinimumSize(targetSize: CGSize) -> UIImage?
    {
        var sourceImage: UIImage = self
        var newImage: UIImage? = nil
        var newTargetSize: CGSize
        
        let imageSize: CGSize = sourceImage.size
        let width: CGFloat = imageSize.width
        let height: CGFloat = imageSize.height
        
        if UIDevice.isRetinaHD()
        {
            let retinaTargetSize: CGSize = CGSizeMake(targetSize.width * 3, targetSize.height * 3)
            if !CGSizeEqualToSize(imageSize, retinaTargetSize)
            {
                newTargetSize = retinaTargetSize
            }
        }
        else if UIDevice.isRetina()
        {
            let retinaTargetSize: CGSize = CGSizeMake(targetSize.width * 2, targetSize.height * 2)
            if !CGSizeEqualToSize(imageSize, retinaTargetSize)
            {
                newTargetSize = retinaTargetSize
            }
        }
        
        let targetWidth: CGFloat = targetSize.width
        let targetHeight: CGFloat = targetSize.height
        
        var scaleFactor: CGFloat = 0.0
        var scaledWidth: CGFloat = targetWidth
        var scaledHeight: CGFloat = targetHeight
        
        var thumbnailPoint: CGPoint = CGPointMake(0.0,0.0)
        
        if CGSizeEqualToSize(imageSize, targetSize) == false
        {
            let widthFactor: CGFloat = targetWidth / width
            let heightFactor: CGFloat = targetHeight / height
            
            if widthFactor > heightFactor
            {
                scaleFactor = widthFactor
            }
            else
            {
                scaleFactor = heightFactor
            }
            
            scaledWidth = width * scaleFactor;
            scaledHeight = height * scaleFactor;
            
            if widthFactor > heightFactor
            {
                thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5
            }
            else if widthFactor < heightFactor
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, UIScreen.mainScreen().scale)
        var thumbnailRect: CGRect = CGRectZero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width  = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.drawInRect(thumbnailRect)
        
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if newImage == nil
        {
            BFLog("Could not scale image")
        }
        
        return newImage
    }
    
    
    
    // MARK: - Class functions -
    
    // MARK: First attempt to use UIImage(named: name) to create dummy images (Failed)
    /*private static func sizeForSizeString(sizeString: String) -> CGSize
    {
        let array: Array = sizeString.componentsSeparatedByString("x")
        if array.count != 2
        {
            return CGSizeZero;
        }
        
        return CGSizeMake(CGFloat(array[0].floatValue), CGFloat(array[1].floatValue))
    }
    
    private static func colorForColorString(colorString: String?) -> UIColor
    {
        if colorString == nil
        {
            return UIColor.lightGrayColor()
        }
        
        let colorSelector = Selector(colorString!.stringByAppendingString("Color"))
        if UIColor.respondsToSelector(colorSelector)
        {
            return UIColor.forwardingTargetForSelector(colorSelector) as! UIColor
        }
        else
        {
            return UIColor(hex: colorString!)
        }
    }
    
    private static var predicate: dispatch_once_t = 0
    
    public override class func initialize()
    {
        dispatch_once(&predicate) {
            let originalSelector = Selector("named:")
            let swizzledSelector = Selector("dummyImageNamed:")
            
            let originalMethod = class_getClassMethod(self, originalSelector)
            let swizzledMethod = class_getClassMethod(self, swizzledSelector)
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    static func dummyImageNamed(name: String) -> UIImage?
    {
        var result: UIImage
        
        let array: Array = name.componentsSeparatedByString(".")
        if array[0].lowercaseString == "dummy"
        {
            let sizeString: String? = array[1]
            if sizeString == nil
            {
                return nil
            }
            
            var colorString: String? = nil
            if array.count >= 3
            {
                colorString = array[2]
            }
            
            return self.dummyImageWithSize(sizeForSizeString(sizeString!), color:colorForColorString(colorString))
        }
        else
        {
            result = self.dummyImageNamed(name)!
        }
        
        return result
    }
    
    static func dummyImageWithSize(size: CGSize, color: UIColor) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        let context: CGContextRef = UIGraphicsGetCurrentContext()
        
        let rect: CGRect = CGRectMake(0.0, 0.0, size.width, size.height)
        
        color.setFill()
        CGContextFillRect(context, rect)
        
        let sizeString: String = "\(Int(size.width)) x \(Int(size.height))"
        let style: NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle() as! NSMutableParagraphStyle
        style.alignment = .Center
        style.minimumLineHeight = size.height / 2
        let attributes: Dictionary = [NSParagraphStyleAttributeName : style]
        sizeString.drawInRect(rect, withAttributes:attributes)
        
        let result: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
    }*/
    
    private static func sizeForSizeString(sizeString: String) -> CGSize
    {
        let array: Array = sizeString.componentsSeparatedByString("x")
        if array.count != 2
        {
            return CGSizeZero;
        }
        
        return CGSizeMake(CGFloat(array[0].floatValue), CGFloat(array[1].floatValue))
    }
    
    private static func colorForColorString(colorString: String?) -> UIColor
    {
        if colorString == nil
        {
            return UIColor.lightGrayColor()
        }
        
        let colorSelector = Selector(colorString!.stringByAppendingString("Color"))
        if UIColor.respondsToSelector(colorSelector)
        {
            // MARK: Perform selector of the right color
            return UIColor(hex: colorString!)
        }
        else
        {
            return UIColor(hex: colorString!)
        }
    }
    
    // MARK: - Init functions -
    
    convenience init?(dummyImageWithSizeAndColor dummy: String)
    {
        var size: CGSize = CGSizeZero, color: UIColor = UIColor.lightGrayColor()
        
        let array: Array = dummy.componentsSeparatedByString(".")
        if array.count > 0
        {
            let sizeString: String = array[0]
            
            var colorString: String
            if array.count >= 2
            {
                color = UIImage.colorForColorString(array[1])
            }
            
            size = UIImage.sizeForSizeString(sizeString)
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        let context: CGContextRef = UIGraphicsGetCurrentContext()
        
        let rect: CGRect = CGRectMake(0.0, 0.0, size.width, size.height)
        
        color.setFill()
        CGContextFillRect(context, rect)
        
        let sizeString: String = "\(Int(size.width)) x \(Int(size.height))"
        let style: NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        style.alignment = .Center
        style.minimumLineHeight = size.height / 2
        let attributes: Dictionary = [NSParagraphStyleAttributeName : style]
        sizeString.drawInRect(rect, withAttributes:attributes)
        
        let result: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.init(CGImage: result.CGImage)
    }
    
    convenience init?(maskedText: String, imageSize: CGSize, backgroundColor: UIColor, font: FontName, fontSize: CGFloat)
    {
        let fontName: UIFont = UIFont(fontName: font, size: fontSize)!
        let textAttributes = [NSFontAttributeName : fontName]
        
        let textSize: CGSize = maskedText.sizeWithAttributes(textAttributes)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.mainScreen().scale)
        let ctx: CGContextRef = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(ctx, backgroundColor.CGColor)
        
        let path: UIBezierPath = UIBezierPath(rect: CGRectMake(0, 0, imageSize.width, imageSize.height))
        CGContextAddPath(ctx, path.CGPath)
        CGContextFillPath(ctx)
        
        CGContextSetBlendMode(ctx, kCGBlendModeDestinationOut)
        let center: CGPoint = CGPointMake(imageSize.width / 2 - textSize.width / 2, imageSize.height / 2 - textSize.height / 2)
        maskedText.drawAtPoint(center, withAttributes: textAttributes)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.init(CGImage: image.CGImage)
    }
    
    convenience init?(color: UIColor)
    {
        let rect: CGRect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        
        CGContextFillRect(context, rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.init(CGImage: image.CGImage)
    }
}
