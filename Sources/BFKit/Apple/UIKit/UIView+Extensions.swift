//
//  UIView+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2019 Fabrizio Brancati.
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

import CoreGraphics
import Foundation
import QuartzCore
import UIKit

// MARK: - UIView extension

/// This extesion adds some useful functions to UIView.
public extension UIView {
    // MARK: - Variables
    
    /// Direction of flip animation.
    enum UIViewAnimationFlipDirection: String {
        /// Flip animation from top.
        case top = "fromTop"
        /// Flip animation from left.
        case left = "fromLeft"
        /// Flip animation from right.
        case right = "fromRight"
        /// Flip animation from bottom.
        case bottom = "fromBottom"
    }
    
    /// Direction of the translation.
    enum UIViewAnimationTranslationDirection: Int {
        /// Translation from left to right.
        case leftToRight
        /// Translation from right to left.
        case rightToLeft
    }
    
    /// Direction of the linear gradient.
    enum UIViewGradientDirection {
        /// Linear gradient vertical.
        case vertical
        /// Linear gradient horizontal.
        case horizontal
        /// Linear gradient from left top to right down.
        case diagonalLeftTopToRightDown
        /// Linear gradient from left down to right top.
        case diagonalLeftDownToRightTop
        /// Linear gradient from right top to left down.
        case diagonalRightTopToLeftDown
        ///  Linear gradient from right down to left top.
        case diagonalRightDownToLeftTop
        /// Custom gradient direction.
        case custom(startPoint: CGPoint, endPoint: CGPoint)
    }
    
    /// Type of gradient.
    enum UIViewGradientType {
        /// Linear gradient.
        case linear
        /// Radial gradient.
        case radial
    }
    
    // MARK: - Functions
    
    /// Create an UIView with the given frame and background color.
    ///
    /// - Parameters:
    ///   - frame: UIView frame.
    ///   - backgroundColor: UIView background color.
    convenience init(frame: CGRect, backgroundColor: UIColor) {
        self.init(frame: frame)
        self.backgroundColor = backgroundColor
    }
    
    /// Creates a border around the UIView.
    ///
    /// - Parameters:
    ///   - color: Border color.
    ///   - radius: Border radius.
    ///   - width: Border width.
    func border(color: UIColor, radius: CGFloat, width: CGFloat) {
        layer.borderWidth = width
        layer.cornerRadius = radius
        layer.shouldRasterize = false
        layer.rasterizationScale = 2
        clipsToBounds = true
        layer.masksToBounds = true
        
        let cgColor: CGColor = color.cgColor
        layer.borderColor = cgColor
    }
    
    /// Removes border around the UIView.
    func removeBorder(maskToBounds: Bool = true) {
        layer.borderWidth = 0
        layer.cornerRadius = 0
        layer.borderColor = nil
        layer.masksToBounds = maskToBounds
    }
    
