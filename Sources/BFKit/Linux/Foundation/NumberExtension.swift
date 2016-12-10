//
//  NumberExtension.swift
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
#if os(Linux)
    import Glibc
#endif

// MARK: - Global functions

/// Degrees to radians conversion.
///
/// - Parameter degrees: Degrees to be converted.
/// - Returns: Returns the convertion result.
public func degreesToRadians(_ degrees: Float) -> Float {
    return Float(Double(degrees) * M_PI / 180)
}

/// Radians to degrees conversion.
///
/// - Parameter radians: Radians to be converted.
/// - Returns: Returns the convertion result.
public func radiansToDegrees(_ radians: Float) -> Float {
    return Float(Double(radians) * 180 / M_PI)
}

/// Create a random integer between the given range.
///
/// - Parameters:
///   - minValue: Mininum random value.
///   - maxValue: Maxinum random value.
/// - Returns: Returns the created random integer.
public func randomInt(min minValue: Int, max maxValue: Int) -> Int {
    return minValue + Int(randomFloat() * Float(maxValue - minValue))
}

/// Create a random integer between the given range.
/// Example: randomInt(-500...100).
///
/// - Parameter range: Range random value.
/// - Returns: Returns the created random integer.
public func randomInt(range: ClosedRange<Int>) -> Int {
    var offset = 0
    
    if range.lowerBound < 0 {
        offset = abs(range.lowerBound)
    }
    
    let min = UInt32(range.lowerBound + offset)
    let max = UInt32(range.upperBound + offset)
    
    #if os(Linux)
        return Int(Int(min) + Int(Glibc.random()) % Int(max - min)) - offset
    #else
        return Int(min + arc4random_uniform(max - min)) - offset
    #endif
}

/// Create a random float.
///
/// - Returns: Returns the created random float.
public func randomFloat() -> Float {
    #if os(Linux)
        return Float(Int(Glibc.random()) / Int(UINT32_MAX))
    #else
        return Float(arc4random()) / Float(UINT32_MAX)
    #endif
}

/// Create a random float between the given range.
///
/// - Parameters:
///   - minValue: Mininum random value.
///   - maxValue: Maxinum random value.
/// - Returns: Returns the created random float.
public func randomFloat(min minValue: Float, max maxValue: Float) -> Float {
    return randomFloat() * abs(minValue - maxValue) + min(minValue, maxValue)
}
