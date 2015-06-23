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

extension NSArray
{
    // MARK: - Instance functions -
    
    func safeObjectAtIndex(index: Int) -> AnyObject?
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
    
    func reversedArray() -> NSArray
    {
        return NSArray.reversedArray(self)
    }
    
    func arrayToJSON() -> NSString
    {
        return NSArray.arrayToJSON(self)
    }
    
    func objectAtCircleIndex(index: Int) -> AnyObject
    {
        return self[self.superCircle(index, size: self.count)];
    }
    
    func superCircle(var index: Int, size maxSize: Int) -> Int
    {
        if index < 0
        {
            index = index % maxSize;
            index += maxSize;
        }
        if index >= maxSize
        {
            index = index % maxSize;
        }
        
        return index;
    }
    
    // MARK: - Class functions -
    
    static func reversedArray(array: NSArray) -> NSArray
    {
        var arrayTemp: NSMutableArray = NSMutableArray.init(capacity: array.count)
        var enumerator: NSEnumerator = array.reverseObjectEnumerator()
        
        for element in enumerator
        {
            arrayTemp.addObject(element)
        }
        
        return arrayTemp;
    }
    
    static func arrayToJSON(array: AnyObject) -> NSString
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
