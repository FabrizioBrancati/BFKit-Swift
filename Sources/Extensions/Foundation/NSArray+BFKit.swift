//
//  NSArray+BFKit.swift
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

/// This extension add some useful functions to NSArray
public extension NSArray {
    // MARK: - Instance functions -
    
    /**
     Get the object at a given index in safe mode (nil if self is empty or out of range)
    
     - parameter index: The index
    
     - returns: Returns the object at a given index in safe mode (nil if self is empty or out of range)
     */
    public func safeObjectAtIndex(_ index: Int) -> Any? {
        if self.count > 0 && self.count > index {
            return self[index]
        } else {
            return nil
        }
    }
    
    /**
     Create a reversed array from self
    
     - returns: Returns the reversed array
     */
    public func reversedArray() -> NSArray {
        return NSArray.reversedArray(self)
    }
    
    /**
     Convert self to JSON as String
    
     - returns: Returns the JSON as String or nil if error while parsing
     */
    public func arrayToJSON() throws -> NSString {
        return try NSArray.arrayToJSON(self)
    }
    
    /**
     Simulates the array as a circle. When it is out of range, begins again
    
     - parameter index: The index
    
     - returns: Returns the object at a given index
     */
    public func objectAtCircleIndex(_ index: Int) -> Any {
        return self[self.superCircle(index, size: self.count)]
    }
    
    /**
     Private, to get the index as a circle
    
     - parameter index:   The index
     - parameter maxSize: Max size of the array
    
     - returns: Returns the right index
     */
    private func superCircle(_ index: Int, size maxSize: Int) -> Int{
        var _index = index
        if _index < 0 {
            _index = _index % maxSize
            _index += maxSize
        }
        if _index >= maxSize {
            _index = _index % maxSize
        }
        
        return _index
    }
    
    // MARK: - Class functions -
    
    /**
     Create a reversed array from the given array
    
     - parameter array: The array to be reverse
    
     - returns: Returns the reversed array
     */
    public static func reversedArray(_ array: NSArray) -> NSArray {
        let arrayTemp: NSMutableArray = NSMutableArray.init(capacity: array.count)
        let enumerator: NSEnumerator = array.reverseObjectEnumerator()
        
        for element in enumerator {
            arrayTemp.add(element)
        }
        
        return arrayTemp
    }
    
    /**
     Create a reversed array from the given array
    
     - parameter array: The array to be converted
    
     - returns: Returns the JSON as String or nil if error while parsing
     */
    public static func arrayToJSON(_ array: AnyObject) throws -> NSString {
        let data = try JSONSerialization.data(withJSONObject: array, options: JSONSerialization.WritingOptions())
        return NSString(data: data, encoding: String.Encoding.utf8.rawValue)!
    }
}
