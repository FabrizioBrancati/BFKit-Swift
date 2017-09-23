//
//  UIColorExtension.swift
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
#if os(iOS) || os(watchOS)
    import UIKit
#elseif os(macOS)
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
    #if os(iOS) || os(watchOS)
        return Color(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    #elseif os(macOS)
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
    return RGBA(red, green, blue, alpha)
}

/// Create an UIColor or NSColor in format RGB.
///
/// - Parameters:
///   - red: Red value.
///   - green: Green value.
///   - blue: Blue value.
/// - Returns: Returns the created UIColor or NSColor.
public func RGB(_ red: Int, _ green: Int, _ blue: Int) -> Color {
    #if os(iOS) || os(watchOS)
        return Color(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    #elseif os(macOS)
        return Color(calibratedRed: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    #endif
}

// MARK: - UIColor or NSColor extension

/// This extesion adds some useful functions to UIColor or NSColor.
public extension Color {
    // MARK: - Variables
    
    #if !os(macOS)
        /// RGB properties: red.
        public var redComponent: CGFloat {
            if self.canProvideRGBComponents() {
                let component = self.cgColor.__unsafeComponents
                
                return component![0]
            }
            return 0.0
        }
        
        /// RGB properties: green.
        public var greenComponent: CGFloat {
            if self.canProvideRGBComponents() {
                let component = self.cgColor.__unsafeComponents
                
                if self.cgColor.colorSpace?.model == CGColorSpaceModel.monochrome {
                    return component![0]
                }
                return component![1]
            }
            return 0.0
        }
        
        /// RGB properties: blue.
        public var blueComponent: CGFloat {
            if self.canProvideRGBComponents() {
                let component = self.cgColor.__unsafeComponents
                
                if self.cgColor.colorSpace?.model == CGColorSpaceModel.monochrome {
                    return component![0]
                }
                return component![2]
            }
            return 0.0
        }
    
        /// RGB properties: white.
        public var whiteComponent: CGFloat {
            if self.cgColor.colorSpace?.model == CGColorSpaceModel.monochrome {
                let component = self.cgColor.__unsafeComponents
            
                return component![0]
            }
            return 0.0
        }
    #endif
    
    /// RGB properties: luminance.
    public var luminance: CGFloat {
        if self.canProvideRGBComponents() {
            var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
            
            #if os(iOS) || os(watchOS)
                self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            #elseif os(macOS)
                if self.colorSpace.colorSpaceModel == .RGB {
                    self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                } else if self.colorSpace.colorSpaceModel == .gray {
                    var white: CGFloat = 0.0
                    self.getWhite(&white, alpha: &alpha)
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
    public var alpha: CGFloat {
        return self.cgColor.alpha
    }
    
    /// HSB properties: hue.
    public var hue: CGFloat {
        if self.canProvideRGBComponents() {
            var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
            
            self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return hue
        }
        return 0.0
    }
    
    /// HSB properties: saturation.
    public var saturation: CGFloat {
        if self.canProvideRGBComponents() {
            var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
            
            self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return saturation
        }
        return 0.0
    }
    
    /// HSB properties: brightness.
    public var brightness: CGFloat {
        if self.canProvideRGBComponents() {
            var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
            
            self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return brightness
        }
        return 0.0
    }
    
    /// Returns the HEX string from UIColor or NSColor.
    public var hex: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        var rgb: Int = (Int)(red * 255) << 16 | (Int)(green * 255) << 8
        rgb = rgb | (Int)(blue * 255) << 0
        
        return String(format:"#%06x", rgb)
    }
    
    // MARK: - Functions
    
    /// Create a color from HEX with alpha.
    ///
    /// - Parameters:
    ///   - hex: HEX value.
    ///   - alpha: Alpha value.
    public convenience init(hex: Int, alpha: CGFloat = 1.0) {
        #if os(iOS) || os(watchOS)
            self.init(red: CGFloat(((hex & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((hex & 0xFF00) >> 8)) / 255.0, blue: CGFloat((hex & 0xFF)) / 255.0, alpha: alpha)
        #elseif os(macOS)
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
    public convenience init(hex: String, alphaFirst: Bool = false) {
        let colorString: String = hex.replacingOccurrences(of: "#", with: "").uppercased()
        var alpha: CGFloat = 1.0, red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
        
        switch colorString.length {
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
        
        #if os(iOS) || os(watchOS)
            self.init(red:red, green:green, blue:blue, alpha:alpha)
        #elseif os(macOS)
            self.init(calibratedRed:red, green:green, blue:blue, alpha:alpha)
        #endif
    }
    
    /// A good contrasting color, it will be either black or white.
    ///
    /// - Returns: Returns the color.
    public func contrasting() -> Color {
        return self.luminance > 0.5 ? Color.black : Color.white
    }
    
    /// A complementary color that should look good.
    ///
    /// - Returns: Returns the color.
    public func complementary() -> Color? {
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
        
        #if os(iOS) || os(watchOS)
            if !self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return nil
            }
        #elseif os(macOS)
            self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
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
    public func canProvideRGBComponents() -> Bool {
        guard let colorSpace = self.cgColor.colorSpace else {
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
    public static func random(alpha: CGFloat = 1.0) -> Color {
        let red: Int = randomInt(range: 0...255)
        let green: Int = randomInt(range: 0...255)
        let blue: Int = randomInt(range: 0...255)
        
        return Color(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    /// Create an UIColor or NSColor from a given string. Example: "blue" or hex string.
    ///
    /// - Parameter color: String with color.
    /// - Returns: Returns the created UIColor or NSColor.
    public static func color(string color: String) -> Color {
        if color.length >= 3 {
            if Color.responds(to: Selector(color.lowercased() + "Color")) {
                return self.convertColor(string: color)
            } else {
                return Color(hex: color)
            }
        } else {
            return Color.black
        }
    }
    
    #if os(iOS) || os(watchOS)
        /// Create an UIColor from a given string like "blue" or an hex string.
        ///
        /// - Parameter color: String with color.
        public convenience init(string color: String) {
            if UIColor.responds(to: Selector(color.lowercased() + "Color")) {
                self.init(cgColor: UIColor.convertColor(string: color).cgColor)
            } else {
                self.init(hex: color)
            }
        }
    #elseif os(macOS)
        /// Create a NSColor from a given string like "blue" or an hex string.
        ///
        /// - Parameter color: String with color.
        public convenience init?(string color: String) {
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
    public static func color(color: Color, alpha: CGFloat) -> Color {
        return color.withAlphaComponent(alpha)
    }
}
