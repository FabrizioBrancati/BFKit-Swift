//
//  UIFontExtension.swift
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

// MARK: - Global variables

/// All font names for all family available from iOS 7.0 to iOS 10.0.
///
/// - AcademyEngravedLetPlain: AcademyEngravedLetPlain.
/// - AlNile: AlNile.
/// - AlNileBold: AlNile Bold.
/// - AmericanTypewriter: AmericanTypewriter.
/// - AmericanTypewriterBold: AmericanTypewriter Bold.
/// - AmericanTypewriterCondensed: AmericanTypewriter Condensed.
/// - AmericanTypewriterCondensedBold: AmericanTypewriter Condensed Bold.
/// - AmericanTypewriterCondensedLight: AmericanTypewriter Condensed Light.
/// - AmericanTypewriterLight: AmericanTypewriter Light.
/// - AmericanTypewriterSemiBold: AmericanTypewriter Semi Bold.
/// - AppleColorEmoji: AppleColorEmoji.
/// - AppleSDGothicNeoBold: AppleSDGothicNeo Bold.
/// - AppleSDGothicNeoLight: AppleSDGothicNeo Light.
/// - AppleSDGothicNeoMedium: AppleSDGothicNeo Medium.
/// - AppleSDGothicNeoRegular: AppleSDGothicNeo Regular.
/// - AppleSDGothicNeoSemiBold: AppleSDGothicNeo Semi Bold.
/// - AppleSDGothicNeoThin: AppleSDGothicNeo Thin.
/// - AppleSDGothicNeoUltraLight: AppleSDGothicNeo Ultra Light.
/// - ArialBoldItalicMT: Arial Bold Italic MT.
/// - ArialBoldMT: Arial Bold MT.
/// - ArialHebrew: ArialHebrew.
/// - ArialHebrewBold: ArialHebrew Bold.
/// - ArialHebrewLight: ArialHebrew Light.
/// - ArialItalicMT: Arial Italic MT.
/// - ArialMT: Arial MT.
/// - ArialRoundedMTBold: Arial Rounded MT Bold.
/// - ASTHeitiLight: ASTHeiti Light.
/// - ASTHeitiMedium: ASTHeiti Medium.
/// - AvenirBlack: AvenirBlack.
/// - AvenirBlackOblique: AvenirBlack Oblique.
/// - AvenirBook: AvenirBook.
/// - AvenirBookOblique: AvenirBook Oblique.
/// - AvenirHeavy: AvenirHeavy.
/// - AvenirHeavyOblique: AvenirHeavy Oblique.
/// - AvenirLight: AvenirLight.
/// - AvenirLightOblique: AvenirLight Oblique.
/// - AvenirMedium: AvenirMedium.
/// - AvenirMediumOblique: AvenirMedium Oblique.
/// - AvenirNextBold: AvenirNext Bold.
/// - AvenirNextBoldItalic: AvenirNext Bold Italic.
/// - AvenirNextCondensedBold: AvenirNextCondensed Bold.
/// - AvenirNextCondensedBoldItalic: AvenirNextCondensed Bold Italic.
/// - AvenirNextCondensedDemiBold: AvenirNextCondensed Demi Bold.
/// - AvenirNextCondensedDemiBoldItalic: AvenirNextCondensed Demi Bold Italic.
/// - AvenirNextCondensedHeavy: AvenirNextCondensed Heavy.
/// - AvenirNextCondensedHeavyItalic: AvenirNextCondensed Heavy Italic.
/// - AvenirNextCondensedItalic: AvenirNextCondensed Italic.
/// - AvenirNextCondensedMedium: AvenirNextCondensed Medium.
/// - AvenirNextCondensedMediumItalic: AvenirNextCondensed Medium Italic.
/// - AvenirNextCondensedRegular: AvenirNextCondensed Regular.
/// - AvenirNextCondensedUltraLight: AvenirNextCondensed Ultra Light.
/// - AvenirNextCondensedUltraLightItalic: AvenirNextCondensed Ultra Light Italic.
/// - AvenirNextDemiBold: AvenirNextDemi Bold.
/// - AvenirNextDemiBoldItalic: AvenirNextDemi Bold Italic.
/// - AvenirNextHeavy: AvenirNext Heavy.
/// - AvenirNextItalic: AvenirNext Italic.
/// - AvenirNextMedium: AvenirNext Medium.
/// - AvenirNextMediumItalic: AvenirNext Medium Italic.
/// - AvenirNextRegular: AvenirNext Regular.
/// - AvenirNextUltraLight: AvenirNext Ultra Light.
/// - AvenirNextUltraLightItalic: AvenirNext Ultra Light Italic.
/// - AvenirOblique: Avenir Oblique.
/// - AvenirRoman: Avenir Roman.
/// - Baskerville: Baskerville.
/// - BaskervilleBold: Baskerville Bold.
/// - BaskervilleBoldItalic: Baskerville Bold Italic.
/// - BaskervilleItalic: Baskerville Italic.
/// - BaskervilleSemiBold: Baskerville Semi Bold.
/// - BaskervilleSemiBoldItalic: Baskerville Semi Bold Italic.
/// - BodoniOrnamentsITCTT: BodoniOrnamentsITCTT.
/// - BodoniSvtyTwoITCTTBold: BodoniSvtyTwoITCTT Bold.
/// - BodoniSvtyTwoITCTTBook: BodoniSvtyTwoITCTT Book.
/// - BodoniSvtyTwoITCTTBookIta: BodoniSvtyTwoITCTT Book Ita.
/// - BodoniSvtyTwoOSITCTTBold: BodoniSvtyTwoOSITCTT Bold.
/// - BodoniSvtyTwoOSITCTTBook: BodoniSvtyTwoOSITCTT Book.
/// - BodoniSvtyTwoOSITCTTBookIt: BodoniSvtyTwoOSITCTT Book It.
/// - BodoniSvtyTwoSCITCTTBook: BodoniSvtyTwoSCITCTT Book.
/// - BradleyHandITCTTBold: BradleyHandITCTT Bold.
/// - ChalkboardSEBold: ChalkboardSE Bold.
/// - ChalkboardSELight: ChalkboardSE Light.
/// - ChalkboardSERegular: ChalkboardSE Regular.
/// - Chalkduster: Chalkduster.
/// - Cochin: Cochin.
/// - CochinBold: Cochin Bold.
/// - CochinBoldItalic: Cochin Bold Italic.
/// - CochinItalic: Cochin Italic.
/// - Copperplate: Copperplate.
/// - CopperplateBold: Copperplate Bold.
/// - CopperplateLight: Copperplate Light.
/// - Courier: Courier.
/// - CourierBold: Courier Bold.
/// - CourierBoldOblique: Courier Bold Oblique.
/// - CourierNewPSBoldItalicMT: CourierNewPS Bold Italic MT.
/// - CourierNewPSBoldMT: CourierNewPS Bold MT.
/// - CourierNewPSItalicMT: CourierNewPS Italic MT.
/// - CourierNewPSMT: CourierNewPS MT.
/// - CourierOblique: Courier Oblique.
/// - Damascus: Damascus.
/// - DamascusBold: Damascus Bold.
/// - DamascusMedium: Damascus Medium.
/// - DamascusSemiBold: Damascus Semi Bold.
/// - DevanagariSangamMN: DevanagariSangamMN.
/// - DevanagariSangamMNBold: DevanagariSangamMN Bold.
/// - Didot: Didot.
/// - DidotBold: Didot Bold.
/// - DidotItalic: Didot Italic.
/// - DiwanMishafi: DiwanMishafi..
/// - EuphemiaUCAS: EuphemiaUCAS.
/// - EuphemiaUCASBold: EuphemiaUCAS Bold.
/// - EuphemiaUCASItalic: EuphemiaUCAS Italic.
/// - Farah: Farah.
/// - FuturaBold: Futura Bold.
/// - FuturaCondensedExtraBold: Futura Condensed Extra Bold.
/// - FuturaCondensedMedium: Futura Condensed Medium.
/// - FuturaMedium: Futura Medium.
/// - FuturaMediumItalic: Futura Medium Italic.
/// - GeezaPro: GeezaPro.
/// - GeezaProBold: GeezaPro Bold.
/// - GeezaProLight: GeezaPro Light.
/// - Georgia: Georgia.
/// - GeorgiaBold: Georgia Bold.
/// - GeorgiaBoldItalic: Georgia Bold Italic.
/// - GeorgiaItalic: Georgia Italic.
/// - GillSans: GillSans.
/// - GillSansBold: GillSans Bold.
/// - GillSansBoldItalic: GillSans Bold Italic.
/// - GillSansItalic: GillSans Italic.
/// - GillSansLight: GillSans Light.
/// - GillSansLightItalic: GillSans Light Italic.
/// - GillSansSemiBold: GillSans Semi Bold.
/// - GillSansSemiBoldItalic: GillSans Semi Bold Italic.
/// - GillSansUltraBold: GillSans Ultra Bold.
/// - GujaratiSangamMN: GujaratiSangamMN.
/// - GujaratiSangamMNBold: GujaratiSangamMN Bold.
/// - GurmukhiMN: GurmukhiMN.
/// - GurmukhiMNBold: GurmukhiMN Bold.
/// - Helvetica: Helvetica.
/// - HelveticaBold: Helvetica Bold.
/// - HelveticaBoldOblique: Helvetica Bold Oblique.
/// - HelveticaLight: Helvetica Light.
/// - HelveticaLightOblique: Helvetica Light Oblique.
/// - HelveticaNeue: HelveticaNeue.
/// - HelveticaNeueBold: HelveticaNeue Bold.
/// - HelveticaNeueBoldItalic: HelveticaNeue Bold Italic.
/// - HelveticaNeueCondensedBlack: HelveticaNeue Condensed Black.
/// - HelveticaNeueCondensedBold: HelveticaNeue Condensed Bold.
/// - HelveticaNeueItalic: HelveticaNeue Italic.
/// - HelveticaNeueLight: HelveticaNeue Light.
/// - HelveticaNeueMedium: HelveticaNeue Medium.
/// - HelveticaNeueMediumItalic: HelveticaNeue Medium Italic.
/// - HelveticaNeueThin: HelveticaNeue Thin.
/// - HelveticaNeueThinItalic: HelveticaNeue Thin Italic.
/// - HelveticaNeueUltraLight: HelveticaNeue Ultra Light.
/// - HelveticaNeueUltraLightItalic: HelveticaNeue Ultra Light Italic.
/// - HelveticaOblique: Helvetica Oblique.
/// - HiraginoSansW3: HiraginoSansW3.
/// - HiraginoSansW6: HiraginoSansW6.
/// - HiraKakuProNW3: HiraKakuProNW3.
/// - HiraKakuProNW6: HiraKakuProNW6.
/// - HiraMinProNW3: HiraMinProNW3.
/// - HiraMinProNW6: HiraMinProNW6.
/// - HoeflerTextBlack: HoeflerTextBlack.
/// - HoeflerTextBlackItalic: HoeflerTextBlack Italic.
/// - HoeflerTextItalic: HoeflerText Italic.
/// - HoeflerTextRegular: HoeflerText Regular.
/// - Kailasa: Kailasa.
/// - KailasaBold: Kailasa Bold.
/// - KannadaSangamMN: KannadaSangamMN.
/// - KannadaSangamMNBold: KannadaSangamMN Bold.
/// - KhmerSangamMN: KhmerSangamMN.
/// - KohinoorBanglaLight: KohinoorBangla Light.
/// - KohinoorBanglaMedium: KohinoorBangla Medium.
/// - KohinoorBanglaRegular: KohinoorBangla Regular.
/// - KohinoorBanglaSemiBold: KohinoorBangla Semi Bold.
/// - KohinoorDevanagariBook: KohinoorDevanagari Book.
/// - KohinoorDevanagariLight: KohinoorDevanagari Light.
/// - KohinoorDevanagariMedium: KohinoorDevanagari Medium.
/// - KohinoorDevanagariRegular KohinoorDevanagari Regular.
/// - KohinoorDevanagariSemiBold KohinoorDevanagari Semi Bold.
/// - KohinoorTeluguLight: KohinoorTelugu Light.
/// - KohinoorTeluguMedium: KohinoorTelugu Medium.
/// - KohinoorTeluguRegular: KohinoorTelugu Regular.
/// - LaoSangamMN: LaoSangamMN.
/// - MalayalamSangamMN: MalayalamSangamMN.
/// - MalayalamSangamMNBold: MalayalamSangamMN Bold.
/// - MarkerFeltThin: MarkerFelt Thin.
/// - MarkerFeltWide: MarkerFelt Wide.
/// - MenloBold: MenloBold.
/// - MenloBoldItalic: MenloBold Italic.
/// - MenloItalic: Menlo Italic.
/// - MenloRegular: Menlo Regular.
/// - MyanmarSangamMN: MyanmarSangamMN.
/// - MyanmarSangamMNBold: MyanmarSangamMN Bold.
/// - NoteworthyBold: Noteworthy Bold.
/// - NoteworthyLight: Noteworthy Light.
/// - OptimaBold: Optima Bold.
/// - OptimaBoldItalic: Optima Bold Italic.
/// - OptimaExtraBlack: Optima Extra Black.
/// - OptimaItalic: Optima Italic.
/// - OptimaRegular: Optima Regular.
/// - OriyaSangamMN: OriyaSangamMN.
/// - OriyaSangamMNBold: OriyaSangamMN Bold.
/// - PalatinoBold: Palatino Bold.
/// - PalatinoBoldItalic: Palatino Bold Italic.
/// - PalatinoItalic: Palatino Italic.
/// - PalatinoRoman: Palatino Roman.
/// - Papyrus: Papyrus.
/// - PapyrusCondensed: Papyrus Condensed.
/// - PartyLetPlain: PartyLetPlain.
/// - PingFangHKLight: PingFangHK Light.
/// - PingFangHKMedium: PingFangHK Medium.
/// - PingFangHKRegular: PingFangHK Regular.
/// - PingFangHKSemiBold: PingFangHK Semi Bold.
/// - PingFangHKThin: PingFangHK Thin.
/// - PingFangHKUltraLight: PingFangHK Ultra Light.
/// - PingFangSCLight: PingFangSC Light.
/// - PingFangSCMedium: PingFangSC Medium.
/// - PingFangSCRegular: PingFangSC Regular.
/// - PingFangSCSemiBold: PingFangSC Semi Bold.
/// - PingFangSCThin: PingFangSC Thin.
/// - PingFangSCUltraLight: PingFangSC Ultra Light.
/// - PingFangTCLight: PingFangTC Light.
/// - PingFangTCMedium: PingFangTC Medium.
/// - PingFangTCRegular: PingFangTC Regular.
/// - PingFangTCSemiBold: PingFangTC Semi Bold.
/// - PingFangTCThin: PingFangTC Thin.
/// - PingFangTCUltraLight: PingFangTC Ultra Light.
/// - SavoyeLetPlain: SavoyeLetPlain.
/// - SinhalaSangamMN: SinhalaSangamMN.
/// - SinhalaSangamMNBold: SinhalaSangamMN Bold.
/// - SnellRoundhand: SnellRoundhand.
/// - SnellRoundhandBlack: SnellRoundhand Black.
/// - SnellRoundhandBold: SnellRoundhand Bold.
/// - STHeitiSCLight: STHeitiSC Light.
/// - STHeitiSCMedium: STHeitiSC Medium.
/// - STHeitiTCLight: STHeitiTC Light.
/// - STHeitiTCMedium: STHeitiTC Medium.
/// - Symbol: Symbol.
/// - TamilSangamMN: TamilSangamMN.
/// - TamilSangamMNBold: TamilSangamMN Bold.
/// - TeluguSangamMN: TeluguSangamMN.
/// - TeluguSangamMNBold: TeluguSangamMN Bold.
/// - Thonburi: Thonburi.
/// - ThonburiBold: Thonburi Bold.
/// - ThonburiLight: Thonburi Light.
/// - TimesNewRomanPSBoldItalicMT: TimesNewRomanPS Bold Italic MT.
/// - TimesNewRomanPSBoldMT: TimesNewRomanPS Bold MT.
/// - TimesNewRomanPSItalicMT: TimesNewRomanPS Italic MT.
/// - TimesNewRomanPSMT: TimesNewRomanPS MT.
/// - TrebuchetBoldItalic: Trebuchet Bold Italic.
/// - TrebuchetMS: TrebuchetMS.
/// - TrebuchetMSBold: TrebuchetMS Bold.
/// - TrebuchetMSItalic: TrebuchetMS Italic.
/// - Verdana: Verdana.
/// - VerdanaBold: Verdana Bold.
/// - VerdanaBoldItalic: Verdana Bold Italic.
/// - VerdanaItalic: Verdana Italic.
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
    case AmericanTypewriterSemiBold = "AmericanTypewriter-SemiBold"
    case AppleColorEmoji = "AppleColorEmoji"
    case AppleSDGothicNeoBold = "AppleSDGothicNeo-Bold"
    case AppleSDGothicNeoLight = "AppleSDGothicNeo-Light"
    case AppleSDGothicNeoMedium = "AppleSDGothicNeo-Medium"
    case AppleSDGothicNeoRegular = "AppleSDGothicNeo-Regular"
    case AppleSDGothicNeoSemiBold = "AppleSDGothicNeo-SemiBold"
    case AppleSDGothicNeoThin = "AppleSDGothicNeo-Thin"
    case AppleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight"
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
    case AvenirHeavy = "Avenir-Heavy"
    case AvenirHeavyOblique = "Avenir-HeavyOblique"
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
    case FuturaBold = "Futura-Bold"
    case FuturaCondensedExtraBold = "Futura-ExtraBold"
    case FuturaCondensedMedium = "Futura-CondensedMedium"
    case FuturaMedium = "Futura-Medium"
    case FuturaMediumItalic = "Futura-MediumItalic"
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
    case GillSansSemiBold = "GillSans-SemiBold"
    case GillSansSemiBoldItalic = "GillSans-SemiBoldItalic"
    case GillSansUltraBold = "GillSans-UltraBold"
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
    case HiraginoSansW3 = "HiraginoSans-W3"
    case HiraginoSansW6 = "HiraginoSans-W6"
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
    case KhmerSangamMN = "KhmerSangamMN"
    case KohinoorBanglaLight = "KohinoorBangla-Light"
    case KohinoorBanglaMedium = "KohinoorBangla-Medium"
    case KohinoorBanglaRegular = "KohinoorBangla-Regular"
    case KohinoorBanglaSemiBold = "KohinoorBangla-SemiBold"
    case KohinoorDevanagariBook = "KohinoorDevanagari-Book"
    case KohinoorDevanagariLight = "KohinoorDevanagari-Light"
    case KohinoorDevanagariMedium = "KohinoorDevanagari-Medium"
    case KohinoorDevanagariRegular = "KohinoorDevanagari-Regular"
    case KohinoorDevanagariSemiBold = "KohinoorDevanagari-SemiBold"
    case KohinoorTeluguLight = "KohinoorTelugu-Light"
    case KohinoorTeluguMedium = "KohinoorTelugu-Medium"
    case KohinoorTeluguRegular = "KohinoorTelugu-Regular"
    case LaoSangamMN = "LaoSangamMN"
    case MalayalamSangamMN = "MalayalamSangamMN"
    case MalayalamSangamMNBold = "MalayalamSangamMN-Bold"
    case MarkerFeltThin = "MarkerFelt-Thin"
    case MarkerFeltWide = "MarkerFelt-Wide"
    case MenloBold = "Menlo-Bold"
    case MenloBoldItalic = "Menlo-BoldItalic"
    case MenloItalic = "Menlo-Italic"
    case MenloRegular = "Menlo-Regular"
    case MyanmarSangamMN = "MyanmarSangamMN"
    case MyanmarSangamMNBold = "MyanmarSangamMN-Bold"
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
    case PingFangHKLight = "PingFangHK-Light"
    case PingFangHKMedium = "PingFangHK-Medium"
    case PingFangHKRegular = "PingFangHK-Regular"
    case PingFangHKSemiBold = "PingFangHK-SemiBold"
    case PingFangHKThin = "PingFangHK-Thin"
    case PingFangHKUltraLight = "PingFangHK-UltraLight"
    case PingFangSCLight = "PingFangSC-Light"
    case PingFangSCMedium = "PingFangSC-Medium"
    case PingFangSCRegular = "PingFangSC-Regular"
    case PingFangSCSemiBold = "PingFangSC-SemiBold"
    case PingFangSCThin = "PingFangSC-Thin"
    case PingFangSCUltraLight = "PingFangSC-UltraLight"
    case PingFangTCLight = "PingFangTC-Light"
    case PingFangTCMedium = "PingFangTC-Medium"
    case PingFangTCRegular = "PingFangTC-Regular"
    case PingFangTCSemiBold = "PingFangTC-SemiBold"
    case PingFangTCThin = "PingFangTC-Thin"
    case PingFangTCUltraLight = "PingFangTC-UltraLight"
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
}

