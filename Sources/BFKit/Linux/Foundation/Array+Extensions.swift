//
//  Array+Extensions.swift
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

// MARK: - Global functions

/// Creates a flatten array.
///
/// Example:
///
///     [1, 2, [3, [4]]] -> [1, 2, 3, 4]
///
/// - Parameter array: Array bo te flattened.
/// - Returns: Returns a flatten array.
public func flatten<T>(_ array: [T]) -> [T] {
    /// Returned flattened array.
    var flattened: [T] = []
    
    /// For every element inside the array.
    for element in array {
        /// If it's a nested array, safely cast.
        if let subarray = element as? [T] {
            /// For every subarray call the `flatten` function.
            for subelement in flatten(subarray) {
                /// We are now sure that this is an element
                /// and we can add it to `flattened`.
                flattened.append(subelement)
            }
        } else {
            /// Otherwise is an element and add it to `flattened`.
            flattened.append(element)
        }
    }
    
    return flattened
}

// MARK: - Array extension

/// This extension adds some useful functions to Array.
public extension Array {
    // MARK: - Functions
    
    /// A Bool value indicating whether the collection is not empty.
    ///
    /// - Returns: Returns a Bool value indicating whether the collection is not empty.
    var isNotEmpty: Bool {
        !isEmpty
    }
    
    /// Simulates the array as a circle. When it is out of range, begins again.
    ///
    /// - Parameter index: The index.
    /// - Returns: Returns the object at a given index.
    func circleObject(at index: Int) -> Element {
        self[superCircle(at: index, size: count)]
    }
    
    /// Randomly selects an element from self and returns it.
    ///
    /// - returns: An element that was randomly selected from the array.
    func random() -> Element {
        self[Int.random(in: 0...count - 1)]
    }
    
    /// Removes the element from self that is passed in.
    /// 
    /// - parameter object: The element that is removed from 
    mutating func remove(_ object: Element) {
        var array: [String] = []
        for index in self {
            array.append("\(index)")
        }
        let index = array.firstIndex(of: "\(object)")
        if let index = index {
            remove(at: index)
        }
    }
    
    /// Get the object at a given index in safe mode (nil if self is empty or out of range).
    ///
    /// - Parameter index: The index.
    /// - Returns: Returns the object at a given index in safe mode (nil if self is empty or out of range).
    func safeObject(at index: Int) -> Element? {
        guard !isEmpty, count > index else {
            return nil
        }
        
        return self[index]
    }
    
    /// Get the index as a circle.
    ///
    /// - Parameters:
    ///   - index: The index.
    ///   - maxSize: Max size of the array.
    /// - Returns: Returns the right index.
    private func superCircle(at index: Int, size maxSize: Int) -> Int {
        var newIndex = index
        if newIndex < 0 {
            newIndex = newIndex % maxSize
            newIndex += maxSize
        }
        if newIndex >= maxSize {
            newIndex = newIndex % maxSize
        }
        
        return newIndex
    }
    
    /// Move object from an index to another.
    ///
    /// - Parameters:
    ///   - fromIndex: The start index.
    ///   - toIndex: The end index.
    mutating func swap(from fromIndex: Int, to toIndex: Int) {
        if toIndex != fromIndex {
            guard let object: Element = safeObject(at: fromIndex) else {
                return
            }
            remove(at: fromIndex)
            
            if toIndex >= count {
                append(object)
            } else {
                insert(object, at: toIndex)
            }
        }
    }
}
