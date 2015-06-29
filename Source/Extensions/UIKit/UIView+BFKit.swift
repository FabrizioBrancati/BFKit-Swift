//
//  UIView+BFKit.swift
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
import QuartzCore

extension UIView
{
    // MARK: - Enums -
    
    enum UIViewAnimationFlipDirection : Int
    {
        case FromTop
        case FromLeft
        case FromRight
        case FromBottom
    }
    
    enum UIViewAnimationTranslationDirection : Int
    {
        case FromLeftToRight
        case FromRightToLeft
    }
    
    enum UIViewLinearGradientDirection : Int
    {
        case Vertical
        case Horizontal
        case DiagonalFromLeftToRightAndTopToDown
        case DiagonalFromLeftToRightAndDownToTop
        case DiagonalFromRightToLeftAndTopToDown
        case DiagonalFromRightToLeftAndDownToTop
    }
    
    // MARK: - Instance functions -
    
    func createBordersWithColor(color: UIColor, radius: CGFloat, width: CGFloat)
    {
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.shouldRasterize = false
        self.layer.rasterizationScale = 2
        self.layer.edgeAntialiasingMask = .LayerLeftEdge | .LayerRightEdge | .LayerBottomEdge | .LayerTopEdge
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        
        let space: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()
        let cgColor: CGColorRef = color.CGColor
        self.layer.borderColor = cgColor
    }
    
    func removeBorders()
    {
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 0
        self.layer.borderColor = nil
    }
    
    func removeShadow()
    {
        self.layer.shadowColor = UIColor.clearColor().CGColor
        self.layer.shadowOpacity = 0.0
        self.layer.shadowOffset = CGSizeMake(0.0, 0.0)
    }
    
