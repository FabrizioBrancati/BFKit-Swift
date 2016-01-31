//
//  UILabel+BFKit.swift
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

/// This extesion adds some useful functions to UILabel
public extension UILabel {
    // MARK: - Init functions -
    
    /**
     Create an UILabel with the given parameters, with clearColor for the shadow
    
     - parameter frame:     Label's frame
     - parameter text:      Label's text
     - parameter font:      Label's font name, FontName enum is declared in UIFont+BFKit
     - parameter size:      Label's font size
     - parameter color:     Label's text color
     - parameter alignment: Label's text alignment
     - parameter lines:     Label's text lines
    
     - returns: Returns the created UILabel
     */
    @available(*, obsoleted=1.2.0, message="Use UILabel(_, text:, font:, size:, color:, alignment:, lines:, shadowColor:)")
    public convenience init(frame: CGRect, text: String, font: FontName, size: CGFloat, color: UIColor, alignment: NSTextAlignment, lines: Int) {
        self.init(frame: frame, text: text, font: font, size: size, color: color, alignment: alignment, lines: lines, shadowColor: UIColor.clearColor())
    }
    
    /**
     Create an UILabel with the given parameters
    
     - parameter frame:       Label's frame
     - parameter text:        Label's text
     - parameter font:        Label's font name, FontName enum is declared in UIFont+BFKit
     - parameter size:        Label's font size
     - parameter color:       Label's text color
     - parameter alignment:   Label's text alignment
     - parameter lines:       Label's text lines
     - parameter shadowColor: Label's text shadow color
    
     - returns: Returns the created UILabel
     */
    public convenience init(frame: CGRect, text: String, font: FontName, size: CGFloat, color: UIColor, alignment: NSTextAlignment, lines: Int, shadowColor: UIColor = UIColor.clearColor()) {
        self.init(frame: frame)
        self.font = UIFont(fontName: font, size: size)
        self.text = text
        self.backgroundColor = UIColor.clearColor()
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = lines
        self.shadowColor = shadowColor
    }
    
    // MARK: - Instance functions -
    
    /**
    Calculates height based on text, width and font
    
    - returns: Returns calculated height
    */
    public func calculatedHeight() -> CGFloat {
        let text: String = self.text!
        return text.heightForWidth(self.frame.size.width, font: self.font)
    }
    
    /**
     Sets a custom font from a character at an index to character at another index
     
     - parameter font:      New font to be setted
     - parameter fromIndex: The start index
     - parameter toIndex:   The end index
     */
    public func setFont(font: UIFont, fromIndex: Int, toIndex: Int) {
        let string = NSMutableAttributedString(string: self.text!)
        string.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(fromIndex, toIndex - fromIndex))
        
        self.attributedText = string;
    }
}
