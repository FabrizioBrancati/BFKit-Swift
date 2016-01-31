//
//  NSData+BFKit.swift
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

/// This extension add some useful functions to NSData
public extension NSData {
    // MARK: - Instance functions -
    
    /**
    Convert self to a UTF8 NSString
    
    - returns: Returns self as UTF8 NSString
    */
    public func convertToUTF8String() -> String {
        return NSData.convertToUTF8String(self)
    }
    
    /**
     Convert self to a ASCII NSString
     
     - returns: Returns self as ASCII NSString
     */
    public func convertToASCIIString() -> String {
        return NSData.convertToASCIIString(self)
    }
    
    /**
     Convert self UUID to NSString.
     Useful for push notifications
     
     - returns: Returns self as String from UUID
     */
    public func convertUUIDToString() -> String {
        return self.description.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<>")).stringByReplacingOccurrencesOfString(" ", withString: "")
    }
    
    // MARK: - Class functions -
    
    /**
    Convert the given NSData to UTF8 String
    
    - parameter data: The NSData to be converted
    
    - returns: Returns the converted NSData as UTF8 String
    */
    public static func convertToUTF8String(data: NSData) -> String {
        return NSString(data: data, encoding: NSUTF8StringEncoding) as! String
    }
    
    /**
     Convert the given NSData to ASCII String
     
     - parameter data: The NSData to be converted
     
     - returns: Returns the converted NSData as ASCII String
     */
    public static func convertToASCIIString(data: NSData) -> String {
        return NSString(data: data, encoding: NSASCIIStringEncoding) as! String
    }
}