    func setCornerRadius(radius: CGFloat)
    {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func createRectShadowWithOffset(offset: CGSize, opacity: Float, radius: CGFloat)
    {
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
    
    func createCornerRadiusShadowWithCornerRadius(cornerRadius: CGFloat, offset: CGSize, opacity: Float, radius: CGFloat)
    {
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shouldRasterize = true
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).CGPath
        self.layer.masksToBounds = false
    }
    
    func createGradientWithColors(colors: Array<UIColor>, direction: UIViewLinearGradientDirection)
    {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        
        var mutableColors: NSMutableArray = NSMutableArray(array: colors)
        for var i = 0; i < colors.count; i++
        {
            let currentColor: UIColor = colors[i]
            mutableColors.replaceObjectAtIndex(i, withObject: currentColor.CGColor)
        }
        gradient.colors = mutableColors as AnyObject as! Array<UIColor>
        
        switch direction
        {
        case .Vertical:
            gradient.startPoint = CGPointMake(0.5, 0.0)
            gradient.endPoint = CGPointMake(0.5, 1.0)
        case .Horizontal:
            gradient.startPoint = CGPointMake(0.0, 0.5)
            gradient.endPoint = CGPointMake(1.0, 0.5)
        case .DiagonalFromLeftToRightAndTopToDown:
            gradient.startPoint = CGPointMake(0.0, 0.0)
            gradient.endPoint = CGPointMake(1.0, 1.0)
        case .DiagonalFromLeftToRightAndDownToTop:
            gradient.startPoint = CGPointMake(0.0, 1.0)
            gradient.endPoint = CGPointMake(1.0, 0.0)
        case .DiagonalFromRightToLeftAndTopToDown:
            gradient.startPoint = CGPointMake(1.0, 0.0)
            gradient.endPoint = CGPointMake(0.0, 1.0)
        case .DiagonalFromRightToLeftAndDownToTop:
            gradient.startPoint = CGPointMake(1.0, 1.0)
            gradient.endPoint = CGPointMake(0.0, 0.0)
        default:
            break
        }
        self.layer.insertSublayer(gradient, atIndex:0)
    }
    
    func shakeView()
    {
        let shake: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        shake.values = [NSValue(CATransform3D: CATransform3DMakeTranslation(-5.0, 0.0, 0.0)), NSValue(CATransform3D: CATransform3DMakeTranslation(5.0, 0.0, 0.0))]
        shake.autoreverses = true
        shake.repeatCount = 2.0
        shake.duration = 0.07
        
        self.layer.addAnimation(shake, forKey:"shake")
    }
    
    func pulseViewWithDuration(duration: CGFloat)
    {
        UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(1.1, 1.1)
        }) { (finished) -> Void in
            if finished
            {
                UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                    self.transform = CGAffineTransformMakeScale(0.96, 0.96)
                }) { (finished: Bool) -> Void in
                    if finished
                    {
                        UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                            self.transform = CGAffineTransformMakeScale(1.03, 1.03)
                        }) { (finished: Bool) -> Void in
                            if finished
                            {
                                UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                                    self.transform = CGAffineTransformMakeScale(0.985, 0.985)
                                }) { (finished: Bool) -> Void in
                                    if finished
                                    {
                                        UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                                            self.transform = CGAffineTransformMakeScale(1.007, 1.007)
                                        }) { (finished: Bool) -> Void in
                                            if finished
                                            {
                                                UIView.animateWithDuration(NSTimeInterval(duration / 6), animations: { () -> Void in
                                                    self.transform = CGAffineTransformMakeScale(1, 1)
                                                })
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func heartbeatViewWithDuration(duration: CGFloat)
    {
        let maxSize: CGFloat = 1.4, durationPerBeat: CGFloat = 0.5
        
        let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        
        let scale1: CATransform3D = CATransform3DMakeScale(0.8, 0.8, 1)
        let scale2: CATransform3D = CATransform3DMakeScale(maxSize, maxSize, 1)
        let scale3: CATransform3D = CATransform3DMakeScale(maxSize - 0.3, maxSize - 0.3, 1)
        let scale4: CATransform3D = CATransform3DMakeScale(1.0, 1.0, 1)
        
        let frameValues: Array = [NSValue(CATransform3D: scale1), NSValue(CATransform3D: scale2), NSValue(CATransform3D: scale3), NSValue(CATransform3D: scale4)]
        
        animation.values = frameValues
        
        let frameTimes: Array = [NSNumber(float: 0.05), NSNumber(float: 0.2), NSNumber(float: 0.6), NSNumber(float: 1.0)]
        animation.keyTimes = frameTimes
        
        animation.fillMode = kCAFillModeForwards
        animation.duration = NSTimeInterval(durationPerBeat)
        animation.repeatCount = Float(duration / durationPerBeat)
        
        self.layer.addAnimation(animation, forKey: "heartbeat")
    }
    
    func applyMotionEffects()
    {
        let horizontalEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        horizontalEffect.minimumRelativeValue = -10.0
        horizontalEffect.maximumRelativeValue = 10.0
        let verticalEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        verticalEffect.minimumRelativeValue = -10.0
        verticalEffect.maximumRelativeValue = 10.0
        let motionEffectGroup: UIMotionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [horizontalEffect, verticalEffect]
        
        self.addMotionEffect(motionEffectGroup)
    }
    
    func flipWithDuration(duration: NSTimeInterval, direction: UIViewAnimationFlipDirection)
    {
        var subtype: String = ""
        
        switch(direction)
        {
        case .FromTop:
            subtype = "fromTop"
        case .FromLeft:
            subtype = "fromLeft"
        case .FromBottom:
            subtype = "fromBottom"
        case .FromRight:
            subtype = "fromRight"
        default:
            break
        }
        
        let transition: CATransition = CATransition()
        
        transition.startProgress = 0
        transition.endProgress = 1.0
        transition.type = "flip"
        transition.subtype = subtype
        transition.duration = duration
        transition.repeatCount = 1
        transition.autoreverses = true
        
        self.layer.addAnimation(transition, forKey:"flip")
    }
    
    func translateAroundTheView(topView: UIView, duration: CGFloat, direction: UIViewAnimationTranslationDirection, repeat: Bool, startFromEdge: Bool)
    {
        var startPosition: CGFloat = self.center.x, endPosition: CGFloat
        switch(direction)
        {
        case .FromLeftToRight:
            startPosition = self.frame.size.width / 2
            endPosition = -(self.frame.size.width / 2) + topView.frame.size.width
        case .FromRightToLeft:
            startPosition = -(self.frame.size.width / 2) + topView.frame.size.width
            endPosition = self.frame.size.width / 2
        default:
            break
        }
        
        if startFromEdge
        {
            self.center = CGPointMake(startPosition, self.center.y)
        }
        
        UIView.animateWithDuration(NSTimeInterval(duration / 2), delay: 1, options: .CurveEaseInOut, animations: { () -> Void in
            self.center = CGPointMake(endPosition, self.center.y)
        }) { (finished: Bool) -> Void in
            if finished
            {
                UIView.animateWithDuration(NSTimeInterval(duration / 2), delay: 1, options: .CurveEaseInOut, animations: { () -> Void in
                    self.center = CGPointMake(startPosition, self.center.y)
                }) { (finished: Bool) -> Void in
                    if finished
                    {
                        if repeat
                        {
                            self.translateAroundTheView(topView, duration: duration, direction: direction, repeat: repeat, startFromEdge: startFromEdge)
                        }
                    }
                }
            }
        }
    }
    
    func screenshot() -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.mainScreen().scale)
        
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageData: NSData = UIImagePNGRepresentation(image)
        image = UIImage(data: imageData)!
        
        return image
    }
    
    func saveScreenshot() -> UIImage
    {
        let image: UIImage = self.screenshot()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        return image
    }
    
    // MARK: - Init functions -
    
    convenience init(frame: CGRect, backgroundColor: UIColor)
    {
        self.init(frame: frame)
        self.backgroundColor = backgroundColor
    }
}
