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
import UIKit

// MARK: - Global functions

/// Create an UIColor in format RGBA.
///
/// - Parameters:
///   - red: Red value.
///   - green: Green value.
///   - blue: Blue value.
///   - alpha: Alpha value.
/// - Returns: Returns the created UIColor.
public func RGBA(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Float) -> UIColor {
    return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
}

/// Create an UIColor in format ARGB.
///
/// - Parameters:
///   - alpha: Alpha value.
///   - red: Red value.
///   - green: Green value.
///   - blue: Blue value.
/// - Returns: Returns the created UIColor.
public func ARGB( _ alpha: Float, _ red: Int, _ green: Int, _ blue: Int) -> UIColor {
    return RGBA(red, green, blue, alpha)
}

/// Create an UIColor in format RGB.
///
/// - Parameters:
///   - red: Red value.
///   - green: Green value.
///   - blue: Blue value.
/// - Returns: Returns the created UIColor.
public func RGB(_ red: Int, _ green: Int, _ blue: Int) -> UIColor {
    return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
}

// MARK: - UIColor extension

/// This extesion adds some useful functions to UIColor.
public extension UIColor {
    // MARK: - Variables
    
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
    
    /// RGB properties: luminance.
    public var luminance: CGFloat {
        if self.canProvideRGBComponents() {
            var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
            
            if !self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
                return 0.0
            }
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
            
            if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return hue
            }
        }
        return 0.0
    }
    
    /// HSB properties: saturation.
    public var saturation: CGFloat {
        if self.canProvideRGBComponents() {
            var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
            
            if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return saturation
            }
        }
        return 0.0
    }
    
    /// HSB properties: brightness.
    public var brightness: CGFloat {
        if self.canProvideRGBComponents() {
            var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
            
            if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return brightness
            }
        }
        return 0.0
    }
    
    /// Returns the HEX string from UIColor.
    public var hex: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let rgb: Int = (Int)(red * 255) << 16 | (Int)(green * 255) << 8 | (Int)(blue * 255) << 0
        
        return String(format:"#%06x", rgb)
    }
    
    // MARK: - Functions
    
    /// Create a color from HEX with alpha.
    ///
    /// - Parameters:
    ///   - hex: HEX value.
    ///   - alpha: Alpha value.
    public convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(((hex & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((hex & 0xFF00) >> 8)) / 255.0, blue: CGFloat((hex & 0xFF)) / 255.0, alpha: alpha)
    }
    
    /// Create a color from a HEX string.
    /// It supports the following type:
    /// - #ARGB, ARGB if irstIsAlpha is true. #RGBA, RGBA if firstIsAlpha is false.
    /// - #ARGB.
    /// - #RRGGBB.
    /// - #AARRGGBB, AARRGGBB if irstIsAlpha is true. #RRGGBBAA, RRGGBBAA if firstIsAlpha is false.
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
            red = UIColor.colorComponent(fromString: colorString, range: 0..<1)
            green = UIColor.colorComponent(fromString: colorString, range: 1..<2)
            blue = UIColor.colorComponent(fromString: colorString, range: 2..<3)
        case 4: /// ARGB if irstIsAlpha is true, otherwise RGBA.
            if alphaFirst {
                alpha = UIColor.colorComponent(fromString: colorString, range: 0..<1)
                red = UIColor.colorComponent(fromString: colorString, range: 1..<2)
                green = UIColor.colorComponent(fromString: colorString, range: 2..<3)
                blue = UIColor.colorComponent(fromString: colorString, range: 3..<4)
            } else {
                red = UIColor.colorComponent(fromString: colorString, range: 0..<1)
                green = UIColor.colorComponent(fromString: colorString, range: 1..<2)
                blue = UIColor.colorComponent(fromString: colorString, range: 2..<3)
                alpha = UIColor.colorComponent(fromString: colorString, range: 3..<4)
            }
        case 6: /// RRGGBB
            alpha = 1.0
            red = UIColor.colorComponent(fromString: colorString, range: 0..<2)
            green = UIColor.colorComponent(fromString: colorString, range: 2..<4)
            blue = UIColor.colorComponent(fromString: colorString, range: 4..<6)
        case 8: /// AARRGGBB if irstIsAlpha is true, otherwise RRGGBBAA.
            if alphaFirst {
                alpha = UIColor.colorComponent(fromString: colorString, range: 0..<2)
                red = UIColor.colorComponent(fromString: colorString, range: 2..<4)
                green = UIColor.colorComponent(fromString: colorString, range: 4..<6)
                blue = UIColor.colorComponent(fromString: colorString, range: 6..<8)
            } else {
                red = UIColor.colorComponent(fromString: colorString, range: 0..<2)
                green = UIColor.colorComponent(fromString: colorString, range: 2..<4)
                blue = UIColor.colorComponent(fromString: colorString, range: 4..<6)
                alpha = UIColor.colorComponent(fromString: colorString, range: 6..<8)
            }
        default:
            break
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    /// A good contrasting color, it will be either black or white.
    ///
    /// - Returns: Returns the color.
    public func contrasting() -> UIColor {
        return self.luminance > 0.5 ? UIColor.black : UIColor.white
    }
    
    /// A complementary color that should look good.
    ///
    /// - Returns: Returns the color.
    public func complementary() -> UIColor? {
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
        
        if !self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return nil
        }
        
        hue += 180
        if hue > 360 {
            hue -= 360
        }
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
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
    /// - Returns: Returns the UIColor instance.
    public static func random(alpha: CGFloat = 1.0) -> UIColor {
        let red: Int = randomInt(range: 0...255)
        let green: Int = randomInt(range: 0...255)
        let blue: Int = randomInt(range: 0...255)
        
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    /// Create an UIColor from a given string. Example: "blue" or hex string.
    ///
    /// - Parameter color: String with color.
    /// - Returns: Returns the created UIColor.
    public static func color(string color: String) -> UIColor {
        if color.length >= 3 {
            if UIColor.responds(to: Selector(color.lowercased() + "Color")) {
                return self.convertColor(string: color)
            } else {
                return UIColor(hex: color)
            }
        } else {
            return UIColor.black
        }
    }
    
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
    
    /// Used the retrive the color from the string color ("blue" or "red").
    ///
    /// - Parameter color: String with the color.
    /// - Returns: Returns the created UIColor.
    private static func convertColor(string color: String) -> UIColor {
        let color = color.lowercased()
        
        switch color {
        case "black":
            return UIColor.black
        case "darkgray":
            return UIColor.darkGray
        case "lightgray":
            return UIColor.lightGray
        case "white":
            return UIColor.white
        case "gray":
            return UIColor.gray
        case "red":
            return UIColor.red
        case "green":
            return UIColor.green
        case "blue":
            return UIColor.blue
        case "cyan":
            return UIColor.cyan
        case "yellow":
            return UIColor.yellow
        case "magenta":
            return UIColor.magenta
        case "orange":
            return UIColor.orange
        case "purple":
            return UIColor.purple
        case "brown":
            return UIColor.brown
        case "clear":
            return UIColor.clear
        default:
            return UIColor.clear
        }
    }
    
    /// Creates and returns a color object that has the same color space and component values as the given color, but has the specified alpha component.
    ///
    /// - Parameters:
    ///   - color: UIColor value.
    ///   - alpha: Alpha value.
    /// - Returns: Returns an UIColor instance.
    public static func color(color: UIColor, alpha: CGFloat) -> UIColor {
        return color.withAlphaComponent(alpha)
    }
}
