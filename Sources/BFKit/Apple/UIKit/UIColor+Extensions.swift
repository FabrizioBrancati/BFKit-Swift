//
//  UIColor+Extensions.swift
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
#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

// MARK: - Global functions

/// Create an UIColor or NSColor in format RGBA.
///
/// - Parameters:
///   - red: Red value.
///   - green: Green value.
///   - blue: Blue value.
///   - alpha: Alpha value.
/// - Returns: Returns the created UIColor or NSColor.
public func RGBA(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Float) -> Color {
    #if canImport(UIKit)
        return Color(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    #elseif canImport(AppKit)
        return Color(calibratedRed: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    #endif
}

/// Create an UIColor or NSColor in format ARGB.
///
/// - Parameters:
///   - alpha: Alpha value.
///   - red: Red value.
///   - green: Green value.
///   - blue: Blue value.
/// - Returns: Returns the created UIColor or NSColor.
public func ARGB( _ alpha: Float, _ red: Int, _ green: Int, _ blue: Int) -> Color {
    RGBA(red, green, blue, alpha)
}

/// Create an UIColor or NSColor in format RGB.
///
/// - Parameters:
///   - red: Red value.
///   - green: Green value.
///   - blue: Blue value.
/// - Returns: Returns the created UIColor or NSColor.
public func RGB(_ red: Int, _ green: Int, _ blue: Int) -> Color {
    #if canImport(UIKit)
        return Color(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    #elseif canImport(AppKit)
        return Color(calibratedRed: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    #endif
}

// MARK: - UIColor or NSColor extension

/// This extesion adds some useful functions to UIColor or NSColor.
public extension Color {
    // MARK: - Variables

    #if canImport(UIKit)
        /// RGB properties: red.
        var redComponent: CGFloat {
            guard canProvideRGBComponents(), let component = cgColor.__unsafeComponents else {
                return 0.0
            }

            return component[0]
        }

        /// RGB properties: green.
        var greenComponent: CGFloat {
            guard canProvideRGBComponents(), let component = cgColor.__unsafeComponents else {
                return 0.0
            }

            guard cgColor.colorSpace?.model == CGColorSpaceModel.monochrome else {
                return component[1]
            }
            return component[0]
        }

        /// RGB properties: blue.
        var blueComponent: CGFloat {
            guard canProvideRGBComponents(), let component = cgColor.__unsafeComponents else {
                return 0.0
            }

            guard cgColor.colorSpace?.model == CGColorSpaceModel.monochrome else {
                return component[2]
            }
            return component[0]
        }

        /// RGB properties: white.
        var whiteComponent: CGFloat {
            guard cgColor.colorSpace?.model == CGColorSpaceModel.monochrome, let component = cgColor.__unsafeComponents else {
                return 0.0
            }

            return component[0]
        }
    #endif

    /// RGB properties: luminance.
    var luminance: CGFloat {
        if canProvideRGBComponents() {
            var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0

            #if canImport(UIKit)
                getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            #elseif canImport(AppKit)
                if colorSpace.colorSpaceModel == .rgb {
                    getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                } else if colorSpace.colorSpaceModel == .gray {
                    var white: CGFloat = 0.0
                    getWhite(&white, alpha: &alpha)
                    red = white
                    green = white
                    blue = white
                }
            #endif

            return red * 0.2126 + green * 0.7152 + blue * 0.0722
        }
        return 0.0
    }

    /// RGBA properties: alpha.
    var alpha: CGFloat {
        return cgColor.alpha
    }

    /// HSB properties: hue.
    var hue: CGFloat {
        if canProvideRGBComponents() {
            var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0

            getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return hue
        }
        return 0.0
    }

    /// HSB properties: saturation.
    var saturation: CGFloat {
        if canProvideRGBComponents() {
            var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0

            getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return saturation
        }
        return 0.0
    }

    /// HSB properties: brightness.
    var brightness: CGFloat {
        if canProvideRGBComponents() {
            var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0

            getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return brightness
        }
        return 0.0
    }

    /// Returns the HEX string from UIColor or NSColor.
    var hex: String {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let redInt = (Int)(red * 255)
        let greenInt = (Int)(green * 255)
        let blueInt = (Int)(blue * 255)
        let rgb: Int = redInt << 16 | greenInt << 8 | blueInt << 0

        return String(format: "#%06x", rgb)
    }

    // MARK: - Functions

    /// Create a color from HEX with alpha.
    ///
    /// - Parameters:
    ///   - hex: HEX value.
    ///   - alpha: Alpha value.
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        #if canImport(UIKit)
            self.init(red: CGFloat(((hex & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((hex & 0xFF00) >> 8)) / 255.0, blue: CGFloat((hex & 0xFF)) / 255.0, alpha: alpha)
        #elseif canImport(AppKit)
            self.init(calibratedRed: CGFloat(((hex & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((hex & 0xFF00) >> 8)) / 255.0, blue: CGFloat((hex & 0xFF)) / 255.0, alpha: alpha)
        #endif
    }

    /// Create a color from a HEX string.
    /// It supports the following type:
    /// - #ARGB, ARGB if alphaFirst is true. #RGBA, RGBA if alphaFirst is false.
    /// - #ARGB.
    /// - #RRGGBB.
    /// - #AARRGGBB, AARRGGBB if alphaFirst is true. #RRGGBBAA, RRGGBBAA if firstIsAlpha is false.
    ///
    /// - Parameters:
    ///   - hexString: HEX string.
    ///   - alphaFirst: Set it to true if alpha value is the first in the HEX string. If alpha value is the last one, set it to false. Default is false.
    convenience init(hex: String, alphaFirst: Bool = false) {
        let colorString: String = hex.replacingOccurrences(of: "#", with: "").uppercased()
        var alpha: CGFloat = 1.0, red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0

        switch colorString.count {
        case 3: /// RGB
            alpha = 1.0
            red = Color.colorComponent(fromString: colorString, range: 0..<1)
            green = Color.colorComponent(fromString: colorString, range: 1..<2)
            blue = Color.colorComponent(fromString: colorString, range: 2..<3)
        case 4: /// ARGB if alphaFirst is true, otherwise RGBA.
            if alphaFirst {
                alpha = Color.colorComponent(fromString: colorString, range: 0..<1)
                red = Color.colorComponent(fromString: colorString, range: 1..<2)
                green = Color.colorComponent(fromString: colorString, range: 2..<3)
                blue = Color.colorComponent(fromString: colorString, range: 3..<4)
            } else {
                red = Color.colorComponent(fromString: colorString, range: 0..<1)
                green = Color.colorComponent(fromString: colorString, range: 1..<2)
                blue = Color.colorComponent(fromString: colorString, range: 2..<3)
                alpha = Color.colorComponent(fromString: colorString, range: 3..<4)
            }
        case 6: /// RRGGBB
            alpha = 1.0
            red = Color.colorComponent(fromString: colorString, range: 0..<2)
            green = Color.colorComponent(fromString: colorString, range: 2..<4)
            blue = Color.colorComponent(fromString: colorString, range: 4..<6)
        case 8: /// AARRGGBB if alphaFirst is true, otherwise RRGGBBAA.
            if alphaFirst {
                alpha = Color.colorComponent(fromString: colorString, range: 0..<2)
                red = Color.colorComponent(fromString: colorString, range: 2..<4)
                green = Color.colorComponent(fromString: colorString, range: 4..<6)
                blue = Color.colorComponent(fromString: colorString, range: 6..<8)
            } else {
                red = Color.colorComponent(fromString: colorString, range: 0..<2)
                green = Color.colorComponent(fromString: colorString, range: 2..<4)
                blue = Color.colorComponent(fromString: colorString, range: 4..<6)
                alpha = Color.colorComponent(fromString: colorString, range: 6..<8)
            }

        default:
            break
        }

        #if canImport(UIKit)
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        #elseif canImport(AppKit)
            self.init(calibratedRed: red, green: green, blue: blue, alpha: alpha)
        #endif
    }

    /// A good contrasting color, it will be either black or white.
    ///
    /// - Returns: Returns the color.
    func contrasting() -> Color {
        luminance > 0.5 ? Color.black : Color.white
    }

    /// A complementary color that should look good.
    ///
    /// - Returns: Returns the color.
    func complementary() -> Color? {
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0

        #if canImport(UIKit)
            guard getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
                return nil
            }
        #elseif canImport(AppKit)
            getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        #endif

        hue += 180
        if hue > 360 {
            hue -= 360
        }

        return Color(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }

    /// Check if the color is in RGB format.
    ///
    /// - Returns: Returns if the color is in RGB format.
    func canProvideRGBComponents() -> Bool {
        guard let colorSpace = cgColor.colorSpace else {
            return false
        }
        switch colorSpace.model {
        case CGColorSpaceModel.rgb, CGColorSpaceModel.monochrome:
            return true

        default:
            return false
        }
    }

    /// Returns the color component from the string.
    ///
    /// - Parameters:
    ///   - fromString: String to convert.
    ///   - start: Component start index.
    ///   - lenght: Component lenght.
    /// - Returns: Returns the color component from the string.
    private static func colorComponent(fromString string: String, range: Range<Int>) -> CGFloat {
        let substring: String = string.substring(with: range)
        let fullHex = (range.upperBound - range.lowerBound) == 2 ? substring : "\(substring)\(substring)"
        var hexComponent: CUnsignedInt = 0
        Scanner(string: fullHex).scanHexInt32(&hexComponent)

        return CGFloat(hexComponent) / 255.0
    }

    /// Create a random color.
    ///
    /// - Parameter alpha: Alpha value.
    /// - Returns: Returns the UIColor or NSColor instance.
    static func random(alpha: CGFloat = 1.0) -> Color {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)

        return Color(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }

    /// Create an UIColor or NSColor from a given string. Example: "blue" or hex string.
    ///
    /// - Parameter color: String with color.
    /// - Returns: Returns the created UIColor or NSColor.
    static func color(string color: String) -> Color {
        if color.count >= 3 {
            if Color.responds(to: Selector(color.lowercased() + "Color")) {
                return convertColor(string: color)
            } else {
                return Color(hex: color)
            }
        } else {
            return Color.black
        }
    }

    #if canImport(UIKit)
        /// Create an UIColor from a given string like "blue" or an hex string.
        ///
        /// - Parameter color: String with color.
        convenience init(string color: String) {
            if UIColor.responds(to: Selector(color.lowercased() + "Color")) {
                self.init(cgColor: UIColor.convertColor(string: color).cgColor)
            } else {
                self.init(hex: color)
            }
        }
    #elseif canImport(AppKit)
        /// Create a NSColor from a given string like "blue" or an hex string.
        ///
        /// - Parameter color: String with color.
        convenience init?(string color: String) {
            if NSColor.responds(to: Selector(color.lowercased() + "Color")) {
                self.init(cgColor: NSColor.convertColor(string: color).cgColor)
            } else {
                self.init(hex: color)
            }
        }
    #endif

    /// Used the retrive the color from the string color ("blue" or "red").
    ///
    /// - Parameter color: String with the color.
    /// - Returns: Returns the created UIColor or NSColor.
    private static func convertColor(string color: String) -> Color {
        let color = color.lowercased()

        switch color {
        case "black":
            return Color.black
        case "darkgray":
            return Color.darkGray
        case "lightgray":
            return Color.lightGray
        case "white":
            return Color.white
        case "gray":
            return Color.gray
        case "red":
            return Color.red
        case "green":
            return Color.green
        case "blue":
            return Color.blue
        case "cyan":
            return Color.cyan
        case "yellow":
            return Color.yellow
        case "magenta":
            return Color.magenta
        case "orange":
            return Color.orange
        case "purple":
            return Color.purple
        case "brown":
            return Color.brown
        case "clear":
            return Color.clear

        default:
            return Color.clear
        }
    }

    /// Creates and returns a color object that has the same color space and component values as the given color, but has the specified alpha component.
    ///
    /// - Parameters:
    ///   - color: UIColor or NSColor value.
    ///   - alpha: Alpha value.
    /// - Returns: Returns an UIColor or NSColor instance.
    static func color(color: Color, alpha: CGFloat) -> Color {
        color.withAlphaComponent(alpha)
    }
}
