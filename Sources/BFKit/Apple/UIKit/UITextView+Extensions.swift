//
//  UITextView+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati.
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

// MARK: - UITextView extension

/// This extesion adds some useful functions to UITextView.
public extension UITextView {
    // MARK: - Functions
    
    /// Create an UITextView and set some parameters.
    ///
    /// - Parameters:
    ///   - frame: TextView frame.
    ///   - text: TextView text.
    ///   - font: TextView text font.
    ///   - textColor: TextView text color.
    ///   - alignment: TextView text alignment.
    ///   - dataDetectorTypes: TextView data detector types.
    ///   - editable: Set if TextView is editable.
    ///   - selectable: Set if TextView is selectable.
    ///   - returnKeyType: TextView return key type.
    ///   - keyboardType: TextView keyboard type.
    ///   - secure: Set if the TextView is secure or not.
    ///   - autocapitalizationType: TextView text capitalization.
    ///   - keyboardAppearance: TextView keyboard appearence.
    ///   - enablesReturnKeyAutomatically: Set if the TextView has to automatically enables the return key.
    ///   - autocorrectionType: TextView auto correction type.
    ///   - delegate: TextView delegate. Set nil if it has no delegate.
    public convenience init(frame: CGRect, text: String, font: UIFont, textColor: UIColor, alignment: NSTextAlignment, dataDetectorTypes: UIDataDetectorTypes, editable: Bool, selectable: Bool, returnKeyType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, autocapitalizationType: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, autocorrectionType: UITextAutocorrectionType, delegate: UITextViewDelegate?) {
        self.init(frame: frame)
        self.text = text
        self.autocorrectionType = autocorrectionType
        self.textAlignment = alignment
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.textColor = textColor
        self.returnKeyType = returnKeyType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        isSecureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = font
        self.delegate = delegate
        self.dataDetectorTypes = dataDetectorTypes
        isEditable = editable
        isSelectable = selectable
    }
    
    /// Create an UITextView and set some parameters.
    ///
    /// - Parameters:
    ///   - frame: TextView frame.
    ///   - text: TextView text.
    ///   - font: TextView text font name.
    ///   - fontSize: TextView text size.
    ///   - textColor: TextView text color.
    ///   - alignment: TextView text alignment.
    ///   - dataDetectorTypes: TextView data detector types.
    ///   - editable: Set if TextView is editable.
    ///   - selectable: Set if TextView is selectable.
    ///   - returnKeyType: TextView return key type.
    ///   - keyboardType: TextView keyboard type.
    ///   - secure: Set if the TextView is secure or not.
    ///   - autocapitalizationType: TextView text capitalization.
    ///   - keyboardAppearance: TextView keyboard appearence.
    ///   - enablesReturnKeyAutomatically: Set if the TextView has to automatically enables the return key.
    ///   - autocorrectionType: TextView auto correction type.
    ///   - delegate: TextView delegate. Set nil if it has no delegate.
    public convenience init(frame: CGRect, text: String, font: FontName, fontSize: CGFloat, textColor: UIColor, alignment: NSTextAlignment, dataDetectorTypes: UIDataDetectorTypes, editable: Bool, selectable: Bool, returnKeyType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, autocapitalizationType: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, autocorrectionType: UITextAutocorrectionType, delegate: UITextViewDelegate?) {
        self.init(frame: frame)
        self.text = text
        self.autocorrectionType = autocorrectionType
        textAlignment = alignment
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.textColor = textColor
        self.returnKeyType = returnKeyType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        isSecureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = UIFont(fontName: font, size: fontSize)
        self.delegate = delegate
        self.dataDetectorTypes = dataDetectorTypes
        isEditable = editable
        isSelectable = selectable
    }
    
    /// Paste the pasteboard text to UITextView
    public func pasteFromPasteboard() {
        text = UIPasteboard.getString()
    }
    
    /// Copy UITextView text to pasteboard
    public func copyToPasteboard() {
        UIPasteboard.copy(text: text)
    }
}
