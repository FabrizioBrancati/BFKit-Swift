//
//  UIViewExtension.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2017 Fabrizio Brancati. All rights reserved.
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
import CoreGraphics

// MARK: - UIView extension

/// This extesion adds some useful functions to UIView.
public extension UIView {
    // MARK: - Variables
    
    /// Direction of flip animation.
    ///
    /// - top: Flip animation from top.
    /// - left: Flip animation from left.
    /// - right: Flip animation from right.
    /// - bottom: Flip animation from bottom.
    public enum UIViewAnimationFlipDirection: String {
        case top = "fromTop"
        case left = "fromLeft"
        case right = "fromRight"
        case bottom = "fromBottom"
    }
    
    /// Direction of the translation.
    ///
    /// - leftToRight: Translation from left to right.
    /// - rightToLeft: Translation from right to left.
    public enum UIViewAnimationTranslationDirection: Int {
        case leftToRight
        case rightToLeft
    }
    
    /// Direction of the linear gradient.
    ///
    /// - vertical: Linear gradient vertical.
    /// - horizontal: Linear gradient horizontal.
    /// - diagonalLeftToRightAndTopToDown: Linear gradient from left top to right down.
    /// - diagonalLeftToRightAndDownToTop: Linear gradient from left down to right top.
    /// - diagonalRightToLeftAndTopToDown: Linear gradient from right top to left down.
    /// - diagonalRightToLeftAndDownToTop: Linear gradient from right down to left top.
    public enum UIViewGradientDirection {
        case vertical
        case horizontal
        case diagonalLeftTopToRightDown
        case diagonalLeftDownToRightTop
        case diagonalRightTopToLeftDown
        case diagonalRightDownToLeftTop
        case custom(startPoint: CGPoint, endPoint: CGPoint)
    }
    
    /// Type of gradient.
    ///
    /// - linear: Linear gradient.
    /// - radial: Radial gradient.
    public enum UIViewGradientType {
        case linear
        case radial
    }
    
    // MARK: - Functions
    
    /// Create an UIView with the given frame and background color.
    ///
    /// - Parameters:
    ///   - frame: UIView frame.
    ///   - backgroundColor: UIView background color.
    public convenience init(frame: CGRect, backgroundColor: UIColor) {
        self.init(frame: frame)
        self.backgroundColor = backgroundColor
    }
    
    /// Creates a border around the UIView.
    ///
    /// - Parameters:
    ///   - color: Border color.
    ///   - radius: Border radius.
    ///   - width: Border width.
    public func border(color: UIColor, radius: CGFloat, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.shouldRasterize = false
        self.layer.rasterizationScale = 2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        
        let cgColor: CGColor = color.cgColor
        self.layer.borderColor = cgColor
    }
    
    /// Removes border around the UIView.
    public func removeBorder(maskToBounds: Bool = true) {
        self.layer.borderWidth = 0
        self.layer.cornerRadius = 0
        self.layer.borderColor = nil
        self.layer.masksToBounds = maskToBounds
    }
    