    /// Set the corner radius of UIView only at the given corner.
    /// Currently doesn't support `frame` property changes.
    /// If you change the frame, you have to call this function again.
    ///
    /// - Parameters:
    ///   - corners: Corners to apply radius.
    ///   - radius: Radius value.
    func cornerRadius(corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11, *) {
            var cornerMask: CACornerMask = []
            if corners.contains(.allCorners) {
                cornerMask = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
            } else {
                if corners.contains(.bottomLeft) {
                    cornerMask.update(with: .layerMinXMaxYCorner)
                }
                if corners.contains(.bottomRight) {
                    cornerMask.update(with: .layerMaxXMaxYCorner)
                }
                if corners.contains(.topLeft) {
                    cornerMask.update(with: .layerMinXMinYCorner)
                }
                if corners.contains(.topRight) {
                    cornerMask.update(with: .layerMaxXMinYCorner)
                }
            }
            
            layer.cornerRadius = radius
            layer.masksToBounds = true
            layer.maskedCorners = cornerMask
        } else {
            let rectShape = CAShapeLayer()
            rectShape.bounds = frame
            rectShape.position = center
            rectShape.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
            layer.mask = rectShape
        }
    }
    
    /// Set the corner radius of UIView for all corners.
    /// This function supports `frame` property changes,
    /// it's different from `cornerRadius(corners: UIRectCorner, radius: CGFloat)`
    /// that doesn't support it.
    ///
    /// - Parameter radius: Radius value.
    func cornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    /// Create a shadow on the UIView.
    ///
    /// - Parameters:
    ///   - offset: Shadow offset.
    ///   - opacity: Shadow opacity.
    ///   - radius: Shadow radius.
    ///   - color: Shadow color. Default is black.
    func shadow(offset: CGSize, opacity: Float, radius: CGFloat, cornerRadius: CGFloat = 0, color: UIColor = UIColor.black) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        if cornerRadius != 0 {
            layer.cornerRadius = cornerRadius
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        }
        layer.masksToBounds = false
    }
    
    /// Removes shadow around the UIView.
    func removeShadow(maskToBounds: Bool = true) {
        layer.shadowColor = nil
        layer.shadowOpacity = 0.0
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 0
        layer.cornerRadius = 0
        layer.shadowPath = nil
        layer.masksToBounds = maskToBounds
    }
    
    /// Create a linear gradient.
    ///
    /// - Parameters:
    ///   - colors: Array of UIColor instances.
    ///   - direction: Direction of the gradient.
    /// - Returns: Returns the created CAGradientLayer.
    @discardableResult
    func gradient(colors: [UIColor], direction: UIViewGradientDirection) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        
        var mutableColors: [Any] = colors
        for index in 0 ..< colors.count {
            let currentColor: UIColor = colors[index]
            mutableColors[index] = currentColor.cgColor
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

        case let .custom(startPoint, endPoint):
            gradient.startPoint = startPoint
            gradient.endPoint = endPoint
        }
        layer.insertSublayer(gradient, at: 0)
        
        return gradient
    }
    
    /// Create a smooth linear gradient, requires more computational time than 
    ///
    ///     gradient(colors:,direction:)
    ///
    /// - Parameters:
    ///   - colors: Array of UIColor instances.
    ///   - direction: Direction of the gradient.
    func smoothGradient(colors: [UIColor], direction: UIViewGradientDirection, type: UIViewGradientType = .linear) {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIImage.screenScale())
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
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
            startPoint = CGPoint(x: bounds.midX, y: 0.0)
            endPoint = CGPoint(x: bounds.midX, y: bounds.height)

        case .horizontal:
            startPoint = CGPoint(x: 0.0, y: bounds.midY)
            endPoint = CGPoint(x: bounds.width, y: bounds.midY)

        case .diagonalLeftTopToRightDown:
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: bounds.width, y: bounds.height)

        case .diagonalLeftDownToRightTop:
            startPoint = CGPoint(x: 0.0, y: bounds.height)
            endPoint = CGPoint(x: bounds.width, y: 0.0)

        case .diagonalRightTopToLeftDown:
            startPoint = CGPoint(x: bounds.width, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: bounds.height)

        case .diagonalRightDownToLeftTop:
            startPoint = CGPoint(x: bounds.width, y: bounds.height)
            endPoint = CGPoint(x: 0.0, y: 0.0)

        case let .custom(customStartPoint, customEndPoint):
            startPoint = customStartPoint
            endPoint = customEndPoint
        }
        
        guard let gradient = CGGradient(colorSpace: colorSpace, colorComponents: components, locations: locations, count: locations.count) else {
            return
        }
        
        switch type {
        case .linear:
            context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: .drawsBeforeStartLocation)

        case .radial:
            context.drawRadialGradient(gradient, startCenter: startPoint, startRadius: 0.0, endCenter: endPoint, endRadius: 1.0, options: .drawsBeforeStartLocation)
        }
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return
        }
        
        UIGraphicsEndImageContext()
        
        let imageView = UIImageView(image: image)
        insertSubview(imageView, at: 0)
    }
    
    /// Adds a motion effect to the view.
    func applyMotionEffects() {
        let horizontalEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        let verticalEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        let motionEffectGroup = UIMotionEffectGroup()
        
        horizontalEffect.minimumRelativeValue = -10.0
        horizontalEffect.maximumRelativeValue = 10.0
        
        verticalEffect.minimumRelativeValue = -10.0
        verticalEffect.maximumRelativeValue = 10.0
        
        motionEffectGroup.motionEffects = [horizontalEffect, verticalEffect]
        
        addMotionEffect(motionEffectGroup)
    }
    
    /// Take a screenshot of the current view
    ///
    /// - Parameter save: Save the screenshot in user pictures. Default is false.
    /// - Returns: Returns screenshot as UIImage
    func screenshot(save: Bool = false) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        layer.render(in: context)
        
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
    func removeAllSubviews() {
        subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}

// MARK: - UIView animatable extension

/// Extends UIView with animatable functions.
public extension UIView {
    /// Create a shake effect.
    ///
    /// - Parameters:
    ///   - count: Shakes count. Default is 2.
    ///   - duration: Shake duration. Default is 0.15.
    ///   - translation: Shake translation. Default is 5.
    func shake(count: Float = 2, duration: TimeInterval = 0.15, translation: Float = 5) {
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = (duration) / TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation
        
        layer.add(animation, forKey: "shake")
    }
    
    /// Create a pulse effect.
    ///
    /// - Parameters:
    ///   - count: Pulse count. Default is 1.
    ///   - duration: Pulse duration. Default is 1.
    func pulse(count: Float = 1, duration: TimeInterval = 1) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = count
        
