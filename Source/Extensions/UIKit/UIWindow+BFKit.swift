//
//  UIWindow+BFKit.swift
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

/// This extesion adds some useful functions to UIWindow
public extension UIWindow
{
    // MARK: - Instance functions -
    
    /**
    Take a screenshot of current window, without saving it
    
    :returns: Returns the screenshot as an UIImage
    */
    @availability(*, deprecated=1.2.0, message="Use takeScreenshot(_ )")
    public func takeScreenshot() -> UIImage
    {
        return takeScreenshot(save: false)
    }
    
    /**
    Take a screenshot of current window and choose if save it or not
    
    :param: save true to save, false to don't save
    
    :returns: Returns the screenshot as an UIImage
    */
    public func takeScreenshot(save: Bool = false) -> UIImage
    {
        let ignoreOrientation: Bool = SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("8.0")
        
        let orientation: UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        
        var imageSize: CGSize = CGSizeZero
        if UIInterfaceOrientationIsPortrait(orientation) || ignoreOrientation
        {
            imageSize = UIScreen.mainScreen().bounds.size
        }
        else
        {
            imageSize = CGSizeMake(UIScreen.mainScreen().bounds.size.height, UIScreen.mainScreen().bounds.size.width)
        }
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.mainScreen().scale)
        let context: CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, self.center.x, self.center.y)
        CGContextConcatCTM(context, self.transform)
        CGContextTranslateCTM(context, -self.bounds.size.width * self.layer.anchorPoint.x, -self.bounds.size.height * self.layer.anchorPoint.y)
        
        if !ignoreOrientation
        {
            if orientation == .LandscapeLeft
            {
                CGContextRotateCTM(context, CGFloat(M_PI_2))
                CGContextTranslateCTM(context, 0, -imageSize.width)
            }
            else if(orientation == .LandscapeRight)
            {
                CGContextRotateCTM(context, CGFloat(-M_PI_2))
                CGContextTranslateCTM(context, -imageSize.height, 0)
            }
            else if(orientation == .PortraitUpsideDown)
            {
                CGContextRotateCTM(context, CGFloat(M_PI))
                CGContextTranslateCTM(context, -imageSize.width, -imageSize.height)
            }
        }
        
        if self.respondsToSelector("drawViewHierarchyInRect:afterScreenUpdates:")
        {
            self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: false)
        }
        else
        {
            self.layer.renderInContext(UIGraphicsGetCurrentContext())
        }
        
        CGContextRestoreGState(context)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if save
        {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        
        return image
    }
    
    /**
    Take a screenshot of current window, choose if save it or not after a delay
    
    :param: delay      The delay, in seconds
    :param: save       true to save, false to don't save
    :param: completion Completion handler with the UIImage
    */
    public func takeScreenshotWithDelay(delay: Double, save: Bool, completion: (image: UIImage) -> ())
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            completion(image: self.takeScreenshot(save: save))
        })
    }
}
