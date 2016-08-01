//
//  UIView+BFKit.swift
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
import QuartzCore

/// This extesion adds some useful functions to UIView
public extension UIView {
    // MARK: - Enums -
    
    /**
     Direction of flip animation
    
     - FromTop:    Flip animation from top
     - FromLeft:   Flip animation from left
     - FromRight:  Flip animation from right
     - FromBottom: Flip animation from bottom
     */
    public enum UIViewAnimationFlipDirection : Int {
        case fromTop
        case fromLeft
        case fromRight
        case fromBottom
    }
    
    /**
     Direction of the translation
    
     - FromLeftToRight: Translation from left to right
     - FromRightToLeft: Translation from right to left
     */
    public enum UIViewAnimationTranslationDirection : Int {
        case fromLeftToRight
        case fromRightToLeft
    }
    
    /**
     Direction of the linear gradient
    
     - Vertical:                            Linear gradient vertical
     - Horizontal:                          Linear gradient horizontal
     - DiagonalFromLeftToRightAndTopToDown: Linear gradient from left to right and top to down
     - DiagonalFromLeftToRightAndDownToTop: Linear gradient from left to right and down to top
     - DiagonalFromRightToLeftAndTopToDown: Linear gradient from right to left and top to down
     - DiagonalFromRightToLeftAndDownToTop: Linear gradient from right to left and down to top
     */
    public enum UIViewLinearGradientDirection : Int {
        case vertical
        case horizontal
        case diagonalFromLeftToRightAndTopToDown
        case diagonalFromLeftToRightAndDownToTop
        case diagonalFromRightToLeftAndTopToDown
        case diagonalFromRightToLeftAndDownToTop
    }
    
    // MARK: - Instance functions -
    
    /**
     Create a border around the UIView
    
     - parameter color:  Border's color
     - parameter radius: Border's radius
     - parameter width:  Border's width
     */
    public func createBordersWithColor(_ color: UIColor, radius: CGFloat, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.shouldRasterize = false
        self.layer.rasterizationScale = 2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        
        let cgColor: CGColor = color.cgColor
        self.layer.borderColor = cgColor
    }
    
    /**
     Remove the borders around the UIView
     */
    public func removeBorders() {
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 0
        self.layer.borderColor = nil
    }
    
    /**
     Remove the shadow around the UIView
     */
    public func removeShadow() {
        self.layer.shadowColor = UIColor.clear.cgColor
        self.layer.shadowOpacity = 0.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
    
    /**
     Set the corner radius of UIView
    
     - parameter radius: Radius value
     */
    public func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    /**
     Set the corner radius of UIView only at the given corner
     
     - parameter corners: Corners to apply radius
     - parameter radius: Radius value
     */
    public func cornerRadius(corners: UIRectCorner, radius: CGFloat) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = rectShape
    }
    
    /**
     Create a shadow on the UIView
    
     - parameter offset:  Shadow's offset
     - parameter opacity: Shadow's opacity
     - parameter radius:  Shadow's radius
     */
    public func createRectShadowWithOffset(_ offset: CGSize, opacity: Float, radius: CGFloat) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
    
