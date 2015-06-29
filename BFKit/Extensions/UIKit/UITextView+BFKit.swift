//
//  UITextView+BFKit.swift
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

extension UITextView
{
    // MARK: - Init functions -
    
    convenience init(frame: CGRect, text: String, font: FontName, size: CGFloat, color: UIColor, alignment: NSTextAlignment, dataDetectorTypes: UIDataDetectorTypes, editable: Bool, selectable: Bool, returnType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, autoCapitalization: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, autoCorrectionType: UITextAutocorrectionType, delegate: UITextViewDelegate)
    {
        self.init(frame: frame)
        self.text = text
        self.autocorrectionType = autoCorrectionType
        self.textAlignment = alignment
        self.keyboardType = keyboardType
        self.autocapitalizationType = autoCapitalization
        self.textColor = color
        self.returnKeyType = returnType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        self.secureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = UIFont(fontName: font, size: size)
        self.delegate = delegate
        self.dataDetectorTypes = dataDetectorTypes
        self.editable = editable
        self.selectable = selectable
    }
}