        layer.add(animation, forKey: "pulse")
    }
    
    /// Create a heartbeat effect.
    ///
    /// - Parameters:
    ///   - count: Seconds of animation. Default is 1.
    ///   - maxSize: Maximum size of the object to animate. Default is 1.4.
    ///   - durationPerBeat: Duration per beat. Default is 0.5.
    func heartbeat(count: Float = 1, maxSize: CGFloat = 1.4, durationPerBeat: TimeInterval = 0.5) {
        let animation = CAKeyframeAnimation(keyPath: "transform")
        
        let scale1 = CATransform3DMakeScale(0.8, 0.8, 1)
        let scale2 = CATransform3DMakeScale(maxSize, maxSize, 1)
        let scale3 = CATransform3DMakeScale(maxSize - 0.3, maxSize - 0.3, 1)
        let scale4 = CATransform3DMakeScale(1.0, 1.0, 1)
        
        let frameValues = [NSValue(caTransform3D: scale1), NSValue(caTransform3D: scale2), NSValue(caTransform3D: scale3), NSValue(caTransform3D: scale4)]
        
        animation.values = frameValues
        
        let frameTimes = [NSNumber(value: 0.05), NSNumber(value: 0.2), NSNumber(value: 0.6), NSNumber(value: 1.0)]
        animation.keyTimes = frameTimes
        
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.duration = durationPerBeat
        animation.repeatCount = count / Float(durationPerBeat)
        
        layer.add(animation, forKey: "heartbeat")
    }
    
    /// Create a flip effect.
    ///
    /// - Parameters:
    ///   - duration: Seconds of animation.
    ///   - direction: Direction of the flip animation.
    func flip(duration: TimeInterval, direction: UIViewAnimationFlipDirection) {
        let transition = CATransition()
        transition.subtype = CATransitionSubtype(rawValue: direction.rawValue)
        transition.startProgress = 0
        transition.endProgress = 1.0
        transition.type = CATransitionType(rawValue: "flip")
        transition.duration = duration
        transition.repeatCount = 1
        transition.autoreverses = true
        
        layer.add(transition, forKey: "flip")
    }
    
    /// Translate the UIView around the topView.
    ///
    /// - Parameters:
    ///   - topView: Top view to translate to.
    ///   - duration: Duration of the translation.
    ///   - direction: Direction of the translation.
    ///   - repeatAnimation: If the animation must be repeat or no.
    ///   - startFromEdge: If the animation must start from the edge.
    func translateAround(topView: UIView, duration: CGFloat, direction: UIViewAnimationTranslationDirection, repeatAnimation: Bool = true, startFromEdge: Bool = true) {
        var startPosition: CGFloat = center.x, endPosition: CGFloat
        switch direction {
        case .leftToRight:
            startPosition = frame.size.width / 2
            endPosition = -(frame.size.width / 2) + topView.frame.size.width

        case .rightToLeft:
            startPosition = -(frame.size.width / 2) + topView.frame.size.width
            endPosition = frame.size.width / 2
        }
        
        if startFromEdge {
            center = CGPoint(x: startPosition, y: center.y)
        }
        
        UIView.animate(
            withDuration: TimeInterval(duration / 2),
            delay: 1,
            options: UIView.AnimationOptions(),
            animations: {
                self.center = CGPoint(x: endPosition, y: self.center.y)
            }, completion: { finished in
                if finished {
                    UIView.animate(
                        withDuration: TimeInterval(duration / 2),
                        delay: 1,
                        options: UIView.AnimationOptions(),
                        animations: {
                            self.center = CGPoint(x: startPosition, y: self.center.y)
                        }, completion: { finished in
                            if finished {
                                if repeatAnimation {
                                    self.translateAround(topView: topView, duration: duration, direction: direction, repeatAnimation: repeatAnimation, startFromEdge: startFromEdge)
                                }
                            }
                        }
                    )
                }
            }
        )
    }
    
    /// Animate along path.
    ///
    /// - Parameters:
    ///   - path: Path to follow.
    ///   - count: Animation repeat count. Default is 1.
    ///   - duration: Animation duration.
    func animate(path: UIBezierPath, count: Float = 1, duration: TimeInterval, autoreverses: Bool = false) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        animation.repeatCount = count
        animation.duration = duration
        animation.autoreverses = autoreverses
        
        layer.add(animation, forKey: "animateAlongPath")
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
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    /// Inspectable border color.
    @IBInspectable public var borderColor: UIColor {
        get {
            guard let borderColor = layer.borderColor else {
                return UIColor.clear
            }
            
            return UIColor(cgColor: borderColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    /// Inspectable mask to bounds.
    ///
    /// Set it to true if you want to enable corner radius.
    ///
    /// Set it to false if you want to enable shadow.
    @IBInspectable public var maskToBounds: Bool {
        get {
            layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
    
    /// Inspectable corners size.
    ///
    /// Remeber to set maskToBounds to true.
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    /// Inspectable shadow color.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowColor: UIColor {
        get {
            guard let shadowColor = layer.shadowColor else {
                return UIColor.clear
            }
            
            return UIColor(cgColor: shadowColor)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    /// Inspectable shadow opacity.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowOpacity: Float {
        get {
            layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /// Inspectable shadow offset X.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowOffsetX: CGFloat {
        get {
            layer.shadowOffset.width
        }
        set {
            layer.shadowOffset = CGSize(width: newValue, height: layer.shadowOffset.height)
        }
    }
    
    /// Inspectable shadow offset Y.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowOffsetY: CGFloat {
        get {
            layer.shadowOffset.height
        }
        set {
            layer.shadowOffset = CGSize(width: layer.shadowOffset.width, height: newValue)
        }
    }
    
    /// Inspectable shadow radius.
    ///
    /// Remeber to set maskToBounds to false.
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
}
