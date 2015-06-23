//
//  NSNumber+BFKit.swift
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

// MARK: - Global variables -

let YES = true
let NO = false

// MARK: - Global functions -

func DegreesToRadians(degrees: Float) -> Float
{
    return Float(Double(degrees) * M_PI / 180)
}

func RadiansToDegrees(radians: Float) -> Float
{
    return Float(Double(radians) * 180 / M_PI)
}

extension NSNumber
{
    // MARK: - Class functions -
    
    static func randomIntBetweenMin(minValue: Int, andMax maxValue: Int) -> Int
    {
        return minValue + Int(self.randomFloat()) * (maxValue - minValue)
    }
    
    static func randomFloat() -> Float
    {
        return Float(arc4random() / UINT32_MAX)
    }
    
    static func randomFloatBetweenMin(minValue: Float, andMax maxValue: Float) -> Float
    {
        return Float(arc4random()) / Float(UINT32_MAX) * abs(minValue - maxValue) + min(minValue, maxValue)
    }
    
    static func nextPowerOfTwo(number: Int) -> Int
    {
        var result = 1
        while result < number
        {
            result *= 2
        }
        return result
    }
    
    static func isPowerOfTwo(number: Int) -> Bool
    {
        return (number != 0) && Bool((number & (number - 1)))
    }
}
