//
//  BFTextField.swift
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

/// This class adds some useful functions to UITextField that cannot be in an extension
public class BFTextField: UITextField {
    @IBInspectable public var maxNumberOfCharacters: Int = 0 {
        didSet {
            
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.maxNumberOfCharacters = 0
        NotificationCenter.default.addObserver(self, selector: #selector(BFTextField.textFieldDidChange(_:)), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
    }
    
    /**
     Required init function
     
     - parameter aDecoder: NSCoder
     
     - returns: The initialized instance
     */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.maxNumberOfCharacters = Int(aDecoder.decodeInteger(forKey: "MaxNumberOfCharacters"))
        NotificationCenter.default.addObserver(self, selector: #selector(BFTextField.textFieldDidChange(_:)), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
    }
    
    public override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        
        aCoder.encode(Int32(maxNumberOfCharacters), forKey: "MaxNumberOfCharacters")
    }
    
    public func textFieldDidChange(_ notification: Notification) {
        if self.maxNumberOfCharacters != 0 && self.text!.length >= self.maxNumberOfCharacters {
            self.text = self.text?.substringToIndex(self.maxNumberOfCharacters)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
