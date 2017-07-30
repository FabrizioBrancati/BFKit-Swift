//
//  BFTextField.swift
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

import Foundation
import UIKit

// MARK: - BFTextField - UITextField subclass

/// This class adds some useful functions to UITextField that cannot be in an extension.
open class BFTextField: UITextField {
    // MARK: - Variables
    
    /// Max number of characters allowed by TextField.
    @IBInspectable public var maxNumberOfCharacters: Int = 0
    
    // MARK: - Functions
    
    /// Required init function.
    ///
    /// - Parameter aDecoder: NSCoder.
    ///
    /// - Returns: The initialized instance.
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.maxNumberOfCharacters = aDecoder.decodeInteger(forKey: "MaxNumberOfCharacters")
        NotificationCenter.default.addObserver(self, selector: #selector(BFTextField.textFieldDidChange(_:)), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
    }
    
    /// Encodes added variables.
    ///
    /// - Parameter aCoder: NSCoder.
    open override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        
        aCoder.encode(self.maxNumberOfCharacters, forKey: "MaxNumberOfCharacters")
    }
    
    /// Override init with frame.
    ///
    /// - Parameter frame: TextField frame.
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.maxNumberOfCharacters = 0
        NotificationCenter.default.addObserver(self, selector: #selector(BFTextField.textFieldDidChange(_:)), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
    }
    
    /// Text field did change function.
    ///
    /// Called by observer.
    ///
    /// - Parameter notification: Notification object.
    @objc private func textFieldDidChange(_ notification: Notification) {
        guard let text = self.text else {
            return
        }
        if self.maxNumberOfCharacters != 0, text.length >= self.maxNumberOfCharacters {
            self.text = text.substring(to: self.maxNumberOfCharacters)
        }
    }
    
    /// Deinit function.
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