    /**
     Create a corner radius shadow on the UIView
    
     - parameter cornerRadius: Corner radius value
     - parameter offset:       Shadow's offset
     - parameter opacity:      Shadow's opacity
     - parameter radius:       Shadow's radius
     */
    public func createCornerRadiusShadowWithCornerRadius(_ cornerRadius: CGFloat, offset: CGSize, opacity: Float, radius: CGFloat) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shouldRasterize = true
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.masksToBounds = false
    }
    
    /**
     Create a linear gradient
    
     - parameter colors:    Array of UIColor instances
     - parameter direction: Direction of the gradient
     */
    public func createGradientWithColors(_ colors: Array<UIColor>, direction: UIViewLinearGradientDirection) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        
        let mutableColors: NSMutableArray = NSMutableArray(array: colors)
        for i in 0 ..< colors.count {
            let currentColor: UIColor = colors[i]
            mutableColors.replaceObject(at: i, with: currentColor.cgColor)
        }
        gradient.colors = mutableColors as AnyObject as! Array<UIColor>
        
        switch direction {
        case .vertical:
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .horizontal:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .diagonalFromLeftToRightAndTopToDown:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .diagonalFromLeftToRightAndDownToTop:
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        case .diagonalFromRightToLeftAndTopToDown:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .diagonalFromRightToLeftAndDownToTop:
            gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        }
        self.layer.insertSublayer(gradient, at:0)
    }
    
    /**
     Create a shake effect on the UIView
     */
    public func shakeView() {
        let shake: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        shake.values = [NSValue(caTransform3D: CATransform3DMakeTranslation(-5.0, 0.0, 0.0)), NSValue(caTransform3D: CATransform3DMakeTranslation(5.0, 0.0, 0.0))]
        shake.autoreverses = true
        shake.repeatCount = 2.0
        shake.duration = 0.07
        
        self.layer.add(shake, forKey:"shake")
    }
    
    /**
     Create a pulse effect on th UIView
    
     - parameter duration: Seconds of animation
     */
    public func pulseViewWithDuration(_ duration: CGFloat) {
        UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (finished) -> Void in
            if finished {
                UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                    self.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
                }) { (finished: Bool) -> Void in
                    if finished {
                        UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                            self.transform = CGAffineTransform(scaleX: 1.03, y: 1.03)
                        }) { (finished: Bool) -> Void in
                            if finished {
                                UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                                    self.transform = CGAffineTransform(scaleX: 0.985, y: 0.985)
                                }) { (finished: Bool) -> Void in
                                    if finished {
                                        UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                                            self.transform = CGAffineTransform(scaleX: 1.007, y: 1.007)
                                        }) { (finished: Bool) -> Void in
                                            if finished {
                                                UIView.animate(withDuration: TimeInterval(duration / 6), animations: { () -> Void in
                                                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
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
    
    /**
     Create a heartbeat effect on the UIView
    
     - parameter duration: Seconds of animation
     */
    public func heartbeatViewWithDuration(_ duration: CGFloat) {
        let maxSize: CGFloat = 1.4, durationPerBeat: CGFloat = 0.5
        
        let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        
        let scale1: CATransform3D = CATransform3DMakeScale(0.8, 0.8, 1)
        let scale2: CATransform3D = CATransform3DMakeScale(maxSize, maxSize, 1)
        let scale3: CATransform3D = CATransform3DMakeScale(maxSize - 0.3, maxSize - 0.3, 1)
        let scale4: CATransform3D = CATransform3DMakeScale(1.0, 1.0, 1)
        
        let frameValues: Array = [NSValue(caTransform3D: scale1), NSValue(caTransform3D: scale2), NSValue(caTransform3D: scale3), NSValue(caTransform3D: scale4)]
        
        animation.values = frameValues
        
        let frameTimes: Array = [NSNumber(value: 0.05), NSNumber(value: 0.2), NSNumber(value: 0.6), NSNumber(value: 1.0)]
        animation.keyTimes = frameTimes
        
        animation.fillMode = kCAFillModeForwards
        animation.duration = TimeInterval(durationPerBeat)
        animation.repeatCount = Float(duration / durationPerBeat)
        
        self.layer.add(animation, forKey: "heartbeat")
    }
    
    /**
     Adds a motion effect to the view
     */
    public func applyMotionEffects() {
        let horizontalEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalEffect.minimumRelativeValue = -10.0
        horizontalEffect.maximumRelativeValue = 10.0
        let verticalEffect: UIInterpolatingMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalEffect.minimumRelativeValue = -10.0
        verticalEffect.maximumRelativeValue = 10.0
        let motionEffectGroup: UIMotionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [horizontalEffect, verticalEffect]
        
        self.addMotionEffect(motionEffectGroup)
    }
    
    /**
     Flip the view
    
     - parameter duration:  Seconds of animation
     - parameter direction: Direction of the flip animation
     */
    public func flipWithDuration(_ duration: TimeInterval, direction: UIViewAnimationFlipDirection) {
        var subtype: String = ""
        
        switch(direction) {
        case .fromTop:
            subtype = "fromTop"
        case .fromLeft:
            subtype = "fromLeft"
        case .fromBottom:
            subtype = "fromBottom"
        case .fromRight:
            subtype = "fromRight"
        }
        
        let transition: CATransition = CATransition()
        
        transition.startProgress = 0
        transition.endProgress = 1.0
        transition.type = "flip"
        transition.subtype = subtype
        transition.duration = duration
        transition.repeatCount = 1
        transition.autoreverses = true
        
        self.layer.add(transition, forKey:"flip")
    }
    
    /**
     Translate the UIView around the topView
    
     - parameter topView:         Top view to translate to
     - parameter duration:        Duration of the translation
     - parameter direction:       Direction of the translation
     - parameter repeatAnimation: If the animation must be repeat or no
     - parameter startFromEdge:   If the animation must start from the edge
     */
    public func translateAroundTheView(_ topView: UIView, duration: CGFloat, direction: UIViewAnimationTranslationDirection, repeatAnimation: Bool = true, startFromEdge: Bool = true) {
        var startPosition: CGFloat = self.center.x, endPosition: CGFloat
        switch(direction) {
        case .fromLeftToRight:
            startPosition = self.frame.size.width / 2
            endPosition = -(self.frame.size.width / 2) + topView.frame.size.width
        case .fromRightToLeft:
            startPosition = -(self.frame.size.width / 2) + topView.frame.size.width
            endPosition = self.frame.size.width / 2
        }
        
        if startFromEdge {
            self.center = CGPoint(x: startPosition, y: self.center.y)
        }
        
        UIView.animate(withDuration: TimeInterval(duration / 2), delay: 1, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.center = CGPoint(x: endPosition, y: self.center.y)
        }) { (finished: Bool) -> Void in
            if finished {
                UIView.animate(withDuration: TimeInterval(duration / 2), delay: 1, options: UIViewAnimationOptions(), animations: { () -> Void in
                    self.center = CGPoint(x: startPosition, y: self.center.y)
                }) { (finished: Bool) -> Void in
                    if finished {
                        if repeatAnimation {
                            self.translateAroundTheView(topView, duration: duration, direction: direction, repeatAnimation: repeatAnimation, startFromEdge: startFromEdge)
                        }
                    }
                }
            }
        }
    }
    
    /**
     Take a screenshot of the current view
    
     - returns: Returns screenshot as UIImage
     */
    public func screenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let imageData: Data = UIImagePNGRepresentation(image)!
        image = UIImage(data: imageData)!
        
        return image
    }
    
    /**
     Take a screenshot of the current view an saving to the saved photos album
    
     - returns: Returns screenshot as UIImage
     */
    public func saveScreenshot() -> UIImage {
        let image: UIImage = self.screenshot()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        return image
    }
    
    /**
     Removes all subviews from current view
     */
    public func removeAllSubviews() {
        self.subviews.forEach { (subview) -> () in
            subview.removeFromSuperview()
        }
    }
    
    // MARK: - Init functions -
    
    /**
     Create an UIView with the given frame and background color
    
     - parameter frame:           UIView's frame
     - parameter backgroundColor: UIView's background color
    
     - returns: Returns the created UIView
     */
    public convenience init(frame: CGRect, backgroundColor: UIColor) {
        self.init(frame: frame)
        self.backgroundColor = backgroundColor
    }
}