    /// Set the corner radius of UIView only at the given corner.
    ///
    /// - Parameters:
    ///   - corners: Corners to apply radius.
    ///   - radius: Radius value.
    public func cornerRadius(corners: UIRectCorner, radius: CGFloat) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = rectShape
    }
    
    /// Create a shadow on the UIView.
    ///
    /// - Parameters:
    ///   - offset: Shadow offset.
    ///   - opacity: Shadow opacity.
    ///   - radius: Shadow radius.
    ///   - color: Shadow color. Default is black.
    public func shadow(offset: CGSize, opacity: Float, radius: CGFloat, cornerRadius: CGFloat = 0, color: UIColor = UIColor.black) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        if cornerRadius != 0 {
            self.layer.cornerRadius = cornerRadius
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        }
        self.layer.masksToBounds = false
    }
    
    /// Removes shadow around the UIView.
    public func removeShadow(maskToBounds: Bool = true) {
        self.layer.shadowColor = nil
        self.layer.shadowOpacity = 0.0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 0
        self.layer.cornerRadius = 0
        self.layer.shadowPath = nil
        self.layer.masksToBounds = maskToBounds
    }
    
    /// Create a linear gradient.
    ///
    /// - Parameters:
    ///   - colors: Array of UIColor instances.
    ///   - direction: Direction of the gradient.
    /// - Returns: Returns the created CAGradientLayer.
    @discardableResult
    public func gradient(colors: [UIColor], direction: UIViewGradientDirection) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        
        var mutableColors: [Any] = colors
        for i in 0 ..< colors.count {
            let currentColor: UIColor = colors[i]
            mutableColors[i] = currentColor.cgColor
        }
        gradient.colors = mutableColors
        
        switch direction {
        case .vertical:
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .horizontal:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .diagonalLeftTopToRightDown:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .diagonalLeftDownToRightTop:
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        case .diagonalRightTopToLeftDown:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .diagonalRightDownToLeftTop:
            gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        case .custom(let startPoint, let endPoint):
            gradient.startPoint = startPoint
            gradient.endPoint = endPoint
        }
        self.layer.insertSublayer(gradient, at:0)
        
        return gradient
    }
    
    /// Create a smooth linear gradient, requires more computational time than 
    ///
    ///     gradient(colors:,direction:)
    ///
    /// - Parameters:
    ///   - colors: Array of UIColor instances.
    ///   - direction: Direction of the gradient.
    public func smoothGradient(colors: [UIColor], direction: UIViewGradientDirection, type: UIViewGradientType = .linear) {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIImage.screenScale())
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        var locations: [CGFloat] = [0.0, 1.0]
        var components: [CGFloat] = []
        
        for (index, color) in colors.enumerated() {
            if index != 0 && index != 1 {
                locations.insert(CGFloat(Float(1) / Float(colors.count - 1)), at: 1)
            }
            
            components.append(color.redComponent)
            components.append(color.greenComponent)
            components.append(color.blueComponent)
            components.append(color.alpha)
        }
        
        var startPoint: CGPoint
        var endPoint: CGPoint
        
        switch direction {
        case .vertical:
            startPoint = CGPoint(x: self.bounds.midX, y: 0.0)
            endPoint = CGPoint(x: self.bounds.midX, y: self.bounds.height)
        case .horizontal:
            startPoint = CGPoint(x: 0.0, y: self.bounds.midY)
            endPoint = CGPoint(x: self.bounds.width, y: self.bounds.midY)
        case .diagonalLeftTopToRightDown:
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: self.bounds.width, y: self.bounds.height)
        case .diagonalLeftDownToRightTop:
            startPoint = CGPoint(x: 0.0, y: self.bounds.height)
            endPoint = CGPoint(x: self.bounds.width, y: 0.0)
        case .diagonalRightTopToLeftDown:
            startPoint = CGPoint(x: self.bounds.width, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: self.bounds.height)
        case .diagonalRightDownToLeftTop:
            startPoint = CGPoint(x: self.bounds.width, y: self.bounds.height)
            endPoint = CGPoint(x: 0.0, y: 0.0)
        case .custom(let customStartPoint, let customEndPoint):
            startPoint = customStartPoint
            endPoint = customEndPoint
        }
        
        guard let gradient: CGGradient = CGGradient(colorSpace: colorSpace, colorComponents: components, locations: locations, count: locations.count) else {
            return
        }
        
        switch type {
        case .linear:
            context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: .drawsBeforeStartLocation)
        case .radial:
            context.drawRadialGradient(gradient, startCenter: startPoint, startRadius: 0.0, endCenter: endPoint, endRadius: 1.0, options: .drawsBeforeStartLocation)
        }
        
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return
        }
        
        UIGraphicsEndImageContext()
        
        let imageView: UIImageView = UIImageView(image: image)
        self.insertSubview(imageView, at: 0)
    }
    
    /// Adds a motion effect to the view.
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
    
    /// Take a screenshot of the current view
    ///
    /// - Parameter save: Save the screenshot in user pictures. Default is false.
    /// - Returns: Returns screenshot as UIImage
    public func screenshot(save: Bool = false) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        self.layer.render(in: context)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        if save {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        
        return image
    }
    
    /// Removes all subviews from current view
    public func removeAllSubviews() {
        self.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}

// MARK: - UIView animatable extension

/// Extends UIView with animatable functions.
extension UIView {
    /// Create a shake effect.
    ///
    /// - Parameters:
    ///   - count: Shakes count. Default is 2.
    ///   - duration: Shake duration. Default is 0.15.
    ///   - translation: Shake translation. Default is 5.
    func shake(count: Float = 2, duration: TimeInterval = 0.15, translation: Float = 5) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = count
        animation.duration = (duration) / TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation
        
