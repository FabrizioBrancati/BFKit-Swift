//
//  UIFont+BFKit.swift
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

// MARK: - Public enums -

public enum FontName : String
{
    case AcademyEngravedLetPlain = "AcademyEngravedLetPlain"
    case AlNile = "AlNile"
    case AlNileBold = "AlNile-Bold"
    case AmericanTypewriter = "AmericanTypewriter"
    case AmericanTypewriterBold = "AmericanTypewriter-Bold"
    case AmericanTypewriterCondensed = "AmericanTypewriter-Condensed"
    case AmericanTypewriterCondensedBold = "AmericanTypewriter-CondensedBold"
    case AmericanTypewriterCondensedLight = "AmericanTypewriter-CondensedLight"
    case AmericanTypewriterLight = "AmericanTypewriter-Light"
    // TODO: Too much fonts too! :_( ... I'll do it! I promise! :)
}

public extension UIFont
{
    // MARK: - Class variables -
    
    public static var lightFont: UIFont
    {
        get
        {
            return self.lightFont
        }
        set(newValue)
        {
            self.lightFont = newValue
        }
    }
    
    public static var regularFont: UIFont
    {
        get
        {
            return self.regularFont
        }
        set(newValue)
        {
            self.regularFont = newValue
        }
    }
    
    public static var boldFont: UIFont
    {
        get
        {
            return self.boldFont
        }
        set(newValue)
        {
            self.boldFont = newValue
        }
    }
    
    // MARK: - Enums -
    
    public enum FamilyFontName : String
    {
        case AcademyEngravedLET = "Academy Engraved LET"
        case AlNile = "Al Nile"
        case AmericanTypewriter = "American Typewriter"
        case AppleColorEmoji = "Apple Color Emoji"
        case AppleSDGothicNeo = "Apple SD Gothic Neo"
        case Arial = "Arial"
        case ArialHebrew = "Arial Hebrew"
        case ArialRoundedMTBold = "Arial Rounded MT Bold"
        case Avenir = "Avenir"
        case AvenirNext = "Avenir Next"
        case AvenirNextCondensed = "Avenir Next Condensed"
        case BanglaSangamMN = "Bangla Sangam MN"
        case Baskerville = "Baskerville"
        case Bodoni72 = "Bodoni 72"
        case Bodoni72Oldstyle = "Bodoni 72 Oldstyle"
        case Bodoni72Smallcaps = "Bodoni 72 Smallcaps"
        case BodoniOrnaments = "Bodoni Ornaments"
        case BradleyHand = "Bradley Hand"
        case ChalkboardSE = "Chalkboard SE"
        case Chalkduster = "Chalkduster"
        case Cochin = "Cochin"
        case Copperplate = "Copperplate"
        case Courier = "Courier"
        case CourierNew = "Courier New"
        case Damascus = "Damascus"
        case DevanagariSangamMN = "Devanagari Sangam MN"
        // TODO: Too much fonts! :(
    }
    
    // MARK: - Init functions -
    
    public convenience init?(fontName: FontName, size: CGFloat)
    {
        self.init(name: fontName.rawValue, size: size)
    }
    
    // MARK: - Class functions -
    
    public static func allFamilyAndFonts() -> Dictionary<String, Array<AnyObject>>
    {
        var fontFamilies: NSMutableArray = NSMutableArray(array: UIFont.familyNames() as NSArray)
        fontFamilies = NSMutableArray.sortArrayByKey("", array: fontFamilies, ascending: true)
        
        var fontFamilyDic: Dictionary<String, Array<AnyObject>> = Dictionary()
        
        for var i = 0; i < fontFamilies.count; i++
        {
            let fontFamily: String = fontFamilies.objectAtIndex(i) as! String
            let fontNames: Array = UIFont.fontNamesForFamilyName(fontFamily)
            fontFamilyDic[fontFamily] = fontNames
        }
        
        BFLog("\(fontFamilyDic)")
        
        return fontFamilyDic
    }
    
    public static func fontsNameForFamilyName(familyFontName: FamilyFontName) -> Array<AnyObject>
    {
        let fontNames: Array = UIFont.fontNamesForFamilyName(familyFontName.rawValue)
        
        BFLog("\(fontNames)")
        
        return fontNames
    }
}
