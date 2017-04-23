//
//  UIImageViewExtension.swift
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

// MARK: - UIImageView extension

/// This extesion adds some useful functions to UIImageView.
public extension UIImageView {
    // MARK: - Functions
    
    /// Create an UIImageView with the given image and frame
    ///
    /// - Parameters:
    ///   - frame: UIImageView frame.
    ///   - image: UIImageView image.
    /// - Returns: Returns the created UIImageView.
    public convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        self.image = image
    }
    
    /// Create an UIImageView with the given image, size and center.
    ///
    /// - Parameters:
    ///   - image: UIImageView image.
    ///   - size: UIImageView size.
    ///   - center: UIImageView center.
    /// - Returns: Returns the created UIImageView.
    public convenience init(image: UIImage, size: CGSize, center: CGPoint) {
        self.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.image = image
        self.center = center
    }
    
    /// Create an UIImageView with the given image and center.
    ///
    /// - Parameters:
    ///   - image: UIImageView image.
    ///   - center: UIImageView center.
    /// - Returns: Returns the created UIImageView.
    public convenience init(image: UIImage, center: CGPoint) {
        self.init(image: image)
        self.center = center
    }
    
    /// Create an UIImageView with the given image and center.
    ///
    /// - Parameters:
    ///   - imageTemplate: UIImage template.
    ///   - tintColor: Template color.
    /// - Returns: Returns the created UIImageView.
    public convenience init(imageTemplate: UIImage, tintColor: UIColor) {
        var _imageTemplate = imageTemplate
        self.init(image: _imageTemplate)
        _imageTemplate = _imageTemplate.withRenderingMode(.alwaysTemplate)
        self.tintColor = tintColor
    }
    
    /// Create a drop shadow effect.
    ///
    /// - Parameters:
    ///   - color: Shadow color.
    ///   - radius: Shadow radius.
    ///   - offset: Shadow offset.
    ///   - opacity: Shadow opacity.
    public func shadow(color: UIColor, radius: CGFloat, offset: CGSize, opacity: Float) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.clipsToBounds = false
    }
    
    /// Mask the current UIImageView with an UIImage.
    ///
    /// - Parameter image: The mask UIImage.
    public func mask(image: UIImage) {
        let mask: CALayer = CALayer()
        mask.contents = image.cgImage
        mask.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.mask = mask
        self.layer.masksToBounds = false
    }
}
