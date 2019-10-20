//
//  Number+Extensions.swift
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

import Dispatch
import Foundation

// MARK: - Global functions

/// Degrees to radians conversion.
///
/// - Parameter degrees: Degrees to be converted.
/// - Returns: Returns the convertion result.
public func degreesToRadians(_ degrees: Double) -> Double {
    degrees * Double.pi / 180
}

/// Radians to degrees conversion.
///
/// - Parameter radians: Radians to be converted.
/// - Returns: Returns the convertion result.
public func radiansToDegrees(_ radians: Double) -> Double {
    radians * 180 / Double.pi
}

// MARK: - Extensions

/// This extesion adds some useful functions to Double.
public extension Double {
    /// Gets the individual numbers, and puts them into an array. All negative numbers will start with 0.
    var array: [Int] {
        description.map { Int(String($0)) ?? 0 }
    }
}

/// This extesion adds some useful functions to Float.
public extension Float {
    /// Gets the individual numbers, and puts them into an array. All negative numbers will start with 0.
    var array: [Int] {
        description.map { Int(String($0)) ?? 0 }
    }
}

/// This extesion adds some useful functions to Int.
public extension Int {
    /// Gets the individual numbers, and puts them into an array. All negative numbers will start with 0.
    var array: [Int] {
        description.map { Int(String($0)) ?? 0 }
    }
}

/// Infix operator `<>` with ComparisonPrecedence.
infix operator <>: ComparisonPrecedence

/// Infix operator `<=>` with ComparisonPrecedence.
infix operator <=>: ComparisonPrecedence

/// Returns true if `left` it is in `right` range but not equal.
/// If you want to check if its even equal use the `<=>` operator.
///
/// - Parameters:
///   - left: Left number to be compared.
///   - right: Right tuple to be compared (Number, Number).
/// - Returns: Returns true if `left` it is in `right` range but not equal.
public func <> <T: Comparable>(left: T, right: (T, T)) -> Bool {
    left > right.0 && left < right.1
}

/// Returns true if `left` is in `right` range or equal.
///
/// - Parameters:
///   - left: Left number to be compared.
///   - right: Right tuple to be compared (Number, Number).
/// - Returns: Returns true if `left` it is in `right` range or equal.
public func <=> <T: Comparable>(left: T, right: (T, T)) -> Bool {
    left >= right.0 && left <= right.1
}
