//
//  NSDictionary+BFKit.swift
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

/// This extension adds some useful functions to NSDictionary
public extension NSDictionary {
    // MARK: - Instance functions -
    
    /**
     Convert self to JSON as String
    
     - returns: Returns the JSON as String or nil if error while parsing
     */
    @available(*, deprecated=1.3.0, message="Use dictionaryToJSON()")
    public func dictionaryToJson()  throws-> String {
        return try self.dictionaryToJSON()
    }
    
    /**
     Convert self to JSON as String
    
     - returns: Returns the JSON as String or nil if error while parsing
     */
    public func dictionaryToJSON() throws -> String {
        return try NSDictionary.dictionaryToJSON(self)
    }
    
    /**
     Returns an object if key exists or nil if not
     
     - parameter key: Key to get value of
     
     - returns: Value for the key Or nil
     */
    public func safeObjectForKey(key: String) -> AnyObject? {
        if let value = self[key] {
            return value
        } else {
            return nil
        }
    }
    
    // MARK: - Class functions -
    
    /**
     Convert the given dictionary to JSON as String
    
     - parameter dictionary: The dictionary to be converted
    
     - returns: Returns the JSON as String or nil if error while parsing
     */
    @available(*, deprecated=1.3.0, message="Use dictionaryToJSON(_ )")
    public static func dictionaryToJson(dictionary: NSDictionary) throws -> String {
        return try self.dictionaryToJSON(dictionary)
    }
    
    /**
     Convert the given dictionary to JSON as String
    
     - parameter dictionary: The dictionary to be converted
    
     - returns: Returns the JSON as String or nil if error while parsing
     */
    public static func dictionaryToJSON(dictionary: NSDictionary) throws -> String {
        var json: NSString
        let jsonData: NSData = try NSJSONSerialization.dataWithJSONObject(dictionary, options: .PrettyPrinted)
        
        if jsonData == false {
            return "{}"
        } else {
            json = NSString(data: jsonData, encoding: NSUTF8StringEncoding)!
            return json as String
        }
    }
}
