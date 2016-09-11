//
//  NSMutableArray+BFKit.swift
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

/// This extension adds some useful functions to NSMutableArray
public extension NSMutableArray {
    // MARK: - Instance functions -
    
    /**
     Create a reversed array from self
    
     - returns: Returns the reversed array
     */
    public override func reversedArray() -> NSMutableArray {
        return super.reversedArray() as! NSMutableArray
    }
    
    /**
     Move an object from an index to another
    
     - parameter from: The index to move from
     - parameter to:   The index to move to
     */
    public func moveObjectFromIndex(_ from: Int, toIndex to: Int) {
        if to != from {
            let obj: Any? = self.safeObjectAtIndex(from)
            self.removeObject(at: from)
            
            if to >= self.count {
                self.add(obj!)
            } else {
                self.insert(obj!, at:to)
            }
        }
    }
    
    // MARK: - Class functions -
    
    /**
     Sort an array by a given key with option for ascending or descending
    
     - parameter key:       The key to order the array
     - parameter array:     The array to be ordered
     - parameter ascending: A Bool to choose if ascending or descending
    
     - returns: Returns the given array ordered by the given key ascending or descending
     */
    public static func sortArrayByKey(_ key: String, array: NSMutableArray, ascending: Bool) -> NSMutableArray {
        var tempArray: NSMutableArray = NSMutableArray()
        tempArray.addObjects(from: array as [AnyObject])
        
        let descriptor: NSSortDescriptor = NSSortDescriptor(key: key, ascending: ascending)
        let sortedArray = tempArray.sortedArray(using: [descriptor])
        
        tempArray.removeAllObjects()
        tempArray = NSMutableArray(array: sortedArray)
        
        array.removeAllObjects()
        array.addObjects(from: tempArray as [AnyObject])
        
        return array
    }
}
