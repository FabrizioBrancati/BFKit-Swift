//
//  UIFont+BFKit.swift
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

// MARK: - Public enums -

/**
 All font names for all family available from iOS 7.0 to iOS 9.0

 - AcademyEngravedLetPlain:             Academy Engraved Let Plain
 - AlNile:                              Al Nile
 - AlNileBold:                          Al Nile Bold
 - AmericanTypewriter:                  American Typewriter
 - AmericanTypewriterBold:              American Typewriter Bold
 - AmericanTypewriterCondensed:         American Typewriter Condensed
 - AmericanTypewriterCondensedBold:     American Typewriter Condensed Bold
 - AmericanTypewriterCondensedLight:    American Typewriter Condensed Light
 - AmericanTypewriterLight:             American Typewriter Light
 - AppleColorEmoji:                     Apple Color Emoji
 - AppleSDGothicNeoBold:                Apple SD Gothic Neo Bold
 - AppleSDGothicNeoLight:               Apple SD Gothic Neo Light
 - AppleSDGothicNeoMedium:              Apple SD Gothic Neo Medium
 - AppleSDGothicNeoRegular:             Apple SD Gothic Neo Regular
 - AppleSDGothicNeoSemiBold:            Apple SD Gothic Neo Semi Bold
 - AppleSDGothicNeoThin:                Apple SD Gothic Neo Thin
 - ArialBoldItalicMT:                   Arial Bold Italic MT
 - ArialBoldMT:                         Arial Bold MT
 - ArialHebrew:                         Arial Hebrew
 - ArialHebrewBold:                     Arial Hebrew Bold
 - ArialHebrewLight:                    Arial Hebrew Light
 - ArialItalicMT:                       Arial Italic MT
 - ArialMT:                             Arial MT
 - ArialRoundedMTBold:                  Arial Rounded MT Bold
 - ASTHeitiLight:                       AST Heiti Light
 - ASTHeitiMedium:                      AST Heiti Medium
 - AvenirBlack:                         Avenir Black
 - AvenirBlackOblique:                  Avenir Black Oblique
 - AvenirBook:                          Avenir Book
 - AvenirBookOblique:                   Avenir Book Oblique
 - AvenirHeavyOblique:                  Avenir Heavy Oblique
 - AvenirHeavy:                         Avenir Heavy
 - AvenirLight:                         Avenir Light
 - AvenirLightOblique:                  Avenir Light Oblique
 - AvenirMedium:                        Avenir Medium
 - AvenirMediumOblique:                 Avenir Medium Oblique
 - AvenirNextBold:                      Avenir Next Bold
 - AvenirNextBoldItalic:                Avenir Next Bold Italic
 - AvenirNextCondensedBold:             Avenir Next Condensed Bold
 - AvenirNextCondensedBoldItalic:       Avenir Next Condensed Bold Italic
 - AvenirNextCondensedDemiBold:         Avenir Next Condensed Demi Bold
 - AvenirNextCondensedDemiBoldItalic:   Avenir Next Condensed Demi Bold Italic
 - AvenirNextCondensedHeavy:            Avenir Next Condensed Heavy
 - AvenirNextCondensedHeavyItalic:      Avenir Next Condensed Heavy Italic
 - AvenirNextCondensedItalic:           Avenir Next Condensed Italic
 - AvenirNextCondensedMedium:           Avenir Next Condensed Medium
 - AvenirNextCondensedMediumItalic:     Avenir Next Condensed Medium Italic
 - AvenirNextCondensedRegular:          Avenir Next Condensed Regular
 - AvenirNextCondensedUltraLight:       Avenir Next Condensed Ultra Light
 - AvenirNextCondensedUltraLightItalic: Avenir Next Condensed Ultra Light Italic
 - AvenirNextDemiBold:                  Avenir Next Demi Bold
 - AvenirNextDemiBoldItalic:            Avenir Next Demi Bold Italic
 - AvenirNextHeavy:                     Avenir Next Heavy
 - AvenirNextItalic:                    Avenir Next Italic
 - AvenirNextMedium:                    Avenir Next Medium
 - AvenirNextMediumItalic:              Avenir Next Medium Italic
 - AvenirNextRegular:                   Avenir Next Regular
 - AvenirNextUltraLight:                Avenir Next Ultra Light
 - AvenirNextUltraLightItalic:          Avenir Next Ultra Light Italic
 - AvenirOblique:                       Avenir Oblique
 - AvenirRoman:                         Avenir Roman
 - Baskerville:                         Baskerville
 - BaskervilleBold:                     Baskerville Bold
 - BaskervilleBoldItalic:               Baskerville Bold Italic
 - BaskervilleItalic:                   Baskerville Italic
 - BaskervilleSemiBold:                 Baskerville Semi Bold
 - BaskervilleSemiBoldItalic:           Baskerville Semi Bold Italic
 - BodoniOrnamentsITCTT:                Bodoni Ornaments ITCTT
 - BodoniSvtyTwoITCTTBold:              Bodoni Svty Two ITCTT Bold
 - BodoniSvtyTwoITCTTBook:              Bodoni Svty Two ITCTT Book
 - BodoniSvtyTwoITCTTBookIta:           Bodoni Svty Two ITCTT Book Ita
 - BodoniSvtyTwoOSITCTTBold:            Bodoni Svty Two OS ITCTT Bold
 - BodoniSvtyTwoOSITCTTBook:            Bodoni Svty Two OS ITCTT Book
 - BodoniSvtyTwoOSITCTTBookIt:          Bodoni Svty Two OS ITCTT Book It
 - BodoniSvtyTwoSCITCTTBook:            Bodoni Svty Two SC ITCTT Book
 - BradleyHandITCTTBold:                Bradley Hand ITCTT Bold
 - ChalkboardSEBold:                    Chalkboard SE Bold
 - ChalkboardSELight:                   Chalkboard SE Light
 - ChalkboardSERegular:                 Chalkboard SE Regular
 - Chalkduster:                         Chalkduster
 - Cochin:                              Cochin
 - CochinBold:                          Cochin Bold
 - CochinBoldItalic:                    Cochin Bold Italic
 - CochinItalic:                        Cochin Italic
 - Copperplate:                         Copperplate
 - CopperplateBold:                     Copperplate Bold
 - CopperplateLight:                    Copperplate Light
 - Courier:                             Courier
 - CourierBold:                         Courier Bold
 - CourierBoldOblique:                  Courier Bold Oblique
 - CourierNewPSBoldItalicMT:            Courier New PS Bold Italic MT
 - CourierNewPSBoldMT:                  Courier New PS Bold MT
 - CourierNewPSItalicMT:                Courier New PS Italic MT
 - CourierNewPSMT:                      Courier New PS MT
 - CourierOblique:                      Courier Oblique
 - Damascus:                            Damascus
 - DamascusBold:                        Damascus Bold
 - DamascusMedium:                      Damascus Medium
 - DamascusSemiBold:                    Damascus Semi Bold
 - DevanagariSangamMN:                  Devanagari Sangam MN
 - DevanagariSangamMNBold:              Devanagari Sangam MN Bold
 - Didot:                               Didot
 - DidotBold:                           Didot Bold
 - DidotItalic:                         Didot Italic
 - DiwanMishafi:                        Diwan Mishafi
 - EuphemiaUCAS:                        Euphemia UCAS
 - EuphemiaUCASBold:                    Euphemia UCAS Bold
 - EuphemiaUCASItalic:                  Euphemia UCAS Italic
 - Farah:                               Farah
 - FuturaCondensedExtraBold:            Futura Condensed Extra Bold
 - FuturaCondensedMedium:               Futura Condensed Medium
 - FuturaMedium:                        Futura Medium
 - FuturaMediumItalicm:                 Futura Medium Italicm
 - GeezaPro:                            Geeza Pro
 - GeezaProBold:                        Geeza Pro Bold
 - GeezaProLight:                       Geeza Pro Light
 - Georgia:                             Georgia
 - GeorgiaBold:                         Georgia Bold
 - GeorgiaBoldItalic:                   Georgia Bold Italic
 - GeorgiaItalic:                       Georgia Italic
 - GillSans:                            Gill Sans
 - GillSansBold:                        Gill Sans Bold
 - GillSansBoldItalic:                  Gill Sans Bold Italic
 - GillSansItalic:                      Gill Sans Italic
 - GillSansLight:                       Gill Sans Light
 - GillSansLightItalic:                 Gill Sans Light Italic
 - GujaratiSangamMN:                    Gujarati Sangam MN
 - GujaratiSangamMNBold:                Gujarati Sangam MN Bold
 - GurmukhiMN:                          Gurmukhi MN
 - GurmukhiMNBold:                      Gurmukhi MN Bold
 - Helvetica:                           Helvetica
 - HelveticaBold:                       Helvetica Bold
 - HelveticaBoldOblique:                Helvetica Bold Oblique
 - HelveticaLight:                      Helvetica Light
 - HelveticaLightOblique:               Helvetica Light Oblique
 - HelveticaNeue:                       Helvetica Neue
 - HelveticaNeueBold:                   Helvetica Neue Bold
 - HelveticaNeueBoldItalic:             Helvetica Neue Bold Italic
 - HelveticaNeueCondensedBlack:         Helvetica Neue Condensed Black
 - HelveticaNeueCondensedBold:          Helvetica Neue Condensed Bold
 - HelveticaNeueItalic:                 Helvetica Neue Italic
 - HelveticaNeueLight:                  Helvetica Neue Light
 - HelveticaNeueMedium:                 Helvetica Neue Medium
 - HelveticaNeueMediumItalic:           Helvetica Neue Medium Italic
 - HelveticaNeueThin:                   Helvetica Neue Thin
 - HelveticaNeueThinItalic:             Helvetica Neue Thin Italic
 - HelveticaNeueUltraLight:             Helvetica Neue Ultra Light
 - HelveticaNeueUltraLightItalic:       Helvetica Neue Ultra Light Italic
 - HelveticaOblique:                    Helvetica Oblique
 - HiraKakuProNW3:                      HiraKaku Pro NW 3
 - HiraKakuProNW6:                      HiraKaku Pro NW 6
 - HiraMinProNW3:                       Hira Min Pro NW 3
 - HiraMinProNW6:                       Hira Min Pro NW 6
 - HoeflerTextBlack:                    Hoefler Text Black
 - HoeflerTextBlackItalic:              Hoefler Text Black Italic
 - HoeflerTextItalic:                   Hoefler Text Italic
 - HoeflerTextRegular:                  Hoefler Text Regular
 - Kailasa:                             Kailasa
 - KailasaBold:                         Kailasa Bold
 - KannadaSangamMN:                     Kannada Sangam MN
 - KannadaSangamMNBold:                 Kannada Sangam MN Bold
 - MalayalamSangamMN:                   Malayalam Sangam MN
 - MalayalamSangamMNBold:               Malayalam Sangam MN Bold
 - MarkerFeltThin:                      Marker Felt Thin
 - MarkerFeltWide:                      Marker Felt Wide
 - MenloBold:                           Menlo Bold
 - MenloBoldItalic:                     Menlo Bold Italic
 - MenloItalic:                         Menlo Italic
 - MenloRegular:                        Menlo Regular
 - NoteworthyBold:                      Noteworthy Bold
 - NoteworthyLight:                     Noteworthy Light
 - OptimaBold:                          Optima Bold
 - OptimaBoldItalic:                    Optima Bold Italic
 - OptimaExtraBlack:                    Optima Extra Black
 - OptimaItalic:                        Optima Italic
 - OptimaRegular:                       Optima Regular
 - OriyaSangamMN:                       Oriya Sangam MN
 - OriyaSangamMNBold:                   Oriya Sangam MN Bold
 - PalatinoBold:                        Palatino Bold
 - PalatinoBoldItalic:                  Palatino Bold Italic
 - PalatinoItalic:                      Palatino Italic
 - PalatinoRoman:                       Palatino Roman
 - Papyrus:                             Papyrus
 - PapyrusCondensed:                    Papyrus Condensed
 - PartyLetPlain:                       Party Let Plain
 - SavoyeLetPlain:                      Savoye Let Plain
 - SinhalaSangamMN:                     Sinhala Sangam MN
 - SinhalaSangamMNBold:                 Sinhala Sangam MN Bold
 - SnellRoundhand:                      Snell Roundhand
 - SnellRoundhandBlack:                 Snell Roundhand Black
 - SnellRoundhandBold:                  Snell Roundhand Bold
 - STHeitiSCLight:                      ST Heiti SC Light
 - STHeitiSCMedium:                     ST Heiti SC Medium
 - STHeitiTCLight:                      ST Heiti TC Light
 - STHeitiTCMedium:                     ST Heiti TC Medium
 - Symbol:                              Symbol
 - TamilSangamMN:                       Tamil Sangam MN
 - TamilSangamMNBold:                   Tamil Sangam MN Bold
 - TeluguSangamMN:                      Telugu Sangam MN
 - TeluguSangamMNBold:                  Telugu Sangam MN Bold
 - Thonburi:                            Thonburi
 - ThonburiBold:                        Thonburi Bold
 - ThonburiLight:                       Thonburi Light
 - TimesNewRomanPSBoldItalicMT:         Times New Roman PS Bold Italic MT
 - TimesNewRomanPSBoldMT:               Times New Roman PS Bold MT
 - TimesNewRomanPSItalicMT:             Times New Roman PS Italic MT
 - TimesNewRomanPSMT:                   Times New Roman PS MT
 - TrebuchetBoldItalic:                 Trebuchet Bold Italic
 - TrebuchetMS:                         Trebuchet MS
 - TrebuchetMSBold:                     Trebuchet MS Bold
 - TrebuchetMSItalic:                   Trebuchet MS Italic
 - Verdana:                             Verdana
 - VerdanaBold:                         Verdana Bold
 - VerdanaBoldItalic:                   Verdana Bold Italic
 - VerdanaItalic:                       Verdana Italic
 */
