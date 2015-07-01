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
    case AppleColorEmoji = "AppleColorEmoji"
    case AppleSDGothicNeoBold = "AppleSDGothicNeo-Bold"
    case AppleSDGothicNeoLight = "AppleSDGothicNeo-Light"
    case AppleSDGothicNeoMedium = "AppleSDGothicNeo-Medium"
    case AppleSDGothicNeoRegular = "AppleSDGothicNeo-Regular"
    case AppleSDGothicNeoSemiBold = "AppleSDGothicNeo-SemiBold"
    case AppleSDGothicNeoThin = "AppleSDGothicNeo-Thin"
    @availability(iOS, introduced=9.0) case AppleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight"
    case ArialBoldItalicMT = "Arial-BoldItalicMT"
    case ArialBoldMT = "Arial-BoldMT"
    case ArialHebrew = "ArialHebrew"
    case ArialHebrewBold = "ArialHebrew-Bold"
    case ArialHebrewLight = "ArialHebrew-Light"
    case ArialItalicMT = "Arial-ItalicMT"
    case ArialMT = "ArialMT"
    case ArialRoundedMTBold = "ArialRoundedMTBold"
    case ASTHeitiLight = "ASTHeiti-Light"
    case ASTHeitiMedium = "ASTHeiti-Medium"
    case AvenirBlack = "Avenir-Black"
    case AvenirBlackOblique = "Avenir-BlackOblique"
    case AvenirBook = "Avenir-Book"
    case AvenirBookOblique = "Avenir-BookOblique"
    case AvenirHeavyOblique = "Avenir-HeavyOblique"
    case AvenirHeavy = "Avenir-Heavy"
    case AvenirLight = "Avenir-Light"
    case AvenirLightOblique = "Avenir-LightOblique"
    case AvenirMedium = "Avenir-Medium"
    case AvenirMediumOblique = "Avenir-MediumOblique"
    case AvenirNextBold = "AvenirNext-Bold"
    case AvenirNextBoldItalic = "AvenirNext-BoldItalic"
    case AvenirNextCondensedBold = "AvenirNextCondensed-Bold"
    case AvenirNextCondensedBoldItalic = "AvenirNextCondensed-BoldItalic"
    case AvenirNextCondensedDemiBold = "AvenirNextCondensed-DemiBold"
    case AvenirNextCondensedDemiBoldItalic = "AvenirNextCondensed-DemiBoldItalic"
    case AvenirNextCondensedHeavy = "AvenirNextCondensed-Heavy"
    case AvenirNextCondensedHeavyItalic = "AvenirNextCondensed-HeavyItalic"
    case AvenirNextCondensedItalic = "AvenirNextCondensed-Italic"
    case AvenirNextCondensedMedium = "AvenirNextCondensed-Medium"
    case AvenirNextCondensedMediumItalic = "AvenirNextCondensed-MediumItalic"
    case AvenirNextCondensedRegular = "AvenirNextCondensed-Regular"
    case AvenirNextCondensedUltraLight = "AvenirNextCondensed-UltraLight"
    case AvenirNextCondensedUltraLightItalic = "AvenirNextCondensed-UltraLightItalic"
    case AvenirNextDemiBold = "AvenirNext-DemiBold"
    case AvenirNextDemiBoldItalic = "AvenirNext-DemiBoldItalic"
    case AvenirNextHeavy = "AvenirNext-Heavy"
    case AvenirNextItalic = "AvenirNext-Italic"
    case AvenirNextMedium = "AvenirNext-Medium"
    case AvenirNextMediumItalic = "AvenirNext-MediumItalic"
    case AvenirNextRegular = "AvenirNext-Regular"
    case AvenirNextUltraLight = "AvenirNext-UltraLight"
    case AvenirNextUltraLightItalic = "AvenirNext-UltraLightItalic"
    case AvenirOblique = "Avenir-Oblique"
    case AvenirRoman = "Avenir-Roman"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case BanglaSangamMN = "BanglaSangamMN"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case BanglaSangamMNBold = "BanglaSangamMN-Bold"
    case Baskerville = "Baskerville"
    case BaskervilleBold = "Baskerville-Bold"
    case BaskervilleBoldItalic = "Baskerville-BoldItalic"
    case BaskervilleItalic = "Baskerville-Italic"
    case BaskervilleSemiBold = "Baskerville-SemiBold"
    case BaskervilleSemiBoldItalic = "Baskerville-SemiBoldItalic"
    case BodoniOrnamentsITCTT = "BodoniOrnamentsITCTT"
    case BodoniSvtyTwoITCTTBold = "BodoniSvtyTwoITCTT-Bold"
    case BodoniSvtyTwoITCTTBook = "BodoniSvtyTwoITCTT-Book"
    case BodoniSvtyTwoITCTTBookIta = "BodoniSvtyTwoITCTT-BookIta"
    case BodoniSvtyTwoOSITCTTBold = "BodoniSvtyTwoOSITCTT-Bold"
    case BodoniSvtyTwoOSITCTTBook = "BodoniSvtyTwoOSITCTT-Book"
    case BodoniSvtyTwoOSITCTTBookIt = "BodoniSvtyTwoOSITCTT-BookIt"
    case BodoniSvtyTwoSCITCTTBook = "BodoniSvtyTwoSCITCTT-Book"
    case BradleyHandITCTTBold = "BradleyHandITCTT-Bold"
    case ChalkboardSEBold = "ChalkboardSE-Bold"
    case ChalkboardSELight = "ChalkboardSE-Light"
    case ChalkboardSERegular = "ChalkboardSE-Regular"
    case Chalkduster = "Chalkduster"
    case Cochin = "Cochin"
    case CochinBold = "Cochin-Bold"
    case CochinBoldItalic = "Cochin-BoldItalic"
    case CochinItalic = "Cochin-Italic"
    case Copperplate = "Copperplate"
    case CopperplateBold = "Copperplate-Bold"
    case CopperplateLight = "Copperplate-Light"
    case Courier = "Courier"
    case CourierBold = "Courier-Bold"
    case CourierBoldOblique = "Courier-BoldOblique"
    case CourierNewPSBoldItalicMT = "CourierNewPS-BoldItalicMT"
    case CourierNewPSBoldMT = "CourierNewPS-BoldMT"
    case CourierNewPSItalicMT = "CourierNewPS-ItalicMT"
    case CourierNewPSMT = "CourierNewPSMT"
    case CourierOblique = "Courier-Oblique"
    case Damascus = "Damascus"
    case DamascusBold = "DamascusBold"
    case DamascusMedium = "DamascusMedium"
    case DamascusSemiBold = "DamascusSemiBold"
    case DevanagariSangamMN = "DevanagariSangamMN"
    case DevanagariSangamMNBold = "DevanagariSangamMN-Bold"
    case Didot = "Didot"
    case DidotBold = "Didot-Bold"
    case DidotItalic = "Didot-Italic"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case DINAlternateBold = "DINAlternate-Bold"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case DINCondensedBold = "DINCondensed-Bold"
    case DiwanMishafi = "DiwanMishafi"
    case EuphemiaUCAS = "EuphemiaUCAS"
    case EuphemiaUCASBold = "EuphemiaUCAS-Bold"
    case EuphemiaUCASItalic = "EuphemiaUCAS-Italic"
    case Farah = "Farah"
    case FuturaCondensedExtraBold = "Futura-ExtraBold"
    case FuturaCondensedMedium = "Futura-CondensedMedium"
    case FuturaMedium = "Futura-Medium"
    case FuturaMediumItalicm = "Futura-MediumItalic"
    case GeezaPro = "GeezaPro"
    case GeezaProBold = "GeezaPro-Bold"
    case GeezaProLight = "GeezaPro-Light"
    case Georgia = "Georgia"
    case GeorgiaBold = "Georgia-Bold"
    case GeorgiaBoldItalic = "Georgia-BoldItalic"
    case GeorgiaItalic = "Georgia-Italic"
    case GillSans = "GillSans"
    case GillSansBold = "GillSans-Bold"
    case GillSansBoldItalic = "GillSans-BoldItalic"
    case GillSansItalic = "GillSans-Italic"
    case GillSansLight = "GillSans-Light"
    case GillSansLightItalic = "GillSans-LightItalic"
    case GujaratiSangamMN = "GujaratiSangamMN"
    case GujaratiSangamMNBold = "GujaratiSangamMN-Bold"
    case GurmukhiMN = "GurmukhiMN"
    case GurmukhiMNBold = "GurmukhiMN-Bold"
    case Helvetica = "Helvetica"
    case HelveticaBold = "Helvetica-Bold"
    case HelveticaBoldOblique = "Helvetica-BoldOblique"
    case HelveticaLight = "Helvetica-Light"
    case HelveticaLightOblique = "Helvetica-LightOblique"
    case HelveticaNeue = "HelveticaNeue"
    case HelveticaNeueBold = "HelveticaNeue-Bold"
    case HelveticaNeueBoldItalic = "HelveticaNeue-BoldItalic"
    case HelveticaNeueCondensedBlack = "HelveticaNeue-CondensedBlack"
    case HelveticaNeueCondensedBold = "HelveticaNeue-CondensedBold"
    case HelveticaNeueItalic = "HelveticaNeue-Italic"
    case HelveticaNeueLight = "HelveticaNeue-Light"
    case HelveticaNeueMedium = "HelveticaNeue-Medium"
    case HelveticaNeueMediumItalic = "HelveticaNeue-MediumItalic"
    case HelveticaNeueThin = "HelveticaNeue-Thin"
    case HelveticaNeueThinItalic = "HelveticaNeue-ThinItalic"
    case HelveticaNeueUltraLight = "HelveticaNeue-UltraLight"
    case HelveticaNeueUltraLightItalic = "HelveticaNeue-UltraLightItalic"
    case HelveticaOblique = "Helvetica-Oblique"
    case HiraKakuProNW3 = "HiraKakuProN-W3"
    case HiraKakuProNW6 = "HiraKakuProN-W6"
    case HiraMinProNW3 = "HiraMinProN-W3"
    case HiraMinProNW6 = "HiraMinProN-W6"
    case HoeflerTextBlack = "HoeflerText-Black"
    case HoeflerTextBlackItalic = "HoeflerText-BlackItalic"
    case HoeflerTextItalic = "HoeflerText-Italic"
    case HoeflerTextRegular = "HoeflerText-Regular"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case IowanOldStyleBold = "IowanOldStyle-Bold"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case IowanOldStyleBoldItalic = "IowanOldStyle-BoldItalic"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case IowanOldStyleItalic = "IowanOldStyle-Italic"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case IowanOldStyleRoman = "IowanOldStyle-Roman"
    case Kailasa = "Kailasa"
    case KailasaBold = "Kailasa-Bold"
    case KannadaSangamMN = "KannadaSangamMN"
    case KannadaSangamMNBold = "KannadaSangamMN-Bold"
    @availability(iOS, introduced=8.0) case KhmerSangamMN = "KhmerSangamMN"
    @availability(iOS, introduced=9.0) case KohinoorBanglaLight = "KohinoorBangla-Light"
    @availability(iOS, introduced=9.0) case KohinoorBanglaMedium = "KohinoorBangla-Medium"
    @availability(iOS, introduced=9.0) case KohinoorBanglaRegular = "KohinoorBangla-Regular"
    @availability(iOS, introduced=8.0) case KohinoorDevanagariLight = "KohinoorDevanagari-Light"
    @availability(iOS, introduced=8.0) case KohinoorDevanagariMedium = "KohinoorDevanagari-Medium"
    @availability(iOS, introduced=8.0) case KohinoorDevanagariBook = "KohinoorDevanagari-Book"
    @availability(iOS, introduced=8.0) case LaoSangamMN = "LaoSangamMN"
    case MalayalamSangamMN = "MalayalamSangamMN"
    case MalayalamSangamMNBold = "MalayalamSangamMN-Bold"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case MarionBold = "Marion-Bold"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case MarionItalic = "Marion-Italic"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case MarionRegular = "Marion-Regular"
    case MarkerFeltThin = "MarkerFelt-Thin"
    case MarkerFeltWide = "MarkerFelt-Wide"
    case MenloBold = "Menlo-Bold"
    case MenloBoldItalic = "Menlo-BoldItalic"
    case MenloItalic = "Menlo-Italic"
    case MenloRegular = "Menlo-Regular"
    case NoteworthyBold = "Noteworthy-Bold"
    case NoteworthyLight = "Noteworthy-Light"
    case OptimaBold = "Optima-Bold"
    case OptimaBoldItalic = "Optima-BoldItalic"
    case OptimaExtraBlack = "Optima-ExtraBold"
    case OptimaItalic = "Optima-Italic"
    case OptimaRegular = "Optima-Regular"
    case OriyaSangamMN = "OriyaSangamMN"
    case OriyaSangamMNBold = "OriyaSangamMN-Bold"
    case PalatinoBold = "Palatino-Bold"
    case PalatinoBoldItalic = "Palatino-BoldItalic"
    case PalatinoItalic = "Palatino-Italic"
    case PalatinoRoman = "Palatino-Roman"
    case Papyrus = "Papyrus"
    case PapyrusCondensed = "Papyrus-Condensed"
    case PartyLetPlain = "PartyLetPlain"
    case SavoyeLetPlain = "SavoyeLetPlain"
    case SinhalaSangamMN = "SinhalaSangamMN"
    case SinhalaSangamMNBold = "SinhalaSangamMN-Bold"
    case SnellRoundhand = "SnellRoundhand"
    case SnellRoundhandBlack = "SnellRoundhand-Black"
    case SnellRoundhandBold = "SnellRoundhand-Bold"
    case STHeitiSCLight = "STHeitiSC-Light"
    case STHeitiSCMedium = "STHeitiSC-Medium"
    case STHeitiTCLight = "STHeitiTC-Light"
    case STHeitiTCMedium = "STHeitiTC-Medium"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case SuperclarendonBlack = "Superclarendon-Black"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case SuperclarendonBlackItalic = "Superclarendon-BalckItalic"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case SuperclarendonBold = "Superclarendon-Bold"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case SuperclarendonBoldItalic = "Superclarendon-BoldItalic"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case SuperclarendonItalic = "Superclarendon-Italic"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case SuperclarendonLight = "Superclarendon-Light"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case SuperclarendonLightItalic = "Superclarendon-LightItalic"
    @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case SuperclarendonRegular = "Superclarendon-Regular"
    case Symbol = "Symbol"
    case TamilSangamMN = "TamilSangamMN"
    case TamilSangamMNBold = "TamilSangamMN-Bold"
    case TeluguSangamMN = "TeluguSangamMN"
    case TeluguSangamMNBold = "TeluguSangamMN-Bold"
    case Thonburi = "Thonburi"
    case ThonburiBold = "Thonburi-Bold"
    case ThonburiLight = "Thonburi-Light"
    case TimesNewRomanPSBoldItalicMT = "TimesNewRomanPS-BoldItalic"
    case TimesNewRomanPSBoldMT = "TimesNewRomanPS-Bold"
    case TimesNewRomanPSItalicMT = "TimesNewRomanPS-ItalicMT"
    case TimesNewRomanPSMT = "TimesNewRomanPSMT"
    case TrebuchetBoldItalic = "Trebuchet-BoldItalic"
    case TrebuchetMS = "TrebuchetMS"
    case TrebuchetMSBold = "TrebuchetMS-Bold"
    case TrebuchetMSItalic = "TrebuchetMS-Italic"
    case Verdana = "Verdana"
    case VerdanaBold = "Verdana-Bold"
    case VerdanaBoldItalic = "Verdana-BoldItalic"
    case VerdanaItalic = "Verdana-Italic"
}