// MARK: - UIFont extension

/// This extesion adds some useful functions to UIFont.
public extension UIFont {
    // MARK: - Variables
    
    /// All font family names available from iOS 7.0 to iOS 10.0.
    ///
    /// - AlNile: AlNile.
    /// - AmericanTypewriter: AmericanTypewriter.
    /// - AppleColorEmoji: AppleColorEmoji.
    /// - AppleSDGothicNeo: AppleSDGothicNeo.
    /// - Arial: Arial.
    /// - ArialHebrew: ArialHebrew.
    /// - ArialRoundedMTBold: ArialRoundedMTBold.
    /// - Avenir: Avenir.
    /// - AvenirNext: AvenirNext.
    /// - AvenirNextCondensed: AvenirNextCondensed.
    /// - BanglaSangamMN: BanglaSangamMN.
    /// - Baskerville: Baskerville.
    /// - Bodoni72: Bodoni72.
    /// - Bodoni72Oldstyle: Bodoni72Oldstyle.
    /// - Bodoni72Smallcaps: Bodoni72Smallcaps.
    /// - BodoniOrnaments: BodoniOrnaments.
    /// - BradleyHand: BradleyHand.
    /// - ChalkboardSE: ChalkboardSE.
    /// - Chalkduster: Chalkduster.
    /// - Cochin: Cochin.
    /// - Copperplate: Copperplate.
    /// - Courier: Courier.
    /// - CourierNew: CourierNew.
    /// - Damascus: Damascus.
    /// - DevanagariSangamMN: DevanagariSangamMN.
    /// - Didot: Didot.
    /// - DINAlternate: DINAlternate.
    /// - DINCondensed: DINCondensed.
    /// - EuphemiaUCAS: EuphemiaUCAS.
    /// - Farah: Farah.
    /// - Futura: Futura.
    /// - GeezaPro: GeezaPro.
    /// - Georgia: Georgia.
    /// - GillSans: GillSans.
    /// - GujaratiSangamMN: GujaratiSangamMN.
    /// - GurmukhiMN: GurmukhiMN.
    /// - HeitiSC: HeitiSC.
    /// - HeitiTC: HeitiTC.
    /// - Helvetica: Helvetica.
    /// - HelveticaNeue: HelveticaNeue.
    /// - HiraginoKakuGothicProN: HiraginoKakuGothicProN.
    /// - HiraginoMinchoProN: HiraginoMinchoProN.
    /// - HiraginoSansW3: HiraginoSansW3.
    /// - HiraginoSansW6: HiraginoSansW6.
    /// - HoeflerText: HoeflerText.
    /// - IowanOldStyle: IowanOldStyle.
    /// - Kailasa: Kailasa.
    /// - KannadaSangamMN: KannadaSangamMN.
    /// - KhmerSangamMN: KhmerSangamMN.
    /// - KohinoorBangla: KohinoorBangla.
    /// - KohinoorDevanagari: KohinoorDevanagari.
    /// - KohinoorTelugu KohinoorTelugu.
    /// - LaoSangamMN: LaoSangamMN.
    /// - MalayalamSangamMN: MalayalamSangamMN.
    /// - Marion: Marion.
    /// - MarkerFelt: MarkerFelt.
    /// - Menlo: Menlo.
    /// - Mishafi: Mishafi.
    /// - MyanmarSangamMN: MyanmarSangamMN.
    /// - Noteworthy: Noteworthy.
    /// - Optima: Optima.
    /// - OriyaSangamMN: OriyaSangamMN.
    /// - Palatino: Palatino.
    /// - Papyrus: Papyrus.
    /// - PartyLET: PartyLET.
    /// - PingFangHK: PingFangHK.
    /// - PingFangSC: PingFangSC.
    /// - PingFangTC: PingFangTC.
    /// - SavoyeLET: SavoyeLET.
    /// - SinhalaSangamMN: SinhalaSangamMN.
    /// - SnellRoundhand: SnellRoundhand.
    /// - Superclarendon: Superclarendon.
    /// - Symbol: Symbol.
    /// - TamilSangamMN: TamilSangamMN.
    /// - TeluguSangamMN: TeluguSangamMN.
    /// - Thonburi: Thonburi.
    /// - TimesNewRoman: TimesNewRoman.
    /// - TrebuchetMS: TrebuchetMS.
    /// - Verdana: Verdana.
    /// - ZapfDingbats: ZapfDingbats.
    /// - Zapfino: Zapfino.
    /// - AcademyEngravedLET: AcademyEngravedLET.
    public enum FamilyFontName: String {
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
        case HiraginoSansW3 = "Hiragino Sans W3"
        case HiraginoSansW6 = "Hiragino Sans W6"
        case HoeflerText = "Hoefler Text"
        case Kailasa = "Kailasa"
        case KannadaSangamMN = "Kannada Sangam MN"
        case KhmerSangamMN = "Khmer Sangam MN"
        case KohinoorBangla = "Kohinoor Bangla"
        case KohinoorDevanagari = "Kohinoor Devanagari"
        case KohinoorTelugu = "Kohinoor Telugu"
        case LaoSangamMN = "Lao Sangam MN"
        case MalayalamSangamMN = "Malayalam Sangam MN"
        case MarkerFelt = "Marker Felt"
        case Menlo = "Menlo"
        case Mishafi = "Mishafi"
        case MyanmarSangamMN = "Myanmar Sangam MN"
        case Noteworthy = "Noteworthy"
        case Optima = "Optima"
        case OriyaSangamMN = "Oriya Sangam MN"
        case Palatino = "Palatino"
        case Papyrus = "Papyrus"
        case PartyLET = "Party LET"
        case PingFangHK = "PingFangHK"
        case PingFangSC = "PingFangSC"
        case PingFangTC = "PingFangTC"
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
        case AcademyEngravedLET = "Academy Engraved LET"
    }
    
