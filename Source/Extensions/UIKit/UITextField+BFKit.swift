//
//  UITextField+BFKit.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Fabrizio Brancati. All rights reserved.
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

/// This extesion adds some useful functions to UITextField
public extension UITextField
{
    // MARK: - Init functions -
    
    /**
    Create an UITextField and set some parameters
    
    :param: frame                         TextField's frame
    :param: placeholder                   TextField's text placeholder
    :param: font                          TextField's text font
    :param: size                          TextField's text size
    :param: color                         TextField's text color
    :param: returnType                    TextField's return key type
    :param: keyboardType                  TextField's keyboard type
    :param: secure                        Set if the TextField is secure or not
    :param: borderStyle                   TextField's border style
    :param: autoCapitalization            TextField's text capitalization
    :param: keyboardAppearance            TextField's keyboard appearence
    :param: enablesReturnKeyAutomatically Set if the TextField has to automatically enables the return key
    :param: clearButtonMode               TextField's clear button mode
    :param: autoCorrectionType            TextField's auto correction type
    :param: delegate                      TextField's delegate. Set nil if it has no delegate
    
    :returns: Returns the created UITextField
    */
    public convenience init(frame: CGRect, placeholder: String, font: FontName, size: CGFloat, color: UIColor, returnType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, borderStyle: UITextBorderStyle, autoCapitalization: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, clearButtonMode: UITextFieldViewMode, autoCorrectionType: UITextAutocorrectionType, delegate: UITextFieldDelegate)
    {
        self.init(frame: frame)
        self.borderStyle = borderStyle
        self.autocorrectionType = autoCorrectionType
        self.clearButtonMode = clearButtonMode
        self.keyboardType = keyboardType
        self.autocapitalizationType = autoCapitalization
        self.placeholder = placeholder
        self.textColor = color
        self.returnKeyType = returnType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        self.secureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = UIFont(fontName: font, size: size)
        self.delegate = delegate
    }
}
