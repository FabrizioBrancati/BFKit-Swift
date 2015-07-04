//
//  UIColor+BFKit.swift
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

// MARK: - Global functions -

/**
Create an UIColor in format RGBA

:param: r Red value
:param: g Green value
:param: b Blue value
:param: a Alpha value

:returns: Returns the created UIColor
*/
public func RGBA(r: Int, g: Int, b: Int, a: Float) -> UIColor
{
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(a))
}

/**
Create an UIColor in format RGB

:param: r Red value
:param: g Green value
:param: b Blue value

:returns: Returns the created UIColor
*/
public func RGB(r: Int, g: Int, b: Int) -> UIColor
{
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
}

/// This extesion adds some useful functions to UIColor
public extension UIColor
{
    // MARK: - Variables -
    
    /// RGB properties: red
    public var red: CGFloat
    {
        get
        {
            if self.canProvideRGBComponents()
            {
                let c = CGColorGetComponents(self.CGColor)
                
                return c[0]
            }
            
            return 0.0
        }
        set(newValue)
        {
            self.red = newValue
        }
    }
    
    /// RGB properties: green
    public var green: CGFloat
    {
        get
        {
            if self.canProvideRGBComponents()
            {
                let c = CGColorGetComponents(self.CGColor)
                
                if CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)).value == kCGColorSpaceModelMonochrome.value
                {
                    return c[0]
                }
                return c[1]
            }
            
