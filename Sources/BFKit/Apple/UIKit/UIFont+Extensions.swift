//
//  UIFont+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2019 Fabrizio Brancati.
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

// MARK: - Global variables

/// All font names for all family available from iOS 7.0 to iOS 11.0.
@available(*, deprecated, message:"FontName is deprecated and will be removed in future versions of BFKit-Swift.")
public enum FontName: String {
    case academyEngravedLetPlain = "AcademyEngravedLetPlain"
    case alNile = "AlNile"
    case alNileBold = "AlNile-Bold"
    case americanTypewriter = "AmericanTypewriter"
    case americanTypewriterBold = "AmericanTypewriter-Bold"
    case americanTypewriterCondensed = "AmericanTypewriter-Condensed"
    case americanTypewriterCondensedBold = "AmericanTypewriter-CondensedBold"
    case americanTypewriterCondensedLight = "AmericanTypewriter-CondensedLight"
    case americanTypewriterLight = "AmericanTypewriter-Light"
    case americanTypewriterSemiBold = "AmericanTypewriter-SemiBold"
    case appleColorEmoji = "AppleColorEmoji"
    case appleSDGothicNeoBold = "AppleSDGothicNeo-Bold"
    case appleSDGothicNeoLight = "AppleSDGothicNeo-Light"
    case appleSDGothicNeoMedium = "AppleSDGothicNeo-Medium"
    case appleSDGothicNeoRegular = "AppleSDGothicNeo-Regular"
    case appleSDGothicNeoSemiBold = "AppleSDGothicNeo-SemiBold"
    case appleSDGothicNeoThin = "AppleSDGothicNeo-Thin"
    case appleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight"
    case arialBoldItalicMT = "Arial-BoldItalicMT"
    case arialBoldMT = "Arial-BoldMT"
    case arialHebrew = "ArialHebrew"
    case arialHebrewBold = "ArialHebrew-Bold"
    case arialHebrewLight = "ArialHebrew-Light"
    case arialItalicMT = "Arial-ItalicMT"
    case arialMT = "ArialMT"
    case arialRoundedMTBold = "ArialRoundedMTBold"
    case asTHeitiLight = "ASTHeiti-Light"
    case asTHeitiMedium = "ASTHeiti-Medium"
    case avenirBlack = "Avenir-Black"
    case avenirBlackOblique = "Avenir-BlackOblique"
    case avenirBook = "Avenir-Book"
    case avenirBookOblique = "Avenir-BookOblique"
    case avenirHeavy = "Avenir-Heavy"
    case avenirHeavyOblique = "Avenir-HeavyOblique"
    case avenirLight = "Avenir-Light"
    case avenirLightOblique = "Avenir-LightOblique"
    case avenirMedium = "Avenir-Medium"
    case avenirMediumOblique = "Avenir-MediumOblique"
    case avenirNextBold = "AvenirNext-Bold"
    case avenirNextBoldItalic = "AvenirNext-BoldItalic"
    case avenirNextCondensedBold = "AvenirNextCondensed-Bold"
    case avenirNextCondensedBoldItalic = "AvenirNextCondensed-BoldItalic"
    case avenirNextCondensedDemiBold = "AvenirNextCondensed-DemiBold"
    case avenirNextCondensedDemiBoldItalic = "AvenirNextCondensed-DemiBoldItalic"
    case avenirNextCondensedHeavy = "AvenirNextCondensed-Heavy"
    case avenirNextCondensedHeavyItalic = "AvenirNextCondensed-HeavyItalic"
    case avenirNextCondensedItalic = "AvenirNextCondensed-Italic"
    case avenirNextCondensedMedium = "AvenirNextCondensed-Medium"
    case avenirNextCondensedMediumItalic = "AvenirNextCondensed-MediumItalic"
    case avenirNextCondensedRegular = "AvenirNextCondensed-Regular"
    case avenirNextCondensedUltraLight = "AvenirNextCondensed-UltraLight"
    case avenirNextCondensedUltraLightItalic = "AvenirNextCondensed-UltraLightItalic"
    case avenirNextDemiBold = "AvenirNext-DemiBold"
    case avenirNextDemiBoldItalic = "AvenirNext-DemiBoldItalic"
    case avenirNextHeavy = "AvenirNext-Heavy"
    case avenirNextHeavyItalic = "AvenirNext-HeavyItalic"
    case avenirNextItalic = "AvenirNext-Italic"
    case avenirNextMedium = "AvenirNext-Medium"
    case avenirNextMediumItalic = "AvenirNext-MediumItalic"
    case avenirNextRegular = "AvenirNext-Regular"
    case avenirNextUltraLight = "AvenirNext-UltraLight"
    case avenirNextUltraLightItalic = "AvenirNext-UltraLightItalic"
    case avenirOblique = "Avenir-Oblique"
    case avenirRoman = "Avenir-Roman"
    case baskerville = "Baskerville"
    case baskervilleBold = "Baskerville-Bold"
    case baskervilleBoldItalic = "Baskerville-BoldItalic"
    case baskervilleItalic = "Baskerville-Italic"
    case baskervilleSemiBold = "Baskerville-SemiBold"
    case baskervilleSemiBoldItalic = "Baskerville-SemiBoldItalic"
    case bodoniOrnamentsITCTT = "BodoniOrnamentsITCTT"
    case bodoniSvtyTwoITCTTBold = "BodoniSvtyTwoITCTT-Bold"
    case bodoniSvtyTwoITCTTBook = "BodoniSvtyTwoITCTT-Book"
    case bodoniSvtyTwoITCTTBookIta = "BodoniSvtyTwoITCTT-BookIta"
    case bodoniSvtyTwoOSITCTTBold = "BodoniSvtyTwoOSITCTT-Bold"
    case bodoniSvtyTwoOSITCTTBook = "BodoniSvtyTwoOSITCTT-Book"
    case bodoniSvtyTwoOSITCTTBookIt = "BodoniSvtyTwoOSITCTT-BookIt"
    case bodoniSvtyTwoSCITCTTBook = "BodoniSvtyTwoSCITCTT-Book"
    case bradleyHandITCTTBold = "BradleyHandITCTT-Bold"
    case chalkboardSEBold = "ChalkboardSE-Bold"
    case chalkboardSELight = "ChalkboardSE-Light"
    case chalkboardSERegular = "ChalkboardSE-Regular"
    case chalkduster = "Chalkduster"
    case cochin = "Cochin"
    case cochinBold = "Cochin-Bold"
    case cochinBoldItalic = "Cochin-BoldItalic"
    case cochinItalic = "Cochin-Italic"
    case copperplate = "Copperplate"
    case copperplateBold = "Copperplate-Bold"
    case copperplateLight = "Copperplate-Light"
    case courier = "Courier"
    case courierBold = "Courier-Bold"
    case courierBoldOblique = "Courier-BoldOblique"
    case courierNewPSBoldItalicMT = "CourierNewPS-BoldItalicMT"
    case courierNewPSBoldMT = "CourierNewPS-BoldMT"
    case courierNewPSItalicMT = "CourierNewPS-ItalicMT"
    case courierNewPSMT = "CourierNewPSMT"
    case courierOblique = "Courier-Oblique"
    case damascus = "Damascus"
    case dDamascusBold = "DamascusBold"
    case damascusMedium = "DamascusMedium"
    case damascusSemiBold = "DamascusSemiBold"
    case devanagariSangamMN = "DevanagariSangamMN"
    case devanagariSangamMNBold = "DevanagariSangamMN-Bold"
    case didot = "Didot"
    case didotBold = "Didot-Bold"
    case didotItalic = "Didot-Italic"
    case diwanMishafi = "DiwanMishafi"
    case euphemiaUCAS = "EuphemiaUCAS"
    case euphemiaUCASBold = "EuphemiaUCAS-Bold"
    case euphemiaUCASItalic = "EuphemiaUCAS-Italic"
    case farah = "Farah"
    case futuraBold = "Futura-Bold"
    case futuraCondensedExtraBold = "Futura-ExtraBold"
    case futuraCondensedMedium = "Futura-CondensedMedium"
    case futuraMedium = "Futura-Medium"
    case futuraMediumItalic = "Futura-MediumItalic"
    case geezaPro = "GeezaPro"
    case geezaProBold = "GeezaPro-Bold"
    case georgia = "Georgia"
    case georgiaBold = "Georgia-Bold"
    case georgiaBoldItalic = "Georgia-BoldItalic"
    case georgiaItalic = "Georgia-Italic"
    case gillSans = "GillSans"
    case gillSansBold = "GillSans-Bold"
    case gillSansBoldItalic = "GillSans-BoldItalic"
    case gillSansItalic = "GillSans-Italic"
    case gillSansLight = "GillSans-Light"
    case gillSansLightItalic = "GillSans-LightItalic"
    case gillSansSemiBold = "GillSans-SemiBold"
    case gillSansSemiBoldItalic = "GillSans-SemiBoldItalic"
    case gillSansUltraBold = "GillSans-UltraBold"
    case gujaratiSangamMN = "GujaratiSangamMN"
    case gujaratiSangamMNBold = "GujaratiSangamMN-Bold"
    case gurmukhiMN = "GurmukhiMN"
    case gurmukhiMNBold = "GurmukhiMN-Bold"
    case helvetica = "Helvetica"
    case helveticaBold = "Helvetica-Bold"
    case helveticaBoldOblique = "Helvetica-BoldOblique"
    case helveticaLight = "Helvetica-Light"
    case helveticaLightOblique = "Helvetica-LightOblique"
    case helveticaNeue = "HelveticaNeue"
    case helveticaNeueBold = "HelveticaNeue-Bold"
    case helveticaNeueBoldItalic = "HelveticaNeue-BoldItalic"
    case helveticaNeueCondensedBlack = "HelveticaNeue-CondensedBlack"
    case helveticaNeueCondensedBold = "HelveticaNeue-CondensedBold"
    case helveticaNeueItalic = "HelveticaNeue-Italic"
    case helveticaNeueLight = "HelveticaNeue-Light"
    case helveticaNeueLightItalic = "HelveticaNeue-LightItalic"
    case helveticaNeueMedium = "HelveticaNeue-Medium"
    case helveticaNeueMediumItalic = "HelveticaNeue-MediumItalic"
    case helveticaNeueThin = "HelveticaNeue-Thin"
    case helveticaNeueThinItalic = "HelveticaNeue-ThinItalic"
    case helveticaNeueUltraLight = "HelveticaNeue-UltraLight"
    case helveticaNeueUltraLightItalic = "HelveticaNeue-UltraLightItalic"
    case helveticaOblique = "Helvetica-Oblique"
    case hiraginoSansW3 = "HiraginoSans-W3"
    case hiraginoSansW6 = "HiraginoSans-W6"
    case hiraMaruProNW4 = "HiraMaruProN-W4"
    case hiraMinProNW3 = "HiraMinProN-W3"
    case hiraMinProNW6 = "HiraMinProN-W6"
    case hoeflerTextBlack = "HoeflerText-Black"
    case hoeflerTextBlackItalic = "HoeflerText-BlackItalic"
    case hoeflerTextItalic = "HoeflerText-Italic"
    case hoeflerTextRegular = "HoeflerText-Regular"
    case kailasa = "Kailasa"
    case kailasaBold = "Kailasa-Bold"
    case kannadaSangamMN = "KannadaSangamMN"
    case kannadaSangamMNBold = "KannadaSangamMN-Bold"
    case kefaRegular = "Kefa-Regular"
    case khmerSangamMN = "KhmerSangamMN"
    case kohinoorBanglaLight = "KohinoorBangla-Light"
    case kohinoorBanglaRegular = "KohinoorBangla-Regular"
    case kohinoorBanglaSemiBold = "KohinoorBangla-SemiBold"
    case kohinoorDevanagariLight = "KohinoorDevanagari-Light"
    case kohinoorDevanagariRegular = "KohinoorDevanagari-Regular"
    case kohinoorDevanagariSemiBold = "KohinoorDevanagari-SemiBold"
    case kohinoorTeluguLight = "KohinoorTelugu-Light"
    case kohinoorTeluguMedium = "KohinoorTelugu-Medium"
    case kohinoorTeluguRegular = "KohinoorTelugu-Regular"
    case laoSangamMN = "LaoSangamMN"
    case malayalamSangamMN = "MalayalamSangamMN"
    case malayalamSangamMNBold = "MalayalamSangamMN-Bold"
    case markerFeltThin = "MarkerFelt-Thin"
    case markerFeltWide = "MarkerFelt-Wide"
    case menloBold = "Menlo-Bold"
    case menloBoldItalic = "Menlo-BoldItalic"
    case menloItalic = "Menlo-Italic"
    case menloRegular = "Menlo-Regular"
    case myanmarSangamMN = "MyanmarSangamMN"
    case myanmarSangamMNBold = "MyanmarSangamMN-Bold"
    case noteworthyBold = "Noteworthy-Bold"
    case noteworthyLight = "Noteworthy-Light"
    case notoNastaliqUrdu = "NotoNastaliqUrdu"
    case optimaBold = "Optima-Bold"
    case optimaBoldItalic = "Optima-BoldItalic"
    case optimaExtraBlack = "Optima-ExtraBold"
    case optimaItalic = "Optima-Italic"
    case optimaRegular = "Optima-Regular"
    case oriyaSangamMN = "OriyaSangamMN"
    case oriyaSangamMNBold = "OriyaSangamMN-Bold"
    case palatinoBold = "Palatino-Bold"
    case palatinoBoldItalic = "Palatino-BoldItalic"
    case palatinoItalic = "Palatino-Italic"
    case palatinoRoman = "Palatino-Roman"
    case papyrus = "Papyrus"
    case papyrusCondensed = "Papyrus-Condensed"
    case partyLetPlain = "PartyLetPlain"
    case pingFangHKLight = "PingFangHK-Light"
    case pingFangHKMedium = "PingFangHK-Medium"
    case pingFangHKRegular = "PingFangHK-Regular"
    case pingFangHKSemiBold = "PingFangHK-SemiBold"
    case pingFangHKThin = "PingFangHK-Thin"
    case pingFangHKUltraLight = "PingFangHK-UltraLight"
    case pingFangSCLight = "PingFangSC-Light"
    case pingFangSCMedium = "PingFangSC-Medium"
    case pingFangSCRegular = "PingFangSC-Regular"
    case pingFangSCSemiBold = "PingFangSC-SemiBold"
    case pingFangSCThin = "PingFangSC-Thin"
    case pingFangSCUltraLight = "PingFangSC-UltraLight"
    case pingFangTCLight = "PingFangTC-Light"
    case pingFangTCMedium = "PingFangTC-Medium"
    case pingFangTCRegular = "PingFangTC-Regular"
    case pingFangTCSemiBold = "PingFangTC-SemiBold"
    case pingFangTCThin = "PingFangTC-Thin"
    case pingFangTCUltraLight = "PingFangTC-UltraLight"
    case savoyeLetPlain = "SavoyeLetPlain"
    case sinhalaSangamMN = "SinhalaSangamMN"
    case sinhalaSangamMNBold = "SinhalaSangamMN-Bold"
    case snellRoundhand = "SnellRoundhand"
    case snellRoundhandBlack = "SnellRoundhand-Black"
    case snellRoundhandBold = "SnellRoundhand-Bold"
    case stHeitiSCLight = "STHeitiSC-Light"
    case stHeitiSCMedium = "STHeitiSC-Medium"
    case stHeitiTCLight = "STHeitiTC-Light"
    case stHeitiTCMedium = "STHeitiTC-Medium"
    case symbol = "Symbol"
    case tamilSangamMN = "TamilSangamMN"
    case tamilSangamMNBold = "TamilSangamMN-Bold"
    case teluguSangamMN = "TeluguSangamMN"
    case teluguSangamMNBold = "TeluguSangamMN-Bold"
    case thonburi = "Thonburi"
    case thonburiBold = "Thonburi-Bold"
    case thonburiLight = "Thonburi-Light"
    case timesNewRomanPSBoldItalicMT = "TimesNewRomanPS-BoldItalicMT"
    case timesNewRomanPSBoldMT = "TimesNewRomanPS-BoldMT"
    case timesNewRomanPSItalicMT = "TimesNewRomanPS-ItalicMT"
    case timesNewRomanPSMT = "TimesNewRomanPSMT"
    case trebuchetBoldItalic = "Trebuchet-BoldItalic"
    case trebuchetMS = "TrebuchetMS"
    case trebuchetMSBold = "TrebuchetMS-Bold"
    case trebuchetMSItalic = "TrebuchetMS-Italic"
    case verdana = "Verdana"
    case verdanaBold = "Verdana-Bold"
    case verdanaBoldItalic = "Verdana-BoldItalic"
    case verdanaItalic = "Verdana-Italic"
    case zapfDingbatsITC = "ZapfDingbatsITC"
}