public enum FontName : String {
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
    case AppleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight" /*@available(*, introduced=9.0)*/
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
    case BanglaSangamMN = "BanglaSangamMN" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case BanglaSangamMNBold = "BanglaSangamMN-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
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
    case DINAlternateBold = "DINAlternate-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case DINCondensedBold = "DINCondensed-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
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
    case IowanOldStyleBold = "IowanOldStyle-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case IowanOldStyleBoldItalic = "IowanOldStyle-BoldItalic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case IowanOldStyleItalic = "IowanOldStyle-Italic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case IowanOldStyleRoman = "IowanOldStyle-Roman" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case Kailasa = "Kailasa"
    case KailasaBold = "Kailasa-Bold"
    case KannadaSangamMN = "KannadaSangamMN"
    case KannadaSangamMNBold = "KannadaSangamMN-Bold"
    case KhmerSangamMN = "KhmerSangamMN" /*@available(*, introduced=8.0)*/
    case KohinoorBanglaLight = "KohinoorBangla-Light" /*@available(*, introduced=9.0)*/
    case KohinoorBanglaMedium = "KohinoorBangla-Medium" /*@available(*, introduced=9.0)*/
    case KohinoorBanglaRegular = "KohinoorBangla-Regular" /*@available(*, introduced=9.0)*/
    case KohinoorDevanagariLight = "KohinoorDevanagari-Light" /*@available(*, introduced=8.0)*/
    case KohinoorDevanagariMedium = "KohinoorDevanagari-Medium" /*@available(*, introduced=8.0)*/
    case KohinoorDevanagariBook = "KohinoorDevanagari-Book" /*@available(*, introduced=8.0)*/
    case LaoSangamMN = "LaoSangamMN" /*@available(*, introduced=8.0)*/
    case MalayalamSangamMN = "MalayalamSangamMN"
    case MalayalamSangamMNBold = "MalayalamSangamMN-Bold"
    case MarionBold = "Marion-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case MarionItalic = "Marion-Italic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case MarionRegular = "Marion-Regular" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
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
    case SuperclarendonBlack = "Superclarendon-Black" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case SuperclarendonBlackItalic = "Superclarendon-BalckItalic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case SuperclarendonBold = "Superclarendon-Bold" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case SuperclarendonBoldItalic = "Superclarendon-BoldItalic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case SuperclarendonItalic = "Superclarendon-Italic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case SuperclarendonLight = "Superclarendon-Light" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case SuperclarendonLightItalic = "Superclarendon-LightItalic" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
    case SuperclarendonRegular = "Superclarendon-Regular" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
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

/// This extesion adds some useful functions to UIFont
public extension UIFont {
    // MARK: - Class variables -
    
