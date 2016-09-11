//
//  BFButton.swift
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

import UIKit

/// This class adds some useful functions to UIButton that cannot be in an extension
public class BFButton: UIButton {
    // MARK: - Instance variables -
    
    /// The fade duration
    private var fadeDuration: Float!
    
    /// The animation on highlighted status
    public override var isHighlighted: Bool {
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
    
    /// The overlay image
    internal var overlayImageView: UIImageView! {
        didSet(newOverlayImageView) {
            if self.overlayImageView != newOverlayImageView && newOverlayImageView != nil {
                self.overlayImageView = newOverlayImageView
            }
            
            self.overlayImageView.alpha = 0
        }
    }
    
    // MARK: - Init functions -
    
    /**
     Required init function
     
     - parameter aDecoder: NSCoder
     
     - returns: The initialized instance
     */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     Create an UIButton with a fade animation from image to highlightedImage on touch
    
     - parameter frame:            Button's frame
     - parameter image:            Button's image
     - parameter highlightedImage: Button's highlighted image
     - parameter fadeDuration:     Fade duration
    
     - returns: Returns the created BFButton, subclass of UIButton
     */
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
