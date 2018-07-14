//
//  UITextField+Extensions.swift
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

// MARK: - UITextField extension

/// This extesion adds some useful functions to UITextField.
public extension UITextField {
    // MARK: - Functions
    
    /// Create an UITextField and set some parameters.
    ///
    /// - Parameters:
    ///   - frame: TextField frame.
    ///   - placeholder: TextField text placeholder.
    ///   - font: TextField text font.
    ///   - textColor: TextField text color.
    ///   - returnKeyType:  TextField return key type.
    ///   - keyboardType: TextField keyboard type.
    ///   - secure: Set if the TextField is secure or not.
    ///   - borderStyle: TextField border style.
    ///   - autocapitalizationType: TextField text capitalization.
    ///   - keyboardAppearance: TextField keyboard appearence.
    ///   - enablesReturnKeyAutomatically: Set if the TextField has to automatically enables the return key.
    ///   - clearButtonMode: TextField clear button mode.
    ///   - autoCorrectionType: TextField auto correction type.
    ///   - delegate: TextField delegate. Set nil if it has no delegate.
    public convenience init(frame: CGRect, placeholder: String, font: UIFont, textColor: UIColor, returnKeyType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, borderStyle: UITextBorderStyle, autocapitalizationType: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, clearButtonMode: UITextFieldViewMode, autocorrectionType: UITextAutocorrectionType, delegate: UITextFieldDelegate?) {
        self.init(frame: frame)
        self.borderStyle = borderStyle
        self.autocorrectionType = autocorrectionType
        self.clearButtonMode = clearButtonMode
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.placeholder = placeholder
        self.textColor = textColor
        self.returnKeyType = returnKeyType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        isSecureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = font
        self.delegate = delegate
    }
    
    /// Create an UITextField and set some parameters.
    ///
    /// - Parameters:
    ///   - frame: TextField frame.
    ///   - placeholder: TextField text placeholder.
    ///   - font: TextField text font name.
    ///   - fontSize: TextField text size.
    ///   - textColor: TextField text color.
    ///   - returnKeyType:  TextField return key type.
    ///   - keyboardType: TextField keyboard type.
    ///   - secure: Set if the TextField is secure or not.
    ///   - borderStyle: TextField border style.
    ///   - autocapitalizationType: TextField text capitalization.
    ///   - keyboardAppearance: TextField keyboard appearence.
    ///   - enablesReturnKeyAutomatically: Set if the TextField has to automatically enables the return key.
    ///   - clearButtonMode: TextField clear button mode.
    ///   - autoCorrectionType: TextField auto correction type.
    ///   - delegate: TextField delegate. Set nil if it has no delegate.
    public convenience init(frame: CGRect, placeholder: String, font: FontName, fontSize: CGFloat, textColor: UIColor, returnKeyType: UIReturnKeyType, keyboardType: UIKeyboardType, secure: Bool, borderStyle: UITextBorderStyle, autocapitalizationType: UITextAutocapitalizationType, keyboardAppearance: UIKeyboardAppearance, enablesReturnKeyAutomatically: Bool, clearButtonMode: UITextFieldViewMode, autocorrectionType: UITextAutocorrectionType, delegate: UITextFieldDelegate?) {
        self.init(frame: frame)
        self.borderStyle = borderStyle
        self.autocorrectionType = autocorrectionType
        self.clearButtonMode = clearButtonMode
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.placeholder = placeholder
        self.textColor = textColor
        self.returnKeyType = returnKeyType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        isSecureTextEntry = secure
        self.keyboardAppearance = keyboardAppearance
        self.font = UIFont(fontName: font, size: fontSize)
        self.delegate = delegate
    }
    
    /// Paste the pasteboard text to UITextField.
    public func pasteFromPasteboard() {
        text = UIPasteboard.getString()
    }
    
    /// Copy UITextField text to pasteboard.
    public func copyToPasteboard() {
        guard let text = text else {
            return
        }
        
        UIPasteboard.copy(text: text)
    }
}
