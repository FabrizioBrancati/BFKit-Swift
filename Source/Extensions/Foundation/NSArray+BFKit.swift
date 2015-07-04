//
//  NSArray+BFKit.swift
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

/// This extension add some useful functions to NSArray
public extension NSArray
{
    // MARK: - Instance functions -
    
    /**
    Get the object at a given index in safe mode (nil if self is empty or out of range)
    
    :param: index The index
    
    :returns: Returns the object at a given index in safe mode (nil if self is empty or out of range)
    */
    public func safeObjectAtIndex(index: Int) -> AnyObject?
    {
        if self.count > 0 && self.count > index
        {
            return self[index]
        }
        else
        {
            return nil
        }
    }
    
    /**
    Create a reversed array from self
    
    :returns: Returns the reversed array
    */
    public func reversedArray() -> NSArray
    {
        return NSArray.reversedArray(self)
    }
    
    /**
    Convert self to JSON as String
    
    :returns: Returns the JSON as String or nil if error while parsing
    */
    public func arrayToJSON() -> NSString
    {
        return NSArray.arrayToJSON(self)
    }
    
    /**
    Simulates the array as a circle. When it is out of range, begins again
    
    :param: index The index
    
    :returns: Returns the object at a given index
    */
    public func objectAtCircleIndex(index: Int) -> AnyObject
    {
        return self[self.superCircle(index, size: self.count)]
    }
    
    /**
    Private, to get the index as a circle
    
    :param: index   The index
    :param: maxSize Max size of the array
    
    :returns: Returns the right index
    */
    private func superCircle(var index: Int, size maxSize: Int) -> Int
    {
        if index < 0
        {
            index = index % maxSize
            index += maxSize
        }
        if index >= maxSize
        {
            index = index % maxSize
        }
        
        return index
    }
    
    // MARK: - Class functions -
    
    /**
    Create a reversed array from the given array
    
    :param: array The array to be reverse
    
    :returns: Returns the reversed array
    */
    public static func reversedArray(array: NSArray) -> NSArray
    {
        var arrayTemp: NSMutableArray = NSMutableArray.init(capacity: array.count)
        var enumerator: NSEnumerator = array.reverseObjectEnumerator()
        
        for element in enumerator
        {
            arrayTemp.addObject(element)
        }
        
        return arrayTemp
    }
    
    /**
    Create a reversed array from the given array
    
    :param: array The array to be converted
    
    :returns: Returns the JSON as String or nil if error while parsing
    */
    public static func arrayToJSON(array: AnyObject) -> NSString
    {
        var error: NSError?
        let data = NSJSONSerialization.dataWithJSONObject(array, options: nil, error: &error)
        let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
        if error == nil
        {
            return NSString(data: data!, encoding: NSUTF8StringEncoding)!
        }
        else
        {
            return error!.localizedDescription
        }
    }
}
