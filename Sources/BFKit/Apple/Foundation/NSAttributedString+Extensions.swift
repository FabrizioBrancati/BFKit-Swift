//
//  NSAttributedString+Extensions.swift
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
#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

// MARK: - NSAttributedString extension

/// This extension adds some useful functions to NSAttributedString.
public extension NSAttributedString {
    /// UIFont or NSFont, default Helvetica(Neue) 12.
    ///
    /// - Parameters:
    ///   - font: UIFont or NSFont, default Helvetica(Neue) 12.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func font(_ font: Font, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.font, value: font, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// NSParagraphStyle, default defaultParagraphStyle
    ///
    /// - Parameters:
    ///   - paragraphStyle: NSParagraphStyle, default defaultParagraphStyle
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func paragraphStyle(_ paragraphStyle: NSParagraphStyle, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor or NSColor, default black.
    ///
    /// - Parameters:
    ///   - foregroundColor: UIColor or NSColor, default black.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func foregroundColor(_ foregroundColor: Color, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: foregroundColor, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor or NSColor, default nil means no background.
    ///
    /// - Parameters:
    ///   - backgroundColor: UIColor or NSColor, default nil means no background.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func backgroundColor(_ backgroundColor: Color, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.backgroundColor, value: backgroundColor, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Default true means default ligatures, false means no ligatures.
    ///
    /// - Parameters:
    ///   - ligature: Default true means default ligatures, false means no ligatures.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func ligature(_ ligature: Bool, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.ligature, value: ligature, range: attributedStringRange(range))
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
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.kern, value: kern, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Default 0 means no strikethrough.
    ///
    /// - Parameters:
    ///   - strikethroughStyle: Default 0 means no strikethrough.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func strikethroughStyle(_ strikethroughStyle: Int, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: strikethroughStyle, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// NSUnderlineStyle.
    ///
    /// - Parameters:
    ///   - underlineStyle: NSUnderlineStyle.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func underlineStyle(_ underlineStyle: NSUnderlineStyle, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: underlineStyle, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor or NSColor, default nil means same as foreground color.
    ///
    /// - Parameters:
    ///   - strokeColor: UIColor or NSColor, default nil means same as foreground color.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func strokeColor(_ strokeColor: Color, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.strokeColor, value: strokeColor, range: attributedStringRange(range))
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
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.strokeWidth, value: strokeWidth, range: attributedStringRange(range))
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
            let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
            mutableAttributedString.addAttribute(NSAttributedStringKey.shadow, value: shadow, range: attributedStringRange(range))
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
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.textEffect, value: textEffect, range: attributedStringRange(range))
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
            let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
            mutableAttributedString.addAttribute(NSAttributedStringKey.attachment, value: attachment, range: attributedStringRange(range))
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
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.link, value: link, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Offset from baseline, default is 0.
    ///
    /// - Parameters:
    ///   - baselineOffset: Offset from baseline, default is 0.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func baselineOffset(_ baselineOffset: Float, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.baselineOffset, value: baselineOffset, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor or NSColor, default nil means same as foreground color.
    ///
    /// - Parameters:
    ///   - underlineColor: UIColor or NSColor, default nil means same as foreground color.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func underlineColor(_ underlineColor: Color, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.underlineColor, value: underlineColor, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// UIColor or NSColor, default nil means same as foreground color.
    ///
    /// - Parameters:
    ///   - strikethroughColor: UIColor or NSColor, default nil means same as foreground color.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func strikethroughColor(_ strikethroughColor: Color, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.strikethroughColor, value: strikethroughColor, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Skew to be applied to glyphs, default 0 means no skew.
    ///
    /// - Parameters:
    ///   - obliqueness: Skew to be applied to glyphs, default 0 means no skew.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func obliqueness(_ obliqueness: Float, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.obliqueness, value: obliqueness, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Log of expansion factor to be applied to glyphs, default 0 means no expansion.
    ///
    /// - Parameters:
    ///   - expansion: Log of expansion factor to be applied to glyphs, default 0 means no expansion.
    ///   - range: Application range. Default is all the String.
    /// - Returns: Returns a NSAttributedString.
    public func expansion(_ expansion: Float, range: NSRange? = nil) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.expansion, value: expansion, range: attributedStringRange(range))
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
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.writingDirection, value: writingDirection, range: attributedStringRange(range))
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
        let mutableAttributedString = NSMutableAttributedString(string: string, attributes: attributes())
        mutableAttributedString.addAttribute(NSAttributedStringKey.verticalGlyphForm, value: verticalGlyphForm, range: attributedStringRange(range))
        return mutableAttributedString as NSAttributedString
    }
    
    /// Set text alignment to left.
    ///
    /// - Returns: Returns a NSAttributedString.
    public func textAlignmentLeft() -> NSAttributedString {
        return textAlignment(.left)
    }
    
    /// Set text alignment to right.
    ///
    /// - Returns: Returns a NSAttributedString.
    public func textAlignmentRight() -> NSAttributedString {
        return textAlignment(.right)
    }
    
    /// Set text alignment to center.
    ///
    /// - Returns: Returns a NSAttributedString.
    public func textAlignmentCenter() -> NSAttributedString {
        return textAlignment(.center)
    }
    
    /// Set text alignment to justified.
    ///
    /// - Returns: Returns a NSAttributedString.
    public func textAlignmentJustified() -> NSAttributedString {
        return textAlignment(.justified)
    }
    
    /// Returns a list of all string attributes.
    ///
    /// - Returns: Returns a list of all string attributes.
    public func attributes() -> [NSAttributedStringKey: Any] {
        return attributes(at: 0, longestEffectiveRange: nil, in: attributedStringRange(nil))
    }
    
    /// Set text alignment.
    ///
    /// - Parameter alignment: Text alignment.
    /// - Returns: Returns an NSAttributedString with the given text alignment.
    private func textAlignment(_ alignment: NSTextAlignment) -> NSAttributedString {
        let textAlignment = NSMutableParagraphStyle()
        textAlignment.alignment = alignment
        
        return paragraphStyle(textAlignment)
    }
    
    /// Returns self NSRange if the given NSRange is nil.
    ///
    /// - Parameter range: Given NSRange.
    /// - Returns: Returns self NSRange if the given NSRange is nil.
    private func attributedStringRange(_ range: NSRange?) -> NSRange {
        return range ?? NSRange(location: 0, length: string.count)
    }
}
