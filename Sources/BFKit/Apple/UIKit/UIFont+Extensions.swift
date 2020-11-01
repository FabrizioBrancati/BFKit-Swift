//
//  UIFont+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2020 Fabrizio Brancati.
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

// MARK: - UIFont extension

/// This extesion adds some useful functions to UIFont.
public extension UIFont {
    // MARK: - Functions
    
    /// Print in console all family and font names.
    ///
    /// - Returns: Returns all the font family names.
    static func allFonts() -> [String: [String]] {
        var fontFamilies = UIFont.familyNames
        var fontFamilyDictionary: [String: [String]] = [:]
        
        fontFamilies.sort { $0 < $1 }
        
        for fontFamily in fontFamilies {
            let fontNames: [String] = UIFont.fontNames(forFamilyName: fontFamily).sorted { $0 < $1 }
            fontFamilyDictionary[fontFamily] = fontNames
        }
        
        return fontFamilyDictionary
    }
    
    /// Calculate text height for max width and font.
    ///
    /// - Parameters:
    ///   - width: Max width to fit text.
    ///   - font: Font used in text.
    ///   - text: Text.
    /// - Returns: Returns calculated height of string within width using given font.
    static func calculateHeight(width: CGFloat, font: UIFont, text: String) -> CGFloat {
        var size = CGSize.zero
        
        if !text.isEmpty {
            let frame: CGRect = text.boundingRect(with: CGSize(width: width, height: 999_999), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
            size = CGSize(width: frame.size.width, height: frame.size.height + 1)
        }
        return size.height
    }
}
