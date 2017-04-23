//
//  UIFontExtension.swift
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

// MARK: - Global variables

/// All font names for all family available from iOS 7.0 to iOS 10.0.
///
/// - academyEngravedLetPlain: AcademyEngravedLetPlain.
/// - alNile: AlNile.
/// - alNileBold: AlNile Bold.
/// - americanTypewriter: AmericanTypewriter.
/// - americanTypewriterBold: AmericanTypewriter Bold.
/// - americanTypewriterCondensed: AmericanTypewriter Condensed.
/// - americanTypewriterCondensedBold: AmericanTypewriter Condensed Bold.
/// - americanTypewriterCondensedLight: AmericanTypewriter Condensed Light.
/// - americanTypewriterLight: AmericanTypewriter Light.
/// - americanTypewriterSemiBold: AmericanTypewriter Semi Bold.
/// - appleColorEmoji: AppleColorEmoji.
/// - appleSDGothicNeoBold: AppleSDGothicNeo Bold.
/// - appleSDGothicNeoLight: AppleSDGothicNeo Light.
/// - appleSDGothicNeoMedium: AppleSDGothicNeo Medium.
/// - appleSDGothicNeoRegular: AppleSDGothicNeo Regular.
/// - appleSDGothicNeoSemiBold: AppleSDGothicNeo Semi Bold.
/// - appleSDGothicNeoThin: AppleSDGothicNeo Thin.
/// - appleSDGothicNeoUltraLight: AppleSDGothicNeo Ultra Light.
/// - arialBoldItalicMT: Arial Bold Italic MT.
/// - arialBoldMT: Arial Bold MT.
/// - arialHebrew: ArialHebrew.
/// - arialHebrewBold: ArialHebrew Bold.
/// - arialHebrewLight: ArialHebrew Light.
/// - arialItalicMT: Arial Italic MT.
/// - arialMT: Arial MT.
/// - arialRoundedMTBold: Arial Rounded MT Bold.
/// - astHeitiLight: ASTHeiti Light.
/// - astHeitiMedium: ASTHeiti Medium.
/// - avenirBlack: AvenirBlack.
/// - avenirBlackOblique: AvenirBlack Oblique.
/// - avenirBook: AvenirBook.
/// - avenirBookOblique: AvenirBook Oblique.
/// - avenirHeavy: AvenirHeavy.
/// - avenirHeavyOblique: AvenirHeavy Oblique.
/// - avenirLight: AvenirLight.
/// - avenirLightOblique: AvenirLight Oblique.
/// - avenirMedium: AvenirMedium.
/// - avenirMediumOblique: AvenirMedium Oblique.
/// - avenirNextBold: AvenirNext Bold.
/// - avenirNextBoldItalic: AvenirNext Bold Italic.
/// - avenirNextCondensedBold: AvenirNextCondensed Bold.
/// - avenirNextCondensedBoldItalic: AvenirNextCondensed Bold Italic.
/// - avenirNextCondensedDemiBold: AvenirNextCondensed Demi Bold.
/// - avenirNextCondensedDemiBoldItalic: AvenirNextCondensed Demi Bold Italic.
/// - aAvenirNextCondensedHeavy: AvenirNextCondensed Heavy.
/// - avenirNextCondensedHeavyItalic: AvenirNextCondensed Heavy Italic.
/// - avenirNextCondensedItalic: AvenirNextCondensed Italic.
/// - avenirNextCondensedMedium: AvenirNextCondensed Medium.
/// - avenirNextCondensedMediumItalic: AvenirNextCondensed Medium Italic.
/// - avenirNextCondensedRegular: AvenirNextCondensed Regular.
/// - avenirNextCondensedUltraLight: AvenirNextCondensed Ultra Light.
/// - avenirNextCondensedUltraLightItalic: AvenirNextCondensed Ultra Light Italic.
/// - avenirNextDemiBold: AvenirNextDemi Bold.
/// - avenirNextDemiBoldItalic: AvenirNextDemi Bold Italic.
/// - avenirNextHeavy: AvenirNext Heavy.
/// - avenirNextItalic: AvenirNext Italic.
/// - avenirNextMedium: AvenirNext Medium.
/// - avenirNextMediumItalic: AvenirNext Medium Italic.
/// - avenirNextRegular: AvenirNext Regular.
/// - avenirNextUltraLight: AvenirNext Ultra Light.
/// - avenirNextUltraLightItalic: AvenirNext Ultra Light Italic.
/// - avenirOblique: Avenir Oblique.
/// - avenirRoman: Avenir Roman.
/// - baskerville: Baskerville.
/// - baskervilleBold: Baskerville Bold.
/// - baskervilleBoldItalic: Baskerville Bold Italic.
/// - baskervilleItalic: Baskerville Italic.
/// - baskervilleSemiBold: Baskerville Semi Bold.
/// - baskervilleSemiBoldItalic: Baskerville Semi Bold Italic.
/// - bodoniOrnamentsITCTT: BodoniOrnamentsITCTT.
/// - bodoniSvtyTwoITCTTBold: BodoniSvtyTwoITCTT Bold.
/// - bodoniSvtyTwoITCTTBook: BodoniSvtyTwoITCTT Book.
/// - bodoniSvtyTwoITCTTBookIta: BodoniSvtyTwoITCTT Book Ita.
/// - bodoniSvtyTwoOSITCTTBold: BodoniSvtyTwoOSITCTT Bold.
/// - bodoniSvtyTwoOSITCTTBook: BodoniSvtyTwoOSITCTT Book.
/// - bodoniSvtyTwoOSITCTTBookIt: BodoniSvtyTwoOSITCTT Book It.
/// - bodoniSvtyTwoSCITCTTBook: BodoniSvtyTwoSCITCTT Book.
/// - bradleyHandITCTTBold: BradleyHandITCTT Bold.
/// - chalkboardSEBold: ChalkboardSE Bold.
/// - chalkboardSELight: ChalkboardSE Light.
/// - chalkboardSERegular: ChalkboardSE Regular.
/// - chalkduster: Chalkduster.
/// - cochin: Cochin.
/// - cochinBold: Cochin Bold.
/// - cochinBoldItalic: Cochin Bold Italic.
/// - cochinItalic: Cochin Italic.
/// - copperplate: Copperplate.
/// - copperplateBold: Copperplate Bold.
/// - copperplateLight: Copperplate Light.
/// - courier: Courier.
/// - courierBold: Courier Bold.
/// - courierBoldOblique: Courier Bold Oblique.
/// - courierNewPSBoldItalicMT: CourierNewPS Bold Italic MT.
/// - courierNewPSBoldMT: CourierNewPS Bold MT.
/// - courierNewPSItalicMT: CourierNewPS Italic MT.
/// - courierNewPSMT: CourierNewPS MT.
/// - courierOblique: Courier Oblique.
/// - damascus: Damascus.
/// - damascusBold: Damascus Bold.
/// - damascusMedium: Damascus Medium.
/// - damascusSemiBold: Damascus Semi Bold.
/// - devanagariSangamMN: DevanagariSangamMN.
/// - devanagariSangamMNBold: DevanagariSangamMN Bold.
/// - didot: Didot.
/// - didotBold: Didot Bold.
/// - didotItalic: Didot Italic.
/// - diwanMishafi: DiwanMishafi..
/// - euphemiaUCAS: EuphemiaUCAS.
/// - euphemiaUCASBold: EuphemiaUCAS Bold.
/// - euphemiaUCASItalic: EuphemiaUCAS Italic.
/// - farah: Farah.
/// - futuraBold: Futura Bold.
/// - futuraCondensedExtraBold: Futura Condensed Extra Bold.
/// - futuraCondensedMedium: Futura Condensed Medium.
/// - futuraMedium: Futura Medium.
/// - futuraMediumItalic: Futura Medium Italic.
/// - geezaPro: GeezaPro.
/// - geezaProBold: GeezaPro Bold.
/// - geezaProLight: GeezaPro Light.
/// - georgia: Georgia.
/// - georgiaBold: Georgia Bold.
/// - georgiaBoldItalic: Georgia Bold Italic.
/// - georgiaItalic: Georgia Italic.
/// - gillSans: GillSans.
/// - gillSansBold: GillSans Bold.
/// - gillSansBoldItalic: GillSans Bold Italic.
/// - gillSansItalic: GillSans Italic.
/// - gillSansLight: GillSans Light.
/// - gillSansLightItalic: GillSans Light Italic.
/// - gillSansSemiBold: GillSans Semi Bold.
/// - gillSansSemiBoldItalic: GillSans Semi Bold Italic.
/// - gillSansUltraBold: GillSans Ultra Bold.
/// - gujaratiSangamMN: GujaratiSangamMN.
/// - gujaratiSangamMNBold: GujaratiSangamMN Bold.
/// - gurmukhiMN: GurmukhiMN.
/// - gurmukhiMNBold: GurmukhiMN Bold.
/// - helvetica: Helvetica.
/// - helveticaBold: Helvetica Bold.
/// - helveticaBoldOblique: Helvetica Bold Oblique.
/// - helveticaLight: Helvetica Light.
/// - helveticaLightOblique: Helvetica Light Oblique.
/// - helveticaNeue: HelveticaNeue.
/// - helveticaNeueBold: HelveticaNeue Bold.
/// - helveticaNeueBoldItalic: HelveticaNeue Bold Italic.
/// - helveticaNeueCondensedBlack: HelveticaNeue Condensed Black.
/// - helveticaNeueCondensedBold: HelveticaNeue Condensed Bold.
/// - helveticaNeueItalic: HelveticaNeue Italic.
/// - helveticaNeueLight: HelveticaNeue Light.
/// - helveticaNeueMedium: HelveticaNeue Medium.
/// - helveticaNeueMediumItalic: HelveticaNeue Medium Italic.
/// - helveticaNeueThin: HelveticaNeue Thin.
/// - helveticaNeueThinItalic: HelveticaNeue Thin Italic.
/// - helveticaNeueUltraLight: HelveticaNeue Ultra Light.
/// - helveticaNeueUltraLightItalic: HelveticaNeue Ultra Light Italic.
/// - helveticaOblique: Helvetica Oblique.
/// - hiraginoSansW3: HiraginoSansW3.
/// - hiraginoSansW6: HiraginoSansW6.
/// - hiraKakuProNW3: HiraKakuProNW3.
/// - hiraKakuProNW6: HiraKakuProNW6.
/// - hiraMinProNW3: HiraMinProNW3.
/// - hiraMinProNW6: HiraMinProNW6.
/// - hoeflerTextBlack: HoeflerTextBlack.
/// - hoeflerTextBlackItalic: HoeflerTextBlack Italic.
/// - hoeflerTextItalic: HoeflerText Italic.
/// - hoeflerTextRegular: HoeflerText Regular.
/// - kailasa: Kailasa.
/// - kailasaBold: Kailasa Bold.
/// - kannadaSangamMN: KannadaSangamMN.
/// - kannadaSangamMNBold: KannadaSangamMN Bold.
/// - khmerSangamMN: KhmerSangamMN.
/// - kohinoorBanglaLight: KohinoorBangla Light.
/// - kohinoorBanglaMedium: KohinoorBangla Medium.
/// - kohinoorBanglaRegular: KohinoorBangla Regular.
/// - kohinoorBanglaSemiBold: KohinoorBangla Semi Bold.
/// - kohinoorDevanagariBook: KohinoorDevanagari Book.
/// - kohinoorDevanagariLight: KohinoorDevanagari Light.
/// - kohinoorDevanagariMedium: KohinoorDevanagari Medium.
/// - ohinoorDevanagariRegular KohinoorDevanagari Regular.
/// - kohinoorDevanagariSemiBold KohinoorDevanagari Semi Bold.
/// - kohinoorTeluguLight: KohinoorTelugu Light.
/// - kohinoorTeluguMedium: KohinoorTelugu Medium.
/// - kohinoorTeluguRegular: KohinoorTelugu Regular.
/// - laoSangamMN: LaoSangamMN.
/// - malayalamSangamMN: MalayalamSangamMN.
/// - malayalamSangamMNBold: MalayalamSangamMN Bold.
/// - markerFeltThin: MarkerFelt Thin.
/// - markerFeltWide: MarkerFelt Wide.
/// - menloBold: MenloBold.
/// - menloBoldItalic: MenloBold Italic.
/// - menloItalic: Menlo Italic.
/// - menloRegular: Menlo Regular.
/// - myanmarSangamMN: MyanmarSangamMN.
/// - myanmarSangamMNBold: MyanmarSangamMN Bold.
/// - noteworthyBold: Noteworthy Bold.
/// - noteworthyLight: Noteworthy Light.
/// - optimaBold: Optima Bold.
/// - optimaBoldItalic: Optima Bold Italic.
/// - optimaExtraBlack: Optima Extra Black.
/// - optimaItalic: Optima Italic.
/// - optimaRegular: Optima Regular.
/// - oriyaSangamMN: OriyaSangamMN.
/// - oriyaSangamMNBold: OriyaSangamMN Bold.
/// - palatinoBold: Palatino Bold.
/// - palatinoBoldItalic: Palatino Bold Italic.
/// - palatinoItalic: Palatino Italic.
/// - palatinoRoman: Palatino Roman.
/// - papyrus: Papyrus.
/// - papyrusCondensed: Papyrus Condensed.
/// - partyLetPlain: PartyLetPlain.
/// - pingFangHKLight: PingFangHK Light.
/// - pingFangHKMedium: PingFangHK Medium.
/// - pingFangHKRegular: PingFangHK Regular.
/// - pingFangHKSemiBold: PingFangHK Semi Bold.
/// - pingFangHKThin: PingFangHK Thin.
/// - pingFangHKUltraLight: PingFangHK Ultra Light.
/// - pingFangSCLight: PingFangSC Light.
/// - pingFangSCMedium: PingFangSC Medium.
/// - pingFangSCRegular: PingFangSC Regular.
/// - pingFangSCSemiBold: PingFangSC Semi Bold.
/// - pingFangSCThin: PingFangSC Thin.
/// - pingFangSCUltraLight: PingFangSC Ultra Light.
/// - pingFangTCLight: PingFangTC Light.
/// - pingFangTCMedium: PingFangTC Medium.
/// - pingFangTCRegular: PingFangTC Regular.
/// - pingFangTCSemiBold: PingFangTC Semi Bold.
/// - pingFangTCThin: PingFangTC Thin.
/// - pingFangTCUltraLight: PingFangTC Ultra Light.
/// - savoyeLetPlain: SavoyeLetPlain.
/// - sinhalaSangamMN: SinhalaSangamMN.
/// - sinhalaSangamMNBold: SinhalaSangamMN Bold.
/// - snellRoundhand: SnellRoundhand.
/// - snellRoundhandBlack: SnellRoundhand Black.
/// - snellRoundhandBold: SnellRoundhand Bold.
/// - stHeitiSCLight: STHeitiSC Light.
/// - stHeitiSCMedium: STHeitiSC Medium.
/// - stHeitiTCLight: STHeitiTC Light.
/// - stHeitiTCMedium: STHeitiTC Medium.
/// - symbol: Symbol.
/// - tamilSangamMN: TamilSangamMN.
/// - tamilSangamMNBold: TamilSangamMN Bold.
/// - teluguSangamMN: TeluguSangamMN.
/// - teluguSangamMNBold: TeluguSangamMN Bold.
/// - thonburi: Thonburi.
/// - thonburiBold: Thonburi Bold.
/// - thonburiLight: Thonburi Light.
/// - timesNewRomanPSBoldItalicMT: TimesNewRomanPS Bold Italic MT.
/// - timesNewRomanPSBoldMT: TimesNewRomanPS Bold MT.
/// - timesNewRomanPSItalicMT: TimesNewRomanPS Italic MT.
/// - timesNewRomanPSMT: TimesNewRomanPS MT.
/// - trebuchetBoldItalic: Trebuchet Bold Italic.
/// - trebuchetMS: TrebuchetMS.
/// - trebuchetMSBold: TrebuchetMS Bold.
/// - trebuchetMSItalic: TrebuchetMS Italic.
/// - verdana: Verdana.
/// - verdanaBold: Verdana Bold.
/// - verdanaBoldItalic: Verdana Bold Italic.
/// - verdanaItalic: Verdana Italic.
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
    case geezaProLight = "GeezaPro-Light"
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
    case helveticaNeueMedium = "HelveticaNeue-Medium"
    case helveticaNeueMediumItalic = "HelveticaNeue-MediumItalic"
    case helveticaNeueThin = "HelveticaNeue-Thin"
    case helveticaNeueThinItalic = "HelveticaNeue-ThinItalic"
    case helveticaNeueUltraLight = "HelveticaNeue-UltraLight"
    case helveticaNeueUltraLightItalic = "HelveticaNeue-UltraLightItalic"
    case helveticaOblique = "Helvetica-Oblique"
    case hiraginoSansW3 = "HiraginoSans-W3"
    case hiraginoSansW6 = "HiraginoSans-W6"
    case hiraKakuProNW3 = "HiraKakuProN-W3"
    case hiraKakuProNW6 = "HiraKakuProN-W6"
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
    case khmerSangamMN = "KhmerSangamMN"
    case kohinoorBanglaLight = "KohinoorBangla-Light"
    case kohinoorBanglaMedium = "KohinoorBangla-Medium"
    case kohinoorBanglaRegular = "KohinoorBangla-Regular"
    case kohinoorBanglaSemiBold = "KohinoorBangla-SemiBold"
    case kohinoorDevanagariBook = "KohinoorDevanagari-Book"
    case kohinoorDevanagariLight = "KohinoorDevanagari-Light"
    case kohinoorDevanagariMedium = "KohinoorDevanagari-Medium"
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
    case timesNewRomanPSBoldItalicMT = "TimesNewRomanPS-BoldItalic"
    case timesNewRomanPSBoldMT = "TimesNewRomanPS-Bold"
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
}

