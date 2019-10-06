//
//  UIButton+Extensions.swift
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

import Foundation
import UIKit

// MARK: - UIButton extension

/// This extesion adds some useful functions to UIButton.
public extension UIButton {
    // MARK: - Functions
    
    /// Create an UIButton in a frame with a title, a background image and highlighted background image.
    ///
    /// - Paramters:
    ///   - frame: Button frame.
    ///   - title: Button title.
    ///   - backgroundImage: Button background image.
    ///   - highlightedBackgroundImage: Button highlighted background image.
    convenience init(frame: CGRect, title: String, backgroundImage: UIImage? = nil, highlightedBackgroundImage: UIImage? = nil) {
        self.init(frame: frame)
        self.frame = frame
        setTitle(title, for: UIControl.State.normal)
        setBackgroundImage(backgroundImage, for: UIControl.State.normal)
        setBackgroundImage(highlightedBackgroundImage, for: UIControl.State.highlighted)
    }
    
    /// Create an UIButton in a frame with a title and a color.
    ///
    /// - Parameters:
    ///   - frame: Button frame.
    ///   - title: Button title.
    ///   - color: Button color, the highlighted color will be automatically created.
    convenience init(frame: CGRect, title: String, color: UIColor) {
        guard let components: UnsafePointer<CGFloat> = color.cgColor.__unsafeComponents else {
            self.init(frame: frame, title: title)
            return
        }
        
        self.init(frame: frame, title: title, backgroundImage: UIImage(color: color), highlightedBackgroundImage: UIImage(color: UIColor(red: components[0] - 0.1, green: components[1] - 0.1, blue: components[2] - 0.1, alpha: 1)))
    }
    
    /// Create an UIButton in a frame with a title, a color and highlighted color.
    ///
    /// - Parameters:
    ///   - frame: Button frame.
    ///   - title: Button title.
    ///   - color: Button color.
    ///   - highlightedColor: Button highlighted color.
    convenience init(frame: CGRect, title: String, color: UIColor, highlightedColor: UIColor) {
        self.init(frame: frame, title: title, backgroundImage: UIImage(color: color), highlightedBackgroundImage: UIImage(color: highlightedColor))
    }
    
    /// Create an UIButton in a frame with an image
    ///
    /// - Parameters:
    ///   - frame: Button frame
    ///   - image: Button image
    ///   - highlightedImage: Button highlighted image
    convenience init(frame: CGRect, image: UIImage, highlightedImage: UIImage? = nil) {
        self.init(frame: frame)
        self.frame = frame
        setImage(image, for: UIControl.State.normal)
        setImage(highlightedImage, for: UIControl.State.highlighted)
    }
    
    /// Set the title font with a size.
    ///
    /// - Parameters:
    ///   - fontName: Font name from the FontName enum declared in UIFontExtension.
    ///   - size:Font size.
    func setTitleFont(_ fontName: FontName, size: CGFloat) {
        if let titleLabel = titleLabel {
            titleLabel.font = UIFont(fontName: fontName, size: size)
        }
    }
    
    /// Set the title color.
    ///
    /// - Parameter color: Font color, the highlighted color will be automatically created.
    func setTitleColor(_ color: UIColor) {
        setTitleColor(color, highlightedColor: color.withAlphaComponent(0.4))
    }
    
    /// Set the title color and highlighted color
    ///
    /// - Parameters:
    ///   - color: Button color
    ///   - highlightedColor: Button highlighted color
    func setTitleColor(_ color: UIColor, highlightedColor: UIColor) {
        setTitleColor(color, for: UIControl.State.normal)
        setTitleColor(highlightedColor, for: UIControl.State.highlighted)
    }
}
