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

import Foundation
import UIKit

/// This class adds some useful functions to UIButton that cannot be in an extension
public class BFButton: UIButton {
    // MARK: - Variables -
    
    /// The overlay image
    private var overlayImgView: UIImageView! {
        didSet(newOverlayImgView) {
            if self.overlayImgView != newOverlayImgView && newOverlayImgView != nil {
                self.overlayImgView = newOverlayImgView
            }
            
            self.overlayImgView.alpha = 0
        }
    }
    /// The fade duration
    private var fadeDuration: Float!
    
    /// The animation on highlighted status
    public override var highlighted: Bool {
        didSet(highlighted) {
            if highlighted == false {
                self.addSubview(self.overlayImgView)
                self.overlayImgView.alpha = 0
                
                UIView.animateWithDuration(NSTimeInterval(self.fadeDuration), animations: {
                    self.overlayImgView.alpha = 1
                })
            } else {
                UIView.animateWithDuration(NSTimeInterval(self.fadeDuration), animations: {
                    self.overlayImgView.alpha = 0
                }, completion: { (completed) in
                    if completed {
                        self.overlayImgView.removeFromSuperview()
                    }
                })
            }
        }
    }
    
    // MARK: - Init functions -
    
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
        
        self.setImage(image, forState: .Normal)
        self.overlayImgView = UIImageView(image: highlightedImage)
        self.overlayImgView.frame = self.imageView!.frame
        self.overlayImgView.bounds = self.imageView!.bounds
        
        self.adjustsImageWhenHighlighted = false
    }

    /**
     Required init function
    
     - parameter aDecoder: NSCoder
     
     - returns: The initialized instance
     */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