        self.layer.add(animation, forKey: "shake")
    }
    
    /// Create a pulse effect.
    ///
    /// - Parameters:
    ///   - count: Pulse count. Default is 1.
    ///   - duration: Pulse duration. Default is 1.
    public func pulse(count: Float = 1, duration: TimeInterval = 1) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = count
        
        self.layer.add(animation, forKey: "pulse")
    }
    
    /// Create a heartbeat effect.
    ///
    /// - Parameters:
    ///   - count: Seconds of animation. Default is 1.
    ///   - maxSize: Maximum size of the object to animate. Default is 1.4.
    ///   - durationPerBeat: Duration per beat. Default is 0.5.
    public func heartbeat(count: Float = 1, maxSize: CGFloat = 1.4, durationPerBeat: TimeInterval = 0.5) {
        let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform")
        
        let scale1: CATransform3D = CATransform3DMakeScale(0.8, 0.8, 1)
        let scale2: CATransform3D = CATransform3DMakeScale(maxSize, maxSize, 1)
        let scale3: CATransform3D = CATransform3DMakeScale(maxSize - 0.3, maxSize - 0.3, 1)
        let scale4: CATransform3D = CATransform3DMakeScale(1.0, 1.0, 1)
        
        let frameValues = [NSValue(caTransform3D: scale1), NSValue(caTransform3D: scale2), NSValue(caTransform3D: scale3), NSValue(caTransform3D: scale4)]
        
        animation.values = frameValues
        
        let frameTimes = [NSNumber(value: 0.05), NSNumber(value: 0.2), NSNumber(value: 0.6), NSNumber(value: 1.0)]
        animation.keyTimes = frameTimes
        
        animation.fillMode = kCAFillModeForwards
        animation.duration = durationPerBeat
        animation.repeatCount = count / Float(durationPerBeat)
        
        self.layer.add(animation, forKey: "heartbeat")
    }
    
    /// Create a flip effect.
    ///
    /// - Parameters:
    ///   - duration: Seconds of animation.
    ///   - direction: Direction of the flip animation.
    public func flip(duration: TimeInterval, direction: UIViewAnimationFlipDirection) {
        let transition: CATransition = CATransition()
        transition.subtype = direction.rawValue
        transition.startProgress = 0
        transition.endProgress = 1.0
        transition.type = "flip"
        transition.duration = duration
        transition.repeatCount = 1
        transition.autoreverses = true
        
        self.layer.add(transition, forKey: "flip")
    }
    
    /// Translate the UIView around the topView.
    ///
    /// - Parameters:
    ///   - topView: Top view to translate to.
    ///   - duration: Duration of the translation.
    ///   - direction: Direction of the translation.
    ///   - repeatAnimation: If the animation must be repeat or no.
    ///   - startFromEdge: If the animation must start from the edge.
    public func translateAround(topView: UIView, duration: CGFloat, direction: UIViewAnimationTranslationDirection, repeatAnimation: Bool = true, startFromEdge: Bool = true) {
        var startPosition: CGFloat = self.center.x, endPosition: CGFloat
        switch direction {
        case .leftToRight:
            startPosition = self.frame.size.width / 2
            endPosition = -(self.frame.size.width / 2) + topView.frame.size.width
        case .rightToLeft:
            startPosition = -(self.frame.size.width / 2) + topView.frame.size.width
            endPosition = self.frame.size.width / 2
        }
        
        if startFromEdge {
            self.center = CGPoint(x: startPosition, y: self.center.y)
        }
        
        UIView.animate(withDuration: TimeInterval(duration / 2), delay: 1, options: UIViewAnimationOptions(), animations: {
            self.center = CGPoint(x: endPosition, y: self.center.y)
        }, completion: { finished in
            if finished {
                UIView.animate(withDuration: TimeInterval(duration / 2), delay: 1, options: UIViewAnimationOptions(), animations: {
                    self.center = CGPoint(x: startPosition, y: self.center.y)
                }, completion: { finished in
                    if finished {
                        if repeatAnimation {
                            self.translateAround(topView: topView, duration: duration, direction: direction, repeatAnimation: repeatAnimation, startFromEdge: startFromEdge)
                        }
                    }
                })
            }
        })
    }
    
    /// Animate along path.
    ///
    /// - Parameters:
    ///   - path: Path to follow.
    ///   - count: Animation repeat count. Default is 1.
    ///   - duration: Animation duration.
    public func animate(path: UIBezierPath, count: Float = 1, duration: TimeInterval, autoreverses: Bool = false) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        animation.repeatCount = count
        animation.duration = duration
        animation.autoreverses = autoreverses
        
        self.layer.add(animation, forKey: "animateAlongPath")
    }
}

// MARK: - UIView inspectable extension

/// Extends UIView with inspectable variables.
@IBDesignable
extension UIView {
    // MARK: - Variables
    
    /// Inspectable border size.
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    /// Inspectable border color.
    @IBInspectable public var borderColor: UIColor {
        get {
            guard let borderColor = self.layer.borderColor else {
                return UIColor.clear
            }
            return UIColor(cgColor: borderColor)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    /// Inspectable mask to bounds.
    ///
    /// Set it to true if you want to enable corner radius.
    ///
    /// Set it to false if you want to enable shadow.
    @IBInspectable public var maskToBounds: Bool {
        get {
            return self.layer.masksToBounds
        }
        set {
            self.layer.masksToBounds = newValue
        }
    }
    
    /// Inspectable corners size.
    ///
    /// Remeber to set maskToBounds to true.
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    /// Inspectable shadow color.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowColor: UIColor {
        get {
            guard let shadowColor = self.layer.shadowColor else {
                return UIColor.clear
            }
            return UIColor(cgColor: shadowColor)
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    /// Inspectable shadow opacity.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    /// Inspectable shadow offset X.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowOffsetX: CGFloat {
        get {
            return self.layer.shadowOffset.width
        }
        set {
            self.layer.shadowOffset = CGSize(width: newValue, height: self.layer.shadowOffset.height)
        }
    }
    
    /// Inspectable shadow offset Y.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowOffsetY: CGFloat {
        get {
            return self.layer.shadowOffset.height
        }
        set {
            self.layer.shadowOffset = CGSize(width: self.layer.shadowOffset.width, height: newValue)
        }
    }
    
    /// Inspectable shadow radius.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
}