    /// Static light font to use in App.
    ///
    /// Default is HelveticaNeueLight of size 12.
    @nonobjc public static var lightFont: UIFont = UIFont(fontName: .HelveticaNeueLight, size: 12)
    
    /// Static regular font to use in App.
    ///
    /// Default is HelveticaNeue of size 12.
    @nonobjc public static var regularFont: UIFont = UIFont(fontName: .HelveticaNeue, size: 12)
    
    /// Static bold font to use in App.
    ///
    /// Default is HelveticaNeueBold of size 12.
    @nonobjc public static var boldFont: UIFont = UIFont(fontName: .HelveticaNeueBold, size: 12)
    
    // MARK: - Functions
    
    /// Create an UIFont object from the given font name and size.
    ///
    /// - Parameters:
    ///   - fontName: Font name.
    ///   - size:     Size of the font.
    public convenience init(fontName: FontName, size: CGFloat) {
        self.init(name: fontName.rawValue, size: size)!
    }
    
    /// Print in console all family and font names.
    ///
    /// - Returns: Returns all the font family names.
    public static func allFonts() -> [String: [Any]] {
        var fontFamilies = UIFont.familyNames
        fontFamilies.sort { $0 > $1 }
        
        var fontFamilyDictionary: [String: [Any]] = Dictionary()
        
        for i in 0 ..< fontFamilies.count {
            let fontFamily: String = fontFamilies[i]
            let fontNames: Array = UIFont.fontNames(forFamilyName: fontFamily)
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
    public static func calculateHeight(width: CGFloat, font: UIFont, text: String) -> CGFloat {
        var size: CGSize = CGSize.zero
        if text.length > 0 {
            let frame: CGRect = text.boundingRect(with: CGSize(width: width, height: 999999), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil)
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
    public static func calculateHeight(width: CGFloat, font: FontName, fontSize: CGFloat, text: String) -> CGFloat {
        let font = UIFont(fontName: font, size: fontSize)
        return self.calculateHeight(width: width, font: font, text: text)
    }
    
    /// Print in console all font names for a given family.
    ///
    /// - Parameter familyFontName: Family fonts.
    /// - Returns: Returns all fonts for the given family.
    public static func fontsName(family: FamilyFontName) -> [Any] {
        return UIFont.fontNames(forFamilyName: family.rawValue)
    }
}