            return 0.0
        }
        set(newValue)
        {
            self.green = newValue
        }
    }
    
    /// RGB properties: blue
    public var blue: CGFloat
    {
        get
        {
            if self.canProvideRGBComponents()
            {
                let c = CGColorGetComponents(self.CGColor)
                
                if CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)).value == kCGColorSpaceModelMonochrome.value
                {
                    return c[0]
                }
                return c[2]
            }
            
            return 0.0
        }
        set(newValue)
        {
            self.blue = newValue
        }
    }
    
    /// RGB properties: white
    public var white: CGFloat
    {
        get
        {
            if CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)).value == kCGColorSpaceModelMonochrome.value
            {
                let c = CGColorGetComponents(self.CGColor)
                
                return c[0]
            }
            
            return 0.0
        }
        set(newValue)
        {
            self.white = newValue
        }
    }
    
    /// RGB properties: hue
    public var hue: CGFloat
    {
        get
        {
            if self.canProvideRGBComponents()
            {
                var h: CGFloat = 0.0, s: CGFloat = 0.0, v: CGFloat = 0.0, a: CGFloat = 0.0
                
                self.getHSBA(&h, &s, &v, &a)
                return h
            }
            
            return 0.0
        }
        set(newValue)
        {
            self.hue = newValue
        }
    }
    
    /// RGB properties: saturation
    public var saturation: CGFloat
    {
        get
        {
            if self.canProvideRGBComponents()
            {
                var h: CGFloat = 0.0, s: CGFloat = 0.0, v: CGFloat = 0.0, a: CGFloat = 0.0
                
                self.getHSBA(&h, &s, &v, &a)
                return s
            }
            
            return 0.0
        }
        set(newValue)
        {
            self.saturation = newValue
        }
    }
    
    /// RGB properties: brightness
    public var brightness: CGFloat
    {
        get
        {
            if self.canProvideRGBComponents()
            {
                var h: CGFloat = 0.0, s: CGFloat = 0.0, v: CGFloat = 0.0, a: CGFloat = 0.0
                
                self.getHSBA(&h, &s, &v, &a)
                return v
            }
            
            return 0.0
        }
        set(newValue)
        {
            self.saturation = newValue
        }
    }
    
    /// RGB properties: alpha
    public var alpha: CGFloat
    {
        get
        {
            return CGColorGetAlpha(self.CGColor)
        }
        set(newValue)
        {
            self.alpha = newValue
        }
    }
    
    /// RGB properties: luminance
    public var luminance: CGFloat
    {
        get
        {
            if self.canProvideRGBComponents()
            {
                var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
                
                if !self.getRGBA(&r, &g, &b, &a)
                {
                    return 0.0
                }
                return r * 0.2126 + g * 0.7152 + b * 0.0722
            }
            
            return 0.0
        }
        set(newValue)
        {
            self.saturation = newValue
        }
    }
    
    // MARK: - Instance functions -
    
    /**
    A good contrasting color, it will be either black or white
    
    :returns: Returns the color
    */
    public func contrastingColor() -> UIColor
    {
        return self.luminance > 0.5 ? UIColor.blackColor() : UIColor.whiteColor()
    }
    
    /**
    A complementary color that should look good
    
    :returns: Returns the color
    */
    public func complementaryColor() -> UIColor?
    {
        var h: CGFloat = 0.0, s: CGFloat = 0.0, v: CGFloat = 0.0, a: CGFloat = 0.0
        
        if !self.getHSBA(&h, &s, &v, &a)
        {
            return nil
        }
        
        h += 180
        if h > 360
        {
            h -= 360
        }
        
        return UIColor(hue: h, saturation: s, brightness: v, alpha: a)
    }
    
    /**
    Check if the color is in RGB format
    
    :returns: Returns if the color is in RGB format
    */
    public func canProvideRGBComponents() -> Bool
    {
        switch CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)).value
        {
        case kCGColorSpaceModelRGB.value:
            return true
        case kCGColorSpaceModelMonochrome.value:
            return true
        default:
            return false
        }
    }
    
    /**
    Private, get the hue, saturation, brightness and alpha
    
    :param: hue        Hue var
    :param: saturation Saturation var
    :param: brightness Brightness var
    :param: alpha      Alpha var
    
    :returns: Return true or false
    */
    private func getHSBA(inout hue: CGFloat, inout _ saturation: CGFloat, inout _ brightness: CGFloat, inout _ alpha: CGFloat) -> Bool
    {
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        if !self.getRGBA(&r, &g, &b, &a)
        {
            return false
        }
        
        UIColor.getAll(&r, &g, &b, &hue, &saturation, &brightness)
        
        alpha = a
        
        return true
    }
    
    /**
    Private, get the red, green, blue and alpha
    
    :param: red   Red var
    :param: green Green var
    :param: blue  Blue var
    :param: alpha Alpha var
    
    :returns: Return true or false
    */
    private func getRGBA(inout red: CGFloat, inout _ green: CGFloat, inout _ blue: CGFloat, inout _ alpha: CGFloat) -> Bool
    {
        let components = CGColorGetComponents(self.CGColor)
        
        var r, g, b, a: CGFloat
        
        switch CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)).value
        {
        case kCGColorSpaceModelMonochrome.value:
            r = components[0]
            g = components[0]
            b = components[0]
            a = components[1]
        case kCGColorSpaceModelRGB.value:
            r = components[0]
            g = components[1]
            b = components[2]
            a = components[3]
        default:
            return false
        }
        
        red = r
        green = g
        blue = b
        alpha = a
        
        return true
    }
    
    // MARK: - Init functions -
    
    /**
    Create a color from a HEX string.
    It supports the following type:
    - #RGB
    - #ARGB
    - #RRGGBB
    - #AARRGGBB
    :param: hex HEX string
    
    :returns: Returns the UIColor instance
    */
    public convenience init(hex: String)
    {
        self.init(hexString: hex)
    }
    
    /**
    Create a color from a HEX string.
    It supports the following type:
    - #RGB
    - #ARGB
    - #RRGGBB
    - #AARRGGBB
    :param: hexString HEX string
    
    :returns: Returns the UIColor instance
    */
    public convenience init(hexString: String)
    {
        let colorString: String = hexString.stringByReplacingOccurrencesOfString("#", withString: "").uppercaseString
        var alpha: CGFloat = 0.0, red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
        switch colorString.length()
        {
        case 3: // #RGB
            alpha = 1.0
            red = UIColor.colorComponentFrom(colorString, start: 0, lenght: 1)
            green = UIColor.colorComponentFrom(colorString, start: 1, lenght: 1)
            blue = UIColor.colorComponentFrom(colorString, start: 2, lenght: 1)
        case 4: // #ARGB
            alpha = UIColor.colorComponentFrom(colorString, start: 0, lenght: 1)
            red = UIColor.colorComponentFrom(colorString, start: 1, lenght: 1)
            green = UIColor.colorComponentFrom(colorString, start: 2, lenght: 1)
            blue = UIColor.colorComponentFrom(colorString, start: 3, lenght: 1)
        case 6: // #RRGGBB
            alpha = 1.0
            red = UIColor.colorComponentFrom(colorString, start: 0, lenght: 2)
            green = UIColor.colorComponentFrom(colorString, start: 2, lenght: 2)
            blue = UIColor.colorComponentFrom(colorString, start: 4, lenght: 2)
        case 8: // #AARRGGBB
            alpha = UIColor.colorComponentFrom(colorString, start: 0, lenght: 2)
            red = UIColor.colorComponentFrom(colorString, start: 2, lenght: 2)
            green = UIColor.colorComponentFrom(colorString, start: 4, lenght: 2)
            blue = UIColor.colorComponentFrom(colorString, start: 6, lenght: 2)
        default:
            break
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    // MARK: - Class functions -
    
    /**
    Private, returns the color component from the string
    
    :param: string String to convert
    :param: start  Component start index
    :param: lenght Component lenght
    
    :returns: Returns the color component from the string
    */
    private static func colorComponentFrom(string: String, start: Int, lenght: Int) -> CGFloat
    {
        var substring: NSString = string as NSString
        substring = substring.substringWithRange(NSMakeRange(start, lenght))
        let fullHex = lenght == 2 ? substring as String : "\(substring)\(substring)"
        var hexComponent: CUnsignedInt = 0
        NSScanner(string: fullHex).scanHexInt(&hexComponent)
        
        return CGFloat(hexComponent) / 255.0
    }
    
    /**
    Create a color from HEX with alpha
    
    :param: hex HEX value
    
    :returns: Returns the UIColor instance
    */
    @availability(*, deprecated=1.2.0, message="Use colorWithHex(_, alpha:)")
    public static func colorWithHex(hex: Int) -> UIColor
    {
        return self.colorWithHex(hex, alpha: 1.0)
    }
    
    /**
    Create a color from HEX with alpha
    
    :param: hex   HEX value
    :param: alpha Alpha value
    
    :returns: Returns the UIColor instance
    */
    public static func colorWithHex(hex: Int, alpha: CGFloat = 1.0) -> UIColor
    {
        return UIColor(red: CGFloat(((hex & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((hex & 0xFF00) >> 8)) / 255.0, blue: CGFloat((hex & 0xFF)) / 255.0, alpha: alpha)
    }
    
    /**
    Create a random color
    
    :returns: Returns the UIColor instance
    */
    public static func randomColor() -> UIColor
    {
        let r: Int = Int(arc4random()) % 255
        let g: Int = Int(arc4random()) % 255
        let b: Int = Int(arc4random()) % 255
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
    /**
    Creates and returns a color object that has the same color space and component values as the given color, but has the specified alpha component
    
    :param: color UIColor value
    :param: alpha Alpha value
    
    :returns: Returns the UIColor instance
    */
    public static func colorWithColor(color: UIColor, alpha: CGFloat) -> UIColor
    {
        return color.colorWithAlphaComponent(alpha)
    }
    
    /**
    Private, get all the components
    
    :param: r  Red var
    :param: g  Green var
    :param: b  Blue var
    :param: pH Hue var
    :param: pS Saturation var
    :param: pV Brightness var
    */
    private static func getAll(inout r: CGFloat, inout _ g:CGFloat, inout _ b: CGFloat, inout _ pH: CGFloat, inout _ pS: CGFloat, inout _ pV: CGFloat)
    {
        var h: CGFloat = 0.0, s: CGFloat = 0.0, v: CGFloat = 0.0
        
        let maxValue: CGFloat = max(r, max(g, b))
        let minValue: CGFloat = max(r, max(g, b))
        
        v = maxValue
        
        s = (maxValue != 0.0) ? ((maxValue - minValue) / maxValue) : 0.0
        
        if s == 0.0
        {
            h = 0.0
        }
        else
        {
            let rc: CGFloat = (maxValue - r) / (maxValue - minValue)
            let gc: CGFloat = (maxValue - g) / (maxValue - minValue)
            let bc: CGFloat = (maxValue - b) / (maxValue - minValue)
            
            if r == maxValue
            {
                h = bc - gc
            }
            else if g == maxValue
            {
                h = 2 + rc - bc
            }
            else
            {
                h = 4 + gc - rc
            }
            
            h *= 60.0
            if h < 0.0
            {
                h += 360.0
            }
        }
        
        pH = h
        pS = s
        pV = v
    }
}
