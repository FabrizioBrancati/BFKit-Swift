//
//  NSAttributedString.swift
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

// MARK: - String extension

/// This extension adds some useful functions to String to help manage NSAttributedString.
public extension String {
    /// Convert a String to a NSAttributedString.
    /// With that variable you can customize a String with a style.
    /// Example:
    ///
    ///     string.attributedString.font(UIFont(fontName: .helveticaNeue, size: 20))
    ///
    /// You can even concatenate two or more styles:
    ///
    ///     string.attributedString.font(UIFont(fontName: .helveticaNeue, size: 20)).backgroundColor(UIColor.red)
    public var attributedString: NSAttributedString {
        return NSAttributedString(string: self)
    }
}

// MARK: - NSAttributedString extension

/// This extension adds some useful functions to NSAttributedString.
public extension NSAttributedString {
    /// UIFont, default Helvetica(Neue) 12.
    ///
    /// - Parameters:
    ///   - font: UIFont, default Helvetica(Neue) 12.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func font(_ font: UIFont, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSFontAttributeName, value: font, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// NSParagraphStyle, default defaultParagraphStyle
    ///
    /// - Parameters:
    ///   - paragraphStyle: NSParagraphStyle, default defaultParagraphStyle
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func paragraphStyle(_ paragraphStyle: NSParagraphStyle, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor, default black.
    ///
    /// - Parameters:
    ///   - foregroundColor: UIColor, default black.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func foregroundColor(_ foregroundColor: UIColor, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: foregroundColor, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor, default nil means no background.
    ///
    /// - Parameters:
    ///   - backgroundColor: UIColor, default nil means no background.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func backgroundColor(_ backgroundColor: UIColor, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSBackgroundColorAttributeName, value: backgroundColor, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Default true means default ligatures, false means no ligatures.
    ///
    /// - Parameters:
    ///   - ligature: Default true means default ligatures, false means no ligatures.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func ligature(_ ligature: Bool, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSLigatureAttributeName, value: ligature, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Amount to modify default kerning.
    /// 0 means kerning is disabled.
    ///
    /// - Parameters:
    ///   - kern: Amount to modify default kerning.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func kern(_ kern: Float, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSKernAttributeName, value: kern, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Default 0 means no strikethrough.
    ///
    /// - Parameters:
    ///   - strikethroughStyle: Default 0 means no strikethrough.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func strikethroughStyle(_ strikethroughStyle: Int, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSStrikethroughStyleAttributeName, value: strikethroughStyle, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// NSUnderlineStyle.
    ///
    /// - Parameters:
    ///   - underlineStyle: NSUnderlineStyle.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func underlineStyle(_ underlineStyle: NSUnderlineStyle, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSUnderlineStyleAttributeName, value: underlineStyle, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor, default nil means same as foreground color.
    ///
    /// - Parameters:
    ///   - strokeColor: UIColor, default nil means same as foreground color.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func strokeColor(_ strokeColor: UIColor, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSStrokeColorAttributeName, value: strokeColor, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// In percent of font point size, default 0 measn no stroke.
    /// Positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0).
    ///
    /// - Parameters:
    ///   - strokeWidth: In percent of font point size, default 0 measn no stroke.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func strokeWidth(_ strokeWidth: Float, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSStrokeWidthAttributeName, value: strokeWidth, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    #if !os(watchOS)
        /// NSShadow, default nil means no shadow.
        ///
        /// - Parameters:
        ///   - shadow: NSShadow, default nil means no shadow.
        ///   - range: Application range. Default is all the String.
        /// - Returns: Returns a NSAttributedString.
        public func shadow(_ shadow: NSShadow, range: NSRange? = nil) -> NSAttributedString {
            let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
            mutableAttributedString.addAttribute(NSShadowAttributeName, value: shadow, range: attributedStringRange(range))
            return mutableAttributedString as NSAttributedString
        }
    #endif
    
    /// Default nil means no text effect.
    ///
    /// - Parameters:
    ///   - textEffect: Default is nil means no text effect. Currently, only NSTextEffectLetterpressStyle can be used.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func textEffect(_ textEffect: String, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSTextEffectAttributeName, value: textEffect, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    #if !os(watchOS)
        /// NSTextAttachment, default is nil.
        ///
        /// - Parameters:
        ///   - attachment: NSTextAttachment, default is nil.
        ///   - range: Application range. Default is all the String.
        /// - Returns: Returns a NSAttributedString.
        public func attachment(_ attachment: NSTextAttachment, range: NSRange? = nil) -> NSAttributedString {
            let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
            mutableAttributedString.addAttribute(NSAttachmentAttributeName, value: attachment, range: attributedStringRange(range))
            return mutableAttributedString as NSAttributedString
        }
    #endif
    
    /// NSURL.
    ///
    /// - Parameters:
    ///   - link: NSURL.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func link(_ link: NSURL, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSLinkAttributeName, value: link, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Offset from baseline, default is 0.
    ///
    /// - Parameters:
    ///   - baselineOffset: Offset from baseline, default is 0.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func baselineOffset(_ baselineOffset: Float, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSBaselineOffsetAttributeName, value: baselineOffset, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor, default nil means same as foreground color.
    ///
    /// - Parameters:
    ///   - underlineColor: UIColor, default nil means same as foreground color.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func underlineColor(_ underlineColor: UIColor, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSUnderlineColorAttributeName, value: underlineColor, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor, default nil means same as foreground color.
    ///
    /// - Parameters:
    ///   - strikethroughColor: UIColor, default nil means same as foreground color.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func strikethroughColor(_ strikethroughColor: UIColor, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSStrikethroughColorAttributeName, value: strikethroughColor, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Skew to be applied to glyphs, default 0 means no skew.
    ///
    /// - Parameters:
    ///   - obliqueness: Skew to be applied to glyphs, default 0 means no skew.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func obliqueness(_ obliqueness: Float, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSObliquenessAttributeName, value: obliqueness, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Log of expansion factor to be applied to glyphs, default 0 means no expansion.
    ///
    /// - Parameters:
    ///   - expansion: Log of expansion factor to be applied to glyphs, default 0 means no expansion.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func expansion(_ expansion: Float, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSExpansionAttributeName, value: expansion, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Array of Int representing the nested levels of writing direction overrides as defined by Unicode LRE, RLE, LRO, and RLO characters.
    /// The control characters can be obtained by masking NSWritingDirection and NSWritingDirectionFormatType values.
    /// Remeber to use `.rawValue`, because the attribute wants an Int.
    /// - LRE: NSWritingDirection.leftToRight, NSWritingDirectionFormatType.embedding.
    /// - RLE: NSWritingDirection.rightToLeft, NSWritingDirectionFormatType.embedding.
    /// - LRO: NSWritingDirection.leftToRight, NSWritingDirectionFormatType.override.
    /// - RLO: NSWritingDirection.rightToLeft, NSWritingDirectionFormatType.override.
    ///
    /// - Parameters:
    ///   - writingDirection: Array of Int representing the nested levels of writing direction overrides as defined by Unicode LRE, RLE, LRO, and RLO characters.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func writingDirection(_ writingDirection: [Int], range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSWritingDirectionAttributeName, value: writingDirection, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// The value 0 indicates horizontal text, the value 1 indicates vertical text.
    /// In iOS, horizontal text is always used and specifying a different value is undefined.
    ///
    /// - Parameters:
    ///   - verticalGlyphForm: The value false indicates horizontal text, the value true indicates vertical text.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func verticalGlyphForm(_ verticalGlyphForm: Bool, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: self.string, attributes: self.attributes())
        mutableAttributedString.addAttribute(NSVerticalGlyphFormAttributeName, value: verticalGlyphForm, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Set text alignment to left.
    ///
    /// - Returns: Returns a NSAttributedString.
    public func textAlignmentLeft() -> NSAttributedString {
        return self.textAlignment(.left)
    }
    
    /// Set text alignment to right.
    ///
    /// - Returns: Returns a NSAttributedString.
    public func textAlignmentRight() -> NSAttributedString {
        return self.textAlignment(.right)
    }
    
    /// Set text alignment to center.
    ///
    /// - Returns: Returns a NSAttributedString.
    public func textAlignmentCenter() -> NSAttributedString {
        return self.textAlignment(.center)
    }
    
    /// Set text alignment to justified.
    ///
    /// - Returns: Returns a NSAttributedString.
    public func textAlignmentJustified() -> NSAttributedString {
        return self.textAlignment(.justified)
    }
    
    /// Returns a list of all string attributes.
    ///
    /// - Returns: Returns a list of all string attributes.
    public func attributes() -> [String: Any] {
        return self.attributes(at: 0, longestEffectiveRange: nil, in: self.attributedStringRange(nil))
    }
    
    /// Set text alignment.
    ///
    /// - Parameter alignment: Text alignment.
    /// - Returns: Returns an NSAttributedString with the given text alignment.
    private func textAlignment(_ alignment: NSTextAlignment) -> NSAttributedString {
        let textAlignment = NSMutableParagraphStyle()
        textAlignment.alignment = alignment
        
        return self.paragraphStyle(textAlignment)
    }
    
    /// Returns self NSRange if the given NSRange is nil.
    ///
    /// - Parameter range: Given NSRange.
    /// - Returns: Returns self NSRange if the given NSRange is nil.
    private func attributedStringRange(_ range: NSRange?) -> NSRange {
        return range ?? NSRange(location: 0, length: self.string.length)
    }
}