// MARK: - UIFont extension

/// This extesion adds some useful functions to UIFont.
public extension UIFont {
    // MARK: - Variables
    
    /// All font family names available from iOS 7.0 to iOS 10.0.
    ///
    /// - academyEngravedLET: AcademyEngravedLET.
    /// - alNile: AlNile.
    /// - americanTypewriter: AmericanTypewriter.
    /// - appleColorEmoji: AppleColorEmoji.
    /// - appleSDGothicNeo: AppleSDGothicNeo.
    /// - arial: Arial.
    /// - arialHebrew: ArialHebrew.
    /// - arialRoundedMTBold: ArialRoundedMTBold.
    /// - avenir: Avenir.
    /// - avenirNext: AvenirNext.
    /// - avenirNextCondensed: AvenirNextCondensed.
    /// - banglaSangamMN: BanglaSangamMN.
    /// - baskerville: Baskerville.
    /// - bodoni72: Bodoni72.
    /// - bodoni72Oldstyle: Bodoni72Oldstyle.
    /// - bodoni72Smallcaps: Bodoni72Smallcaps.
    /// - bodoniOrnaments: BodoniOrnaments.
    /// - bradleyHand: BradleyHand.
    /// - chalkboardSE: ChalkboardSE.
    /// - chalkduster: Chalkduster.
    /// - cochin: Cochin.
    /// - copperplate: Copperplate.
    /// - courier: Courier.
    /// - courierNew: CourierNew.
    /// - damascus: Damascus.
    /// - devanagariSangamMN: DevanagariSangamMN.
    /// - didot: Didot.
    /// - dINAlternate: DINAlternate.
    /// - dINCondensed: DINCondensed.
    /// - euphemiaUCAS: EuphemiaUCAS.
    /// - farah: Farah.
    /// - futura: Futura.
    /// - geezaPro: GeezaPro.
    /// - georgia: Georgia.
    /// - gillSans: GillSans.
    /// - gujaratiSangamMN: GujaratiSangamMN.
    /// - gurmukhiMN: GurmukhiMN.
    /// - heitiSC: HeitiSC.
    /// - heitiTC: HeitiTC.
    /// - helvetica: Helvetica.
    /// - helveticaNeue: HelveticaNeue.
    /// - hiraginoKakuGothicProN: HiraginoKakuGothicProN.
    /// - hiraginoMinchoProN: HiraginoMinchoProN.
    /// - hiraginoSansW3: HiraginoSansW3.
    /// - hiraginoSansW6: HiraginoSansW6.
    /// - hoeflerText: HoeflerText.
    /// - iowanOldStyle: IowanOldStyle.
    /// - kailasa: Kailasa.
    /// - kannadaSangamMN: KannadaSangamMN.
    /// - khmerSangamMN: KhmerSangamMN.
    /// - kohinoorBangla: KohinoorBangla.
    /// - kohinoorDevanagari: KohinoorDevanagari.
    /// - kohinoorTelugu KohinoorTelugu.
    /// - laoSangamMN: LaoSangamMN.
    /// - malayalamSangamMN: MalayalamSangamMN.
    /// - marion: Marion.
    /// - markerFelt: MarkerFelt.
    /// - menlo: Menlo.
    /// - mishafi: Mishafi.
    /// - myanmarSangamMN: MyanmarSangamMN.
    /// - noteworthy: Noteworthy.
    /// - optima: Optima.
    /// - oriyaSangamMN: OriyaSangamMN.
    /// - palatino: Palatino.
    /// - papyrus: Papyrus.
    /// - partyLET: PartyLET.
    /// - pingFangHK: PingFangHK.
    /// - pingFangSC: PingFangSC.
    /// - pingFangTC: PingFangTC.
    /// - savoyeLET: SavoyeLET.
    /// - sinhalaSangamMN: SinhalaSangamMN.
    /// - snellRoundhand: SnellRoundhand.
    /// - superclarendon: Superclarendon.
    /// - symbol: Symbol.
    /// - tamilSangamMN: TamilSangamMN.
    /// - teluguSangamMN: TeluguSangamMN.
    /// - thonburi: Thonburi.
    /// - timesNewRoman: TimesNewRoman.
    /// - trebuchetMS: TrebuchetMS.
    /// - verdana: Verdana.
    /// - zapfDingbats: ZapfDingbats.
    /// - zapfino: Zapfino.
    public enum FamilyFontName: String {
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
        case hiraginoKakuGothicProN = "Hiragino Kaku Gothic ProN"
        case hiraginoMinchoProN = "Hiragino Mincho ProN"
        case hiraginoSansW3 = "Hiragino Sans W3"
        case hiraginoSansW6 = "Hiragino Sans W6"
        case hoeflerText = "Hoefler Text"
        case kailasa = "Kailasa"
        case kannadaSangamMN = "Kannada Sangam MN"
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
        case optima = "Optima"
        case oriyaSangamMN = "Oriya Sangam MN"
        case palatino = "Palatino"
        case papyrus = "Papyrus"
        case partyLET = "Party LET"
        case pingFangHK = "PingFangHK"
        case pingFangSC = "PingFangSC"
        case pingFangTC = "PingFangTC"
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
    
    /// Static light font to use in App.
    ///
    /// Default is HelveticaNeueLight of size 12.
    @nonobjc public static var lightFont: UIFont = UIFont(fontName: .helveticaNeueLight, size: 12)
    
    /// Static regular font to use in App.
    ///
    /// Default is HelveticaNeue of size 12.
    @nonobjc public static var regularFont: UIFont = UIFont(fontName: .helveticaNeue, size: 12)
    
    /// Static bold font to use in App.
    ///
    /// Default is HelveticaNeueBold of size 12.
    @nonobjc public static var boldFont: UIFont = UIFont(fontName: .helveticaNeueBold, size: 12)
    
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
            let frame: CGRect = text.boundingRect(with: CGSize(width: width, height: 999999), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
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