    /// Static light font to use in App
    public static var lightFont: UIFont {
        get {
            return UIFont.lightFont
        }
        set(newValue) {
            UIFont.lightFont = newValue
        }
    }
    
    /// Static regular font to use in App
    public static var regularFont: UIFont {
        get {
            return UIFont.regularFont
        }
        set(newValue) {
            UIFont.regularFont = newValue
        }
    }
    
    /// Static bold font to use in App
    public static var boldFont: UIFont {
        get {
            return UIFont.boldFont
        }
        set(newValue) {
            UIFont.boldFont = newValue
        }
    }
    
    // MARK: - Enums -
    
    /**
     All font family names available from iOS 7.0 to iOS 9.0
    
     - AcademyEngravedLET:     Academy Engraved LET
     - AlNile:                 Al Nile
     - AmericanTypewriter:     American Typewriter
     - AppleColorEmoji:        Apple Color Emoji
     - AppleSDGothicNeo:       Apple SD Gothic Neo
     - Arial:                  Arial
     - ArialHebrew:            Arial Hebrew
     - ArialRoundedMTBold:     Arial Rounded MT Bold
     - Avenir:                 Avenir
     - AvenirNext:             Avenir Next
     - AvenirNextCondensed:    Avenir Next Condensed
     - Baskerville:            Baskerville
     - Bodoni72:               Bodoni 72
     - Bodoni72Oldstyle:       Bodoni 72 Oldstyle
     - Bodoni72Smallcaps:      Bodoni 72 Smallcaps
     - BodoniOrnaments:        Bodoni Ornaments
     - BradleyHand:            Bradley Hand
     - ChalkboardSE:           Chalkboard SE
     - Chalkduster:            Chalkduster
     - Cochin:                 Cochin
     - Copperplate:            Copperplate
     - Courier:                Courier
     - CourierNew:             Courier New
     - Damascus:               Damascus
     - DevanagariSangamMN:     Devanagari Sangam MN
     - Didot:                  Didot
     - EuphemiaUCAS:           Euphemia UCAS
     - Farah:                  Farah
     - Futura:                 Futura
     - GeezaPro:               Geeza Pro
     - Georgia:                Georgia
     - GillSans:               Gill Sans
     - GujaratiSangamMN:       Gujarati Sangam MN
     - GurmukhiMN:             Gurmukhi MN
     - HeitiSC:                Heiti SC
     - HeitiTC:                Heiti TC
     - Helvetica:              Helvetica
     - HelveticaNeue:          Helvetica Neue
     - HiraginoKakuGothicProN: Hiragino Kaku Gothic Pro N
     - HiraginoMinchoProN:     Hiragino Mincho Pro N
     - HoeflerText:            Hoefler Text
     - Kailasa:                Kailasa
     - KannadaSangamMN:        Kannada Sangam MN
     - MalayalamSangamMN:      Malayalam Sangam MN
     - MarkerFelt:             Marker Felt
     - Menlo:                  Menlo
     - Mishafi:                Mishafi
     - Noteworthy:             Noteworthy
     - Optima:                 Optima
     - OriyaSangamMN:          Oriya Sangam MN
     - Palatino:               Palatino
     - Papyrus:                Papyrus
     - PartyLET:               Party LET
     - SavoyeLET:              Savoye LET
     - SinhalaSangamMN:        Sinhala Sangam MN
     - SnellRoundhand:         Snell Roundhand
     - Symbol:                 Symbol
     - TamilSangamMN:          Tamil Sangam MN
     - TeluguSangamMN:         Telugu Sangam MN
     - Thonburi:               Thonburi
     - TimesNewRoman:          Times New Roman
     - TrebuchetMS:            Trebuchet MS
     - Verdana:                Verdana
     - ZapfDingbats:           Zapf Dingbats
     - Zapfino:                Zapfino
     */
    public enum FamilyFontName : String {
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
        case BanglaSangamMN = "Bangla Sangam MN" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
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
        case DINAlternate = "DIN Alternate" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
        case DINCondensed = "DIN Condensed" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
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
        case IowanOldStyle = "Iowan Old Style" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
        case Kailasa = "Kailasa"
        case KannadaSangamMN = "Kannada Sangam MN"
        case KhmerSangamMN = "Khmer Sangam MN" /*@available(*, introduced=8.0)*/
        case KohinoorBangla = "Kohinoor Bangla" /*@available(*, introduced=8.0)*/
        case KohinoorDevanagari = "Kohinoor Devanagari" /*@available(*, introduced=8.0)*/
        case LaoSangamMN = "Lao Sangam MN" /*@available(*, introduced=8.0)*/
        case MalayalamSangamMN = "Malayalam Sangam MN"
        case Marion = "Marion" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
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
        case Superclarendon = "Superclarendon" /*@available(*, introduced=7.0, deprecated=8.0, message="This font is not available after iOS 8")*/
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
    