// MARK: - UIFont extension

/// This extesion adds some useful functions to UIFont.
public extension UIFont {
    // MARK: - Variables
    
    /// All font family names available from iOS 7.0 to iOS 11.0.
    @available(*, deprecated, message:"FamilyFontName is deprecated and will be removed in future versions of BFKit-Swift.")
    enum FamilyFontName: String {
        case academyEngravedLET = "Academy Engraved LET"
        case alNile = "Al Nile"
        case americanTypewriter = "American Typewriter"
        case appleColorEmoji = "Apple Color Emoji"
        case appleSDGothicNeo = "Apple SD Gothic Neo"
        case arial = "Arial"
        case arialHebrew = "Arial Hebrew"
        case arialRoundedMTBold = "Arial Rounded MT Bold"
        case avenir = "Avenir"
        case avenirNext = "Avenir Next"
        case avenirNextCondensed = "Avenir Next Condensed"
        case banglaSangamMN = "Bangla Sangam MN"
        case baskerville = "Baskerville"
        case bodoni72 = "Bodoni 72"
        case bodoni72Oldstyle = "Bodoni 72 Oldstyle"
        case bodoni72Smallcaps = "Bodoni 72 Smallcaps"
        case bodoniOrnaments = "Bodoni Ornaments"
        case bradleyHand = "Bradley Hand"
        case chalkboardSE = "Chalkboard SE"
        case chalkduster = "Chalkduster"
        case cochin = "Cochin"
        case copperplate = "Copperplate"
        case courier = "Courier"
        case courierNew = "Courier New"
        case damascus = "Damascus"
        case devanagariSangamMN = "Devanagari Sangam MN"
        case didot = "Didot"
        case euphemiaUCAS = "Euphemia UCAS"
        case farah = "Farah"
        case futura = "Futura"
        case geezaPro = "Geeza Pro"
        case georgia = "Georgia"
        case gillSans = "Gill Sans"
        case gujaratiSangamMN = "Gujarati Sangam MN"
        case gurmukhiMN = "Gurmukhi MN"
        case heitiSC = "Heiti SC"
        case heitiTC = "Heiti TC"
        case helvetica = "Helvetica"
        case helveticaNeue = "Helvetica Neue"
        case hiraginoKakuGothicProN = "Hiragino Maru Gothic ProN"
        case hiraginoMinchoProN = "Hiragino Mincho ProN"
        case hiraginoSansW3 = "Hiragino Sans"
        case hoeflerText = "Hoefler Text"
        case kailasa = "Kailasa"
        case kannadaSangamMN = "Kannada Sangam MN"
        case kefa = "Kefa"
        case khmerSangamMN = "Khmer Sangam MN"
        case kohinoorBangla = "Kohinoor Bangla"
        case kohinoorDevanagari = "Kohinoor Devanagari"
        case kohinoorTelugu = "Kohinoor Telugu"
        case laoSangamMN = "Lao Sangam MN"
        case malayalamSangamMN = "Malayalam Sangam MN"
        case markerFelt = "Marker Felt"
        case menlo = "Menlo"
        case mishafi = "Mishafi"
        case myanmarSangamMN = "Myanmar Sangam MN"
        case noteworthy = "Noteworthy"
        case notoNastaliqUrdu = "Noto Nastaliq Urdu"
        case optima = "Optima"
        case oriyaSangamMN = "Oriya Sangam MN"
        case palatino = "Palatino"
        case papyrus = "Papyrus"
        case partyLET = "Party LET"
        case pingFangHK = "PingFang HK"
        case pingFangSC = "PingFang SC"
        case pingFangTC = "PingFang TC"
        case savoyeLET = "Savoye LET"
        case sinhalaSangamMN = "Sinhala Sangam MN"
        case snellRoundhand = "Snell Roundhand"
        case symbol = "Symbol"
        case tamilSangamMN = "Tamil Sangam MN"
        case teluguSangamMN = "Telugu Sangam MN"
        case thonburi = "Thonburi"
        case timesNewRoman = "Times New Roman"
        case trebuchetMS = "Trebuchet MS"
        case verdana = "Verdana"
        case zapfDingbats = "Zapf Dingbats"
        case zapfino = "Zapfino"
    }
    
    // MARK: - Functions
    
    /// Create an UIFont object from the given font name and size, may returns an Helvetica font, if the given font doesn't exist.
    ///
    /// - Parameters:
    ///   - fontName: Font name.
    ///   - size: Size of the font.
    convenience init?(fontName: FontName, size: CGFloat) {
        self.init(name: fontName.rawValue, size: size)
    }
    
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
    
    /// Calculate text height for max width and font.
    ///
    /// - Parameters:
    ///   - width: Max width to fit text.
    ///   - font: Font used in text, from FontName enum.
    ///   - size: Font size.
    ///   - text: Text.
    /// - Returns: Returns calculated height of string within width using given font
    static func calculateHeight(width: CGFloat, font: FontName, fontSize: CGFloat, text: String) -> CGFloat {
        let font = UIFont(fontName: font, size: fontSize) ?? UIFont()
        return calculateHeight(width: width, font: font, text: text)
    }
    
    /// Print in console all font names for a given family.
    ///
    /// - Parameter familyFontName: Family fonts.
    /// - Returns: Returns all fonts for the given family.
    static func fontNames(for family: FamilyFontName) -> [Any] {
        UIFont.fontNames(forFamilyName: family.rawValue)
    }
}
