//
//  NSNumber+BFKit.swift
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

// MARK: - Global variables -

/// Variable useful if you use Objective-C
public let YES = true
/// Variable useful if you use Objective-C
public let NO = false

// MARK: - Global functions -

/**
 Degrees to radians conversion

 - parameter degrees: Degrees to be converted

 - returns: Returns the convertion result
 */
public func DegreesToRadians(_ degrees: Float) -> Float {
    return Float(Double(degrees) * M_PI / 180)
}

/**
 Radians to degrees conversion

 - parameter radians: Radians to be converted

 - returns: Returns the convertion result
 */
public func RadiansToDegrees(_ radians: Float) -> Float {
    return Float(Double(radians) * 180 / M_PI)
}

/// This extension adds some useful functions to NSNumber
public extension NSNumber {
    // MARK: - Class functions -
    
    /**
     Create a random integer between the given range
    
     - parameter minValue: Mininum random value
     - parameter maxValue: Maxinum random value
    
     - returns: Returns the created random integer
     */
    public static func randomIntBetweenMin(_ minValue: Int, andMax maxValue: Int) -> Int {
        return minValue + Int(self.randomFloat()) * (maxValue - minValue)
    }
    
    /**
     Create a random integer between the given range.
     Example: NSNumber.randomInt(-500...100)
     
     - parameter range: Range random value
     
     - returns: Returns the created random integer
     */
    static func randomInt(_ range: Range<Int>) -> Int
    {
        var offset = 0
        
        if range.lowerBound < 0
        {
            offset = abs(range.lowerBound)
        }
        
        let min = UInt32(range.lowerBound + offset)
        let max = UInt32(range.upperBound   + offset)
        
        return Int(min + arc4random_uniform(max - min)) - offset
    }
    
    /**
     Create a random float
    
     - returns: Returns the created random float
     */
    public static func randomFloat() -> Float {
        return Float(arc4random() / UINT32_MAX)
    }
    
    /**
     Create a random float between the given range
    
     - parameter minValue: Mininum random value
     - parameter maxValue: Maxinum random value
    
     - returns: Returns the created random float
     */
    public static func randomFloatBetweenMin(_ minValue: Float, andMax maxValue: Float) -> Float {
        return Float(arc4random()) / Float(UINT32_MAX) * abs(minValue - maxValue) + min(minValue, maxValue)
    }
    
    /**
     Get the next power of two
    
     - parameter number: Number to be powered
    
     - returns: Returns the number powered
     */
    public static func nextPowerOfTwo(_ number: Int) -> Int {
        var result = 1
        while result < number {
            result *= 2
        }
        return result
    }
    
    /**
     Returns if the number is a power of two
    
     - parameter number: Number to check
    
     - returns: Returns if the number is a power of two
     */
    public static func isPowerOfTwo(_ number: Int) -> Bool {
        return (number != 0) && (number & (number - 1) >= 1 ? true : false)
    }
}