    /**
     Create an UIFont object from the given font name and size
    
     - parameter fontName: Font name
     - parameter size:     Size of the font
    
     - returns: Returns an UIFont from the given font name and size
     */
    public convenience init?(fontName: FontName, size: CGFloat) {
        self.init(name: fontName.rawValue, size: size)
    }
    
    // MARK: - Class functions -
    
    /**
     Print in console all family and font names
    
     - returns: Returns all the font family names
     */
    public static func allFamilyAndFonts() -> Dictionary<String, Array<AnyObject>> {
        var fontFamilies: NSMutableArray = NSMutableArray(array: UIFont.familyNames() as NSArray)
        fontFamilies = NSMutableArray.sortArrayByKey("", array: fontFamilies, ascending: true)
        
        var fontFamilyDic: Dictionary<String, Array<AnyObject>> = Dictionary()
        
        for i in 0 ..< fontFamilies.count {
            let fontFamily: String = fontFamilies.objectAtIndex(i) as! String
            let fontNames: Array = UIFont.fontNamesForFamilyName(fontFamily)
            fontFamilyDic[fontFamily] = fontNames
        }
        
        BFLog("\(fontFamilyDic)")
        
        return fontFamilyDic
    }
    
    /**
     Print in console all font names for a given family
    
     - parameter familyFontName: Family to print the fonts
    
     - returns: Returns all the fonts for the given family
     */
    public static func fontsNameForFamilyName(familyFontName: FamilyFontName) -> Array<AnyObject> {
        let fontNames: Array = UIFont.fontNamesForFamilyName(familyFontName.rawValue)
        
        BFLog("\(fontNames)")
        
        return fontNames
    }
}
