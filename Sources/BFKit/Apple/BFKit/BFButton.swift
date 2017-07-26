//
//  BFButton.swift
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

import UIKit

// MARK: - BFButton - UIButton subclass

/// This class adds some useful functions to UIButton that cannot be in an extension.
open class BFButton: UIButton {
    // MARK: - Variables
    
    /// The fade duration.
    public var fadeDuration: Float = 0
    
    /// The animation on highlighted status.
    open override var isHighlighted: Bool {
        didSet(highlighted) {
            if highlighted == false {
                self.addSubview(self.overlayImageView)
                self.overlayImageView.alpha = 0
                
                UIView.animate(withDuration: TimeInterval(self.fadeDuration), animations: {
                    self.overlayImageView.alpha = 1
                })
            } else {
                UIView.animate(withDuration: TimeInterval(self.fadeDuration), animations: {
                    self.overlayImageView.alpha = 0
                    }, completion: { (completed) in
                        if completed {
                            self.overlayImageView.removeFromSuperview()
                        }
                    }
                )
            }
        }
    }
    
    /// The overlay image, cannot be nil.
    public var overlayImageView: UIImageView! {
        didSet(newOverlayImageView) {
            if self.overlayImageView != newOverlayImageView, newOverlayImageView != nil {
                self.overlayImageView = newOverlayImageView
            }
            
            self.overlayImageView.frame = self.imageView!.frame
            self.overlayImageView.bounds = self.imageView!.bounds
            self.overlayImageView.alpha = 0
        }
    }
    
    // MARK: - Functions
    
    /// Required init function.
    ///
    /// - Parameter aDecoder: NSCoder.
    /// - Returns: The initialized instance.
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.fadeDuration = aDecoder.decodeFloat(forKey: "FadeDuration")
        self.overlayImageView = aDecoder.decodeObject(forKey: "OverlayImageView") as! UIImageView // swiftlint:disable:this force_cast
        self.overlayImageView.frame = self.imageView!.frame
        self.overlayImageView.bounds = self.imageView!.bounds
        
        self.adjustsImageWhenHighlighted = false
    }
    
    /// Encodes added variables.
    ///
    /// - Parameter aCoder: NSCoder.
    open override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        
        aCoder.encode(self.fadeDuration, forKey: "FadeDuration")
        aCoder.encode(self.overlayImageView, forKey: "OverlayImageView")
    }
    
    /// Create an UIButton with a fade animation from image to highlightedImage on touch.
    ///
    /// - Parameters:
    ///   - frame: Button frame.
    ///   - image: Button image.
    ///   - highlightedImage: Button highlighted image.
    ///   - fadeDuration: Fade duration.
    public init(frame: CGRect, image: UIImage, highlightedImage: UIImage, fadeDuration: Float) {
        self.fadeDuration = fadeDuration
        
        super.init(frame: frame)
        
        self.setImage(image, for: UIControlState())
        self.overlayImageView = UIImageView(image: highlightedImage)
        self.overlayImageView.frame = self.imageView!.frame
        self.overlayImageView.bounds = self.imageView!.bounds
        
        self.adjustsImageWhenHighlighted = false
    }
}
