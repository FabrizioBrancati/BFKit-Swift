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

/// All font names for all family available from iOS 7.0 to iOS 9.0
///
/// - AcademyEngravedLetPlain:             AcademyEngravedLetPlain
/// - AlNile:                              AlNile
/// - AlNileBold:                          AlNileBold
/// - AmericanTypewriter:                  AmericanTypewriter
/// - AmericanTypewriterBold:              AmericanTypewriterBold
/// - AmericanTypewriterCondensed:         AmericanTypewriterCondensed
/// - AmericanTypewriterCondensedBold:     AmericanTypewriterCondensedBold
/// - AmericanTypewriterCondensedLight:    AmericanTypewriterCondensedLight
/// - AmericanTypewriterLight:             AmericanTypewriterLight
/// - AppleColorEmoji:                     AppleColorEmoji
/// - AppleSDGothicNeoBold:                AppleSDGothicNeoBold
/// - AppleSDGothicNeoLight:               AppleSDGothicNeoLight
/// - AppleSDGothicNeoMedium:              AppleSDGothicNeoMedium
/// - AppleSDGothicNeoRegular:             AppleSDGothicNeoRegular
/// - AppleSDGothicNeoSemiBold:            AppleSDGothicNeoSemiBold
/// - AppleSDGothicNeoThin:                AppleSDGothicNeoThin
/// - ArialBoldItalicMT:                   ArialBoldItalicMT
/// - ArialBoldMT:                         ArialBoldMT
/// - ArialHebrew:                         ArialHebrew
/// - ArialHebrewBold:                     ArialHebrewBold
/// - ArialHebrewLight:                    ArialHebrewLight
/// - ArialItalicMT:                       ArialItalicMT
/// - ArialMT:                             ArialMT
/// - ArialRoundedMTBold:                  ArialRoundedMTBold
/// - ASTHeitiLight:                       ASTHeitiLight
/// - ASTHeitiMedium:                      ASTHeitiMedium
/// - AvenirBlack:                         AvenirBlack
/// - AvenirBlackOblique:                  AvenirBlackOblique
/// - AvenirBook:                          AvenirBook
/// - AvenirBookOblique:                   AvenirBookOblique
/// - AvenirHeavyOblique:                  AvenirHeavyOblique
/// - AvenirHeavy:                         AvenirHeavy
/// - AvenirLight:                         AvenirLight
/// - AvenirLightOblique:                  AvenirLightOblique
/// - AvenirMedium:                        AvenirMedium
/// - AvenirMediumOblique:                 AvenirMediumOblique
/// - AvenirNextBold:                      AvenirNextBold
/// - AvenirNextBoldItalic:                AvenirNextBoldItalic
/// - AvenirNextCondensedBold:             AvenirNextCondensedBold
/// - AvenirNextCondensedBoldItalic:       AvenirNextCondensedBoldItalic
/// - AvenirNextCondensedDemiBold:         AvenirNextCondensedDemiBold
/// - AvenirNextCondensedDemiBoldItalic:   AvenirNextCondensedDemiBoldItalic
/// - AvenirNextCondensedHeavy:            AvenirNextCondensedHeavy
/// - AvenirNextCondensedHeavyItalic:      AvenirNextCondensedHeavyItalic
/// - AvenirNextCondensedItalic:           AvenirNextCondensedItalic
/// - AvenirNextCondensedMedium:           AvenirNextCondensedMedium
/// - AvenirNextCondensedMediumItalic:     AvenirNextCondensedMediumItalic
/// - AvenirNextCondensedRegular:          AvenirNextCondensedRegular
/// - AvenirNextCondensedUltraLight:       AvenirNextCondensedUltraLight
/// - AvenirNextCondensedUltraLightItalic: AvenirNextCondensedUltraLightItalic
/// - AvenirNextDemiBold:                  AvenirNextDemiBold
/// - AvenirNextDemiBoldItalic:            AvenirNextDemiBoldItalic
/// - AvenirNextHeavy:                     AvenirNextHeavy
/// - AvenirNextItalic:                    AvenirNextItalic
/// - AvenirNextMedium:                    AvenirNextMedium
/// - AvenirNextMediumItalic:              AvenirNextMediumItalic
/// - AvenirNextRegular:                   AvenirNextRegular
/// - AvenirNextUltraLight:                AvenirNextUltraLight
/// - AvenirNextUltraLightItalic:          AvenirNextUltraLightItalic
/// - AvenirOblique:                       AvenirOblique
/// - AvenirRoman:                         AvenirRoman
/// - Baskerville:                         Baskerville
/// - BaskervilleBold:                     BaskervilleBold
/// - BaskervilleBoldItalic:               BaskervilleBoldItalic
/// - BaskervilleItalic:                   BaskervilleItalic
/// - BaskervilleSemiBold:                 BaskervilleSemiBold
/// - BaskervilleSemiBoldItalic:           BaskervilleSemiBoldItalic
/// - BodoniOrnamentsITCTT:                BodoniOrnamentsITCTT
/// - BodoniSvtyTwoITCTTBold:              BodoniSvtyTwoITCTTBold
/// - BodoniSvtyTwoITCTTBook:              BodoniSvtyTwoITCTTBook
/// - BodoniSvtyTwoITCTTBookIta:           BodoniSvtyTwoITCTTBookIta
/// - BodoniSvtyTwoOSITCTTBold:            BodoniSvtyTwoOSITCTTBold
/// - BodoniSvtyTwoOSITCTTBook:            BodoniSvtyTwoOSITCTTBook
/// - BodoniSvtyTwoOSITCTTBookIt:          BodoniSvtyTwoOSITCTTBookIt
/// - BodoniSvtyTwoSCITCTTBook:            BodoniSvtyTwoSCITCTTBook
/// - BradleyHandITCTTBold:                BradleyHandITCTTBold
/// - ChalkboardSEBold:                    ChalkboardSEBold
/// - ChalkboardSELight:                   ChalkboardSELight
/// - ChalkboardSERegular:                 ChalkboardSERegular
/// - Chalkduster:                         Chalkduster
/// - Cochin:                              Cochin
/// - CochinBold:                          CochinBold
/// - CochinBoldItalic:                    CochinBoldItalic
/// - CochinItalic:                        CochinItalic
/// - Copperplate:                         Copperplate
/// - CopperplateBold:                     CopperplateBold
/// - CopperplateLight:                    CopperplateLight
/// - Courier:                             Courier
/// - CourierBold:                         CourierBold
/// - CourierBoldOblique:                  CourierBoldOblique
/// - CourierNewPSBoldItalicMT:            CourierNewPSBoldItalicMT
/// - CourierNewPSBoldMT:                  CourierNewPSBoldMT
/// - CourierNewPSItalicMT:                CourierNewPSItalicMT
/// - CourierNewPSMT:                      CourierNewPSMT
/// - CourierOblique:                      CourierOblique
/// - Damascus:                            Damascus
/// - DamascusBold:                        DamascusBold
/// - DamascusMedium:                      DamascusMedium
/// - DamascusSemiBold:                    DamascusSemiBold
/// - DevanagariSangamMN:                  DevanagariSangamMN
/// - DevanagariSangamMNBold:              DevanagariSangamMNBold
/// - Didot:                               Didot
/// - DidotBold:                           DidotBold
/// - DidotItalic:                         DidotItalic
/// - DiwanMishafi:                        DiwanMishafi
/// - EuphemiaUCAS:                        EuphemiaUCAS
/// - EuphemiaUCASBold:                    EuphemiaUCASBold
/// - EuphemiaUCASItalic:                  EuphemiaUCASItalic
/// - Farah:                               Farah
/// - FuturaCondensedExtraBold:            FuturaCondensedExtraBold
/// - FuturaCondensedMedium:               FuturaCondensedMedium
/// - FuturaMedium:                        FuturaMedium
/// - FuturaMediumItalicm:                 FuturaMediumItalicm
/// - GeezaPro:                            GeezaPro
/// - GeezaProBold:                        GeezaProBold
/// - GeezaProLight:                       GeezaProLight
/// - Georgia:                             Georgia
/// - GeorgiaBold:                         GeorgiaBold
/// - GeorgiaBoldItalic:                   GeorgiaBoldItalic
/// - GeorgiaItalic:                       GeorgiaItalic
/// - GillSans:                            GillSans
/// - GillSansBold:                        GillSansBold
/// - GillSansBoldItalic:                  GillSansBoldItalic
/// - GillSansItalic:                      GillSansItalic
/// - GillSansLight:                       GillSansLight
/// - GillSansLightItalic:                 GillSansLightItalic
/// - GujaratiSangamMN:                    GujaratiSangamMN
/// - GujaratiSangamMNBold:                GujaratiSangamMNBold
/// - GurmukhiMN:                          GurmukhiMN
/// - GurmukhiMNBold:                      GurmukhiMNBold
/// - Helvetica:                           Helvetica
/// - HelveticaBold:                       HelveticaBold
/// - HelveticaBoldOblique:                HelveticaBoldOblique
/// - HelveticaLight:                      HelveticaLight
/// - HelveticaLightOblique:               HelveticaLightOblique
/// - HelveticaNeue:                       HelveticaNeue
/// - HelveticaNeueBold:                   HelveticaNeueBold
/// - HelveticaNeueBoldItalic:             HelveticaNeueBoldItalic
/// - HelveticaNeueCondensedBlack:         HelveticaNeueCondensedBlack
/// - HelveticaNeueCondensedBold:          HelveticaNeueCondensedBold
/// - HelveticaNeueItalic:                 HelveticaNeueItalic
/// - HelveticaNeueLight:                  HelveticaNeueLight
/// - HelveticaNeueMedium:                 HelveticaNeueMedium
/// - HelveticaNeueMediumItalic:           HelveticaNeueMediumItalic
/// - HelveticaNeueThin:                   HelveticaNeueThin
/// - HelveticaNeueThinItalic:             HelveticaNeueThinItalic
/// - HelveticaNeueUltraLight:             HelveticaNeueUltraLight
/// - HelveticaNeueUltraLightItalic:       HelveticaNeueUltraLightItalic
/// - HelveticaOblique:                    HelveticaOblique
/// - HiraKakuProNW3:                      HiraKakuProNW3
/// - HiraKakuProNW6:                      HiraKakuProNW6
/// - HiraMinProNW3:                       HiraMinProNW3
/// - HiraMinProNW6:                       HiraMinProNW6
/// - HoeflerTextBlack:                    HoeflerTextBlack
/// - HoeflerTextBlackItalic:              HoeflerTextBlackItalic
/// - HoeflerTextItalic:                   HoeflerTextItalic
/// - HoeflerTextRegular:                  HoeflerTextRegular
/// - Kailasa:                             Kailasa
/// - KailasaBold:                         KailasaBold
/// - KannadaSangamMN:                     KannadaSangamMN
/// - KannadaSangamMNBold:                 KannadaSangamMNBold
/// - MalayalamSangamMN:                   MalayalamSangamMN
/// - MalayalamSangamMNBold:               MalayalamSangamMNBold
/// - MarkerFeltThin:                      MarkerFeltThin
/// - MarkerFeltWide:                      MarkerFeltWide
/// - MenloBold:                           MenloBold
/// - MenloBoldItalic:                     MenloBoldItalic
/// - MenloItalic:                         MenloItalic
/// - MenloRegular:                        MenloRegular
/// - NoteworthyBold:                      NoteworthyBold
/// - NoteworthyLight:                     NoteworthyLight
/// - OptimaBold:                          OptimaBold
/// - OptimaBoldItalic:                    OptimaBoldItalic
/// - OptimaExtraBlack:                    OptimaExtraBlack
/// - OptimaItalic:                        OptimaItalic
/// - OptimaRegular:                       OptimaRegular
/// - OriyaSangamMN:                       OriyaSangamMN
/// - OriyaSangamMNBold:                   OriyaSangamMNBold
/// - PalatinoBold:                        PalatinoBold
/// - PalatinoBoldItalic:                  PalatinoBoldItalic
/// - PalatinoItalic:                      PalatinoItalic
/// - PalatinoRoman:                       PalatinoRoman
/// - Papyrus:                             Papyrus
/// - PapyrusCondensed:                    PapyrusCondensed
/// - PartyLetPlain:                       PartyLetPlain
/// - SavoyeLetPlain:                      SavoyeLetPlain
/// - SinhalaSangamMN:                     SinhalaSangamMN
/// - SinhalaSangamMNBold:                 SinhalaSangamMNBold
/// - SnellRoundhand:                      SnellRoundhand
/// - SnellRoundhandBlack:                 SnellRoundhandBlack
/// - SnellRoundhandBold:                  SnellRoundhandBold
/// - STHeitiSCLight:                      STHeitiSCLight
/// - STHeitiSCMedium:                     STHeitiSCMedium
/// - STHeitiTCLight:                      STHeitiTCLight
/// - STHeitiTCMedium:                     STHeitiTCMedium
/// - Symbol:                              Symbol
/// - TamilSangamMN:                       TamilSangamMN
/// - TamilSangamMNBold:                   TamilSangamMNBold
/// - TeluguSangamMN:                      TeluguSangamMN
/// - TeluguSangamMNBold:                  TeluguSangamMNBold
/// - Thonburi:                            Thonburi
/// - ThonburiBold:                        ThonburiBold
/// - ThonburiLight:                       ThonburiLight
/// - TimesNewRomanPSBoldItalicMT:         TimesNewRomanPSBoldItalicMT
/// - TimesNewRomanPSBoldMT:               TimesNewRomanPSBoldMT
/// - TimesNewRomanPSItalicMT:             TimesNewRomanPSItalicMT
/// - TimesNewRomanPSMT:                   TimesNewRomanPSMT
/// - TrebuchetBoldItalic:                 TrebuchetBoldItalic
/// - TrebuchetMS:                         TrebuchetMS
/// - TrebuchetMSBold:                     TrebuchetMSBold
/// - TrebuchetMSItalic:                   TrebuchetMSItalic
/// - Verdana:                             Verdana
/// - VerdanaBold:                         VerdanaBold
/// - VerdanaBoldItalic:                   VerdanaBoldItalic
/// - VerdanaItalic:                       VerdanaItalic
/// - KhmerSangamMN:                       Khmer Sangam MN
/// - KohinoorDevanagariLight:             Kohinoor Devanagari Light
/// - KohinoorDevanagariMedium:            Kohinoor Devanagari Medium
/// - KohinoorDevanagariBook:              Kohinoor Devanagari Book
/// - LaoSangamMN:                         Lao Sangam MN
/// - (iOS 9) AppleSDGothicNeoUltraLight:          AppleSDGothicNeoUltraLight
/// - (iOS 9) KohinoorBanglaLight:                 KohinoorBanglaLight
/// - (iOS 9) KohinoorBanglaMedium:                KohinoorBanglaMedium
/// - (iOS 9) KohinoorBanglaRegular:               KohinoorBanglaRegular
public enum FontName: String {
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
    case Kailasa = "Kailasa"
    case KailasaBold = "Kailasa-Bold"
    case KannadaSangamMN = "KannadaSangamMN"
    case KannadaSangamMNBold = "KannadaSangamMN-Bold"
    case MalayalamSangamMN = "MalayalamSangamMN"
    case MalayalamSangamMNBold = "MalayalamSangamMN-Bold"
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
    case KhmerSangamMN = "KhmerSangamMN"
    case KohinoorDevanagariLight = "KohinoorDevanagari-Light"
    case KohinoorDevanagariMedium = "KohinoorDevanagari-Medium"
    case KohinoorDevanagariBook = "KohinoorDevanagari-Book"
    case LaoSangamMN = "LaoSangamMN"
    case AppleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight"
    case KohinoorBanglaLight = "KohinoorBangla-Light"
    case KohinoorBanglaMedium = "KohinoorBangla-Medium"
    case KohinoorBanglaRegular = "KohinoorBangla-Regular"
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
    
    
    /// All font family names available from iOS 7.0 to iOS 9.0
    ///
    /// - AcademyEngravedLET:     AcademyEngravedLET
    /// - AlNile:                 AlNile
    /// - AmericanTypewriter:     AmericanTypewriter
    /// - AppleColorEmoji:        AppleColorEmoji
    /// - AppleSDGothicNeo:       AppleSDGothicNeo
    /// - Arial:                  Arial
    /// - ArialHebrew:            ArialHebrew
    /// - ArialRoundedMTBold:     ArialRoundedMTBold
    /// - Avenir:                 Avenir
    /// - AvenirNext:             AvenirNext
    /// - AvenirNextCondensed:    AvenirNextCondensed
    /// - BanglaSangamMN:         BanglaSangamMN
    /// - Baskerville:            Baskerville
    /// - Bodoni72:               Bodoni72
    /// - Bodoni72Oldstyle:       Bodoni72Oldstyle
    /// - Bodoni72Smallcaps:      Bodoni72Smallcaps
    /// - BodoniOrnaments:        BodoniOrnaments
    /// - BradleyHand:            BradleyHand
    /// - ChalkboardSE:           ChalkboardSE
    /// - Chalkduster:            Chalkduster
    /// - Cochin:                 Cochin
    /// - Copperplate:            Copperplate
    /// - Courier:                Courier
    /// - CourierNew:             CourierNew
    /// - Damascus:               Damascus
    /// - DevanagariSangamMN:     DevanagariSangamMN
    /// - Didot:                  Didot
    /// - DINAlternate:           DINAlternate
    /// - DINCondensed:           DINCondensed
    /// - EuphemiaUCAS:           EuphemiaUCAS
    /// - Farah:                  Farah
    /// - Futura:                 Futura
    /// - GeezaPro:               GeezaPro
    /// - Georgia:                Georgia
    /// - GillSans:               GillSans
    /// - GujaratiSangamMN:       GujaratiSangamMN
    /// - GurmukhiMN:             GurmukhiMN
    /// - HeitiSC:                HeitiSC
    /// - HeitiTC:                HeitiTC
    /// - Helvetica:              Helvetica
    /// - HelveticaNeue:          HelveticaNeue
    /// - HiraginoKakuGothicProN: HiraginoKakuGothicProN
    /// - HiraginoMinchoProN:     HiraginoMinchoProN
    /// - HoeflerText:            HoeflerText
    /// - IowanOldStyle:          IowanOldStyle
    /// - Kailasa:                Kailasa
    /// - KannadaSangamMN:        KannadaSangamMN
    /// - KhmerSangamMN:          KhmerSangamMN
    /// - KohinoorBangla:         KohinoorBangla
    /// - KohinoorDevanagari:     KohinoorDevanagari
    /// - LaoSangamMN:            LaoSangamMN
    /// - MalayalamSangamMN:      MalayalamSangamMN
    /// - Marion:                 Marion
    /// - MarkerFelt:             MarkerFelt
    /// - Menlo:                  Menlo
    /// - Mishafi:                Mishafi
    /// - Noteworthy:             Noteworthy
    /// - Optima:                 Optima
    /// - OriyaSangamMN:          OriyaSangamMN
    /// - Palatino:               Palatino
    /// - Papyrus:                Papyrus
    /// - PartyLET:               PartyLET
    /// - SavoyeLET:              SavoyeLET
    /// - SinhalaSangamMN:        SinhalaSangamMN
    /// - SnellRoundhand:         SnellRoundhand
    /// - Superclarendon:         Superclarendon
    /// - Symbol:                 Symbol
    /// - TamilSangamMN:          TamilSangamMN
    /// - TeluguSangamMN:         TeluguSangamMN
    /// - Thonburi:               Thonburi
    /// - TimesNewRoman:          TimesNewRoman
    /// - TrebuchetMS:            TrebuchetMS
    /// - Verdana:                Verdana
    /// - ZapfDingbats:           ZapfDingbats
    /// - Zapfino:                Zapfino
    /// - KhmerSangamMN:          KhmerSangamMN
    /// - KohinoorBangla:         KohinoorBangla
    /// - KohinoorDevanagari:     KohinoorDevanagari
    /// - LaoSangamMN:            LaoSangamMN
    public enum FamilyFontName: String {
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
        case Kailasa = "Kailasa"
        case KannadaSangamMN = "Kannada Sangam MN"
        case MalayalamSangamMN = "Malayalam Sangam MN"
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
        case Symbol = "Symbol"
        case TamilSangamMN = "Tamil Sangam MN"
        case TeluguSangamMN = "Telugu Sangam MN"
        case Thonburi = "Thonburi"
        case TimesNewRoman = "Times New Roman"
        case TrebuchetMS = "Trebuchet MS"
        case Verdana = "Verdana"
        case ZapfDingbats = "Zapf Dingbats"
        case Zapfino = "Zapfino"
        case KhmerSangamMN = "Khmer Sangam MN"
        case KohinoorBangla = "Kohinoor Bangla"
        case KohinoorDevanagari = "Kohinoor Devanagari"
        case LaoSangamMN = "Lao Sangam MN"
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
    public static func allFamilyAndFonts() -> [String: [Any]] {
        var fontFamilies: NSMutableArray = NSMutableArray(array: UIFont.familyNames as NSArray)
        fontFamilies = NSMutableArray.sortArrayByKey("", array: fontFamilies, ascending: true)
        
        var fontFamilyDictionary: [String: [Any]] = Dictionary()
        
        for i in 0 ..< fontFamilies.count {
            let fontFamily: String = fontFamilies.object(at: i) as! String
            let fontNames: Array = UIFont.fontNames(forFamilyName: fontFamily)
            fontFamilyDictionary[fontFamily] = fontNames
        }
        
        return fontFamilyDictionary
    }
    
    /**
     Used to calculate text height for max width and font
     
     - parameter width: Max width to fit text
     - parameter font:  Font used in text
     
     - returns: Returns the calculated height of string within width using given font
     */
    public static func heightForWidth(_ width: CGFloat, font: UIFont, text: String) -> CGFloat {
        var size: CGSize = CGSize.zero
        if text.length > 0 {
            let frame: CGRect = text.boundingRect(with: CGSize(width: width, height: 999999), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil)
            size = CGSize(width: frame.size.width, height: frame.size.height + 1)
        }
        return size.height
    }
    
    /**
     Print in console all font names for a given family
    
     - parameter familyFontName: Family to print the fonts
    
     - returns: Returns all the fonts for the given family
     */
    public static func fontsNameForFamilyName(_ familyFontName: FamilyFontName) -> [Any] {
        let fontNames: Array = UIFont.fontNames(forFamilyName: familyFontName.rawValue)
        
        return fontNames
    }
}
