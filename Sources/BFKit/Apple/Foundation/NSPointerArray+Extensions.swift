//
//  NSPointerArray+Extensions.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2018 Fabrizio Brancati.
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

// MARK: - NSPointerArray extension

/// This extension adds some useful functions to NSPointerArray.
/// https://marcosantadev.com/swift-arrays-holding-elements-weak-references/
public extension NSPointerArray {
    /// Adds an object to the array.
    ///
    /// - Parameter object: Object to be added.
    public func add(_ object: AnyObject?) {
        guard let strongObject = object else {
            return
        }
        
        let pointer = Unmanaged.passUnretained(strongObject).toOpaque()
        addPointer(pointer)
    }
    
    /// Inserts an object at a given index inside the array.
    ///
    /// - Parameters:
    ///   - object: Object to be inserted.
    ///   - index: Index.
    public func insert(_ object: AnyObject?, at index: Int) {
        guard index < count, let strongObject = object else {
            return
        }
        
        let pointer = Unmanaged.passUnretained(strongObject).toOpaque()
        insertPointer(pointer, at: index)
    }
    
    /// Replaces an object at a given index inside the array.
    ///
    /// - Parameters:
    ///   - index: Index.
    ///   - object: Replacing object.
    public func replace(at index: Int, with object: AnyObject?) {
        guard index < count, let strongObject = object else {
            return
        }
        
        let pointer = Unmanaged.passUnretained(strongObject).toOpaque()
        replacePointer(at: index, withPointer: pointer)
    }
    
    /// Returns an object at index.
    ///
    /// - Parameter index: Index.
    /// - Returns: Returns an object at index.
    public func object(at index: Int) -> AnyObject? {
        guard index < count, let pointer = pointer(at: index) else {
            return nil
        }
        
        return Unmanaged<AnyObject>.fromOpaque(pointer).takeUnretainedValue()
    }
    
    /// Remove an object at a given index.
    ///
    /// - Parameter index: Index.
    public func remove(at index: Int) {
        guard index < count else {
            return
        }
        
        removePointer(at: index)
    }
}