public extension UIFont
{
    // MARK: - Class variables -
    
    public static var lightFont: UIFont
    {
        get
        {
            return UIFont.lightFont
        }
        set(newValue)
        {
            UIFont.lightFont = newValue
        }
    }
    
    public static var regularFont: UIFont
    {
        get
        {
            return UIFont.regularFont
        }
        set(newValue)
        {
            UIFont.regularFont = newValue
        }
    }
    
    public static var boldFont: UIFont
    {
        get
        {
            return UIFont.boldFont
        }
        set(newValue)
        {
            UIFont.boldFont = newValue
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
        @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case BanglaSangamMN = "Bangla Sangam MN"
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
        case Didot = "Didot"
        @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case DINAlternate = "DIN Alternate"
        @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8") case DINCondensed = "DIN Condensed"
        case EuphemiaUCAS = "Euphemia UCAS"
        case Farah = "Farah"
        case Futura = "Futura"
        case GeezaPro = "Geeza Pro"
        case Georgia = "Georgia"
        case GillSans = "Gill Sans"
        case GujaratiSangamMN = "Gujarati Sangam MN"
        case GurmukhiMN = "Gurmukhi MN"
        case HeitiSC = "Heiti SC"
        case HeitiTC = "Heiti TC"
        case Helvetica = "Helvetica"
        case HelveticaNeue = "Helvetica Neue"
        case HiraginoKakuGothicProN = "Hiragino Kaku Gothic ProN"
        case HiraginoMinchoProN = "Hiragino Mincho ProN"
        case HoeflerText = "Hoefler Text"
        @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")case IowanOldStyle = "Iowan Old Style"
        case Kailasa = "Kailasa"
        case KannadaSangamMN = "Kannada Sangam MN"
        @availability(iOS, introduced=8.0) case KhmerSangamMN = "Khmer Sangam MN"
        @availability(iOS, introduced=9.0) case KohinoorBangla = "Kohinoor Bangla"
        @availability(iOS, introduced=8.0) case KohinoorDevanagari = "Kohinoor Devanagari"
        @availability(iOS, introduced=8.0) case LaoSangamMN = "Lao Sangam MN"
        case MalayalamSangamMN = "Malayalam Sangam MN"
        @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")case Marion = "Marion"
        case MarkerFelt = "Marker Felt"
        case Menlo = "Menlo"
        case Mishafi = "Mishafi"
        case Noteworthy = "Noteworthy"
        case Optima = "Optima"
        case OriyaSangamMN = "Oriya Sangam MN"
        case Palatino = "Palatino"
        case Papyrus = "Papyrus"
        case PartyLET = "Party LET"
        case SavoyeLET = "Savoye LET"
        case SinhalaSangamMN = "Sinhala Sangam MN"
        case SnellRoundhand = "Snell Roundhand"
        @availability(iOS, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")case Superclarendon = "Superclarendon"
        case Symbol = "Symbol"
        case TamilSangamMN = "Tamil Sangam MN"
        case TeluguSangamMN = "Telugu Sangam MN"
        case Thonburi = "Thonburi"
        case TimesNewRoman = "Times New Roman"
        case TrebuchetMS = "Trebuchet MS"
        case Verdana = "Verdana"
        case ZapfDingbats = "Zapf Dingbats"
        case Zapfino = "Zapfino"
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
