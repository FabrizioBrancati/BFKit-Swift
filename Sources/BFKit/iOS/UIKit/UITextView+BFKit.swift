//
//  UITextView+BFKit.swift
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

/// This extesion adds some useful functions to UITextView
public extension UITextView {
    // MARK: - Init functions -
    
    /**
     Create an UITextView and set some parameters
    
     - parameter frame:                         TextView's frame
     - parameter text:                          TextView's text
     - parameter font:                          TextView's text font
     - parameter size:                          TextView's text size
     - parameter color:                         TextView's text color
     - parameter alignment:                     TextView's text alignment
     - parameter dataDetectorTypes:             TextView's data detector types
     - parameter editable:                      Set if TextView is editable
     - parameter selectable:                    Set if TextView is selectable
     - parameter returnType:                    TextField's return key type
     - parameter keyboardType:                  TextField's keyboard type
     - parameter secure:                        Set if the TextField is secure or not
     - parameter autoCapitalization:            TextField's text capitalization
     - parameter keyboardAppearance:            TextField's keyboard appearence
     - parameter enablesReturnKeyAutomatically: Set if the TextField has to automatically enables the return key
     - parameter autoCorrectionType:            TextField's auto correction type
     - parameter delegate:                      TextField's delegate. Set nil if it has no delegate
    
     - returns: Returns the created UITextView
     */
    public convenience init(frame: CGRect, text: String, font: FontName, size: CGFloat, color: UIColor, alignment: NSTextAlignment, dataDetectorTypes: UIDataDetectorTypes, editable: Bool, selectable: Bool, returnType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, autoCapitalization: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, autoCorrectionType: UITextAutocorrectionType, delegate: UITextViewDelegate?) {
        self.init(frame: frame)
        self.text = text
        self.autocorrectionType = autoCorrectionType
        self.textAlignment = alignment
        self.keyboardType = keyboardType
        self.autocapitalizationType = autoCapitalization
        self.textColor = color
        self.returnKeyType = returnType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        self.isSecureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = UIFont(fontName: font, size: size)
        self.delegate = delegate
        self.dataDetectorTypes = dataDetectorTypes
        self.isEditable = editable
        self.isSelectable = selectable
    }
    
    // MARK: - Instance functions -
    
    /**
     Paste the pasteboard text to UITextField
     */
    public func pasteFromPasteboard() {
        self.text = UIPasteboard.stringFromPasteboard()
    }
    
    /**
     Copy UITextField text to pasteboard
     */
    public func copyToPasteboard() {
        guard let textToCopy = self.text else {
            return
        }
        
        UIPasteboard.copyToPasteboard(textToCopy)
    }
}
