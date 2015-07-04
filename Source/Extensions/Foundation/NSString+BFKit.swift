//
//  NSString+BFKit.swift
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

/// This extension adds some useful functions to NSString
public extension NSString
{
    // MARK: - Instance functions -
    
    /**
    Search in a given string a substring from the start char to the end char (excluded form final string).
    Example: "This is a test" with start char 'h' and end char 't' will return "is is a "
    
    :param: charStart The start char
    :param: charEnd   The end char
    
    :returns: Returns the substring
    */
    public func searchCharStart(charStart: unichar, charEnd: unichar) -> NSString
    {
        return NSString.searchInString(self, charStart: charStart, charEnd: charEnd)
    }
    
    /**
    Check if self has the given substring in case-sensitive
    
    :param: string        The substring to be searched
    :param: caseSensitive If the search has to be case-sensitive or not
    
    :returns: Returns true if founded, false if not
    */
    public func hasString(string: NSString, caseSensitive: Bool = true) -> Bool
    {
        if caseSensitive
        {
            return !(self.rangeOfString(string as String).location == NSNotFound)
        }
        else
        {
            return !(self.rangeOfString(string.lowercaseString as String).location == NSNotFound)
        }
    }
    
    /**
    Check if self is an email
    
    :returns: Returns true if it's an email, false if not
    */
    public func isEmail() -> Bool
    {
        return NSString.isEmail(self)
    }
    
    /**
    Encode the given string to Base64
    
    :returns: Returns the encoded string
    */
    public func encodeToBase64() -> NSString
    {
        return NSString.encodeToBase64(self)
    }
    
    /**
    Decode the given Base64 to string
    
    :returns: Returns the decoded string
    */
    public func decodeBase64() -> NSString
    {
        return NSString.decodeBase64(self)
    }
    
    /**
    Conver self to a capitalized string.
    Example: "This is a Test" will return "This is a test" and "this is a test" will return "This is a test"
    
    :returns: Returns the capitalized sentence string
    */
    public func sentenceCapitalizedString() -> NSString
    {
        if self.length == 0
        {
            return ""
        }
        let uppercase: NSString = self.substringToIndex(1).uppercaseString
        let lowercase: NSString = self.substringFromIndex(1).lowercaseString
        
        return uppercase.stringByAppendingString(lowercaseString)
    }
    
    /**
    Returns a human legible string from a timestamp
    
    :returns: Returns a human legible string from a timestamp
    */
    public func dateFromTimestamp() -> NSString
    {
        let year: NSString = self.substringToIndex(4)
        var month: NSString = self.substringFromIndex(5)
            month = month.substringToIndex(4)
        var day: NSString = self.substringFromIndex(8)
            day = day.substringToIndex(2)
        var hours: NSString = self.substringFromIndex(11)
            hours = hours.substringToIndex(2)
        var minutes: NSString = self.substringFromIndex(14)
            minutes = minutes.substringToIndex(2)
        
        return "\(day)/\(month)/\(year) \(hours):\(minutes)"
    }
    
    /**
    Encode self to an encoded url string
    
    :returns: Returns the encoded NSString
    */
    public func URLEncode() -> NSString
    {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
    
    // TODO: Missing hash functions
    
    /**
    Create a MD5 string from self
    
    :returns: Returns the MD5 NSString from self
    */
    private func MD5() -> NSString
    {
        return ""
    }
    
    /**
    Create a SHA1 string from self
    
    :returns: Returns the SHA1 NSString from self
    */
    private func SHA1() -> NSString
    {
        return ""
    }
    
    /**
    Create a SHA256 string from self
    
    :returns: Returns the SHA256 NSString from self
    */
    private func SHA256() -> NSString
    {
        return ""
    }
    
    /**
    Create a SHA512 string from self
    
    :returns: Returns the SHA512 NSString from self
    */
    private func SHA512() -> NSString
    {
        return ""
    }
    
    // MARK: - Class functions -
    
    /**
    Search in a given string a substring from the start char to the end char (excluded form final string).
    Example: "This is a test" with start char 'h' and end char 't' will return "is is a "
    
    :param: string    The string to search in
    :param: charStart The start char
    :param: charEnd   The end char
    
    :returns: Returns the substring
    */
    public static func searchInString(string: NSString, charStart: unichar, charEnd: unichar) -> NSString
    {
        var start = 0, stop = 0
        
        for var i = 0; i < string.length; i++
        {
            if string.characterAtIndex(i) == charStart
            {
                start = i+1
                i += 1
            }
            if string.characterAtIndex(i) == charEnd
            {
                stop = i
                break
            }
        }
        
        stop -= start
        
        var string: NSString = string.substringFromIndex(start-1)
        string = string.substringFromIndex(0)
        
        return string
    }
    
    /**
    Check if the given string is an email
    
    :param: email The string to be checked
    
    :returns: Returns true if it's an email, false if not
    */
    public static func isEmail(email: NSString) -> Bool
    {
        let emailRegEx: NSString =
        "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let regExPredicate: NSPredicate = NSPredicate(format: "SELF MATHCES %@", emailRegEx)
        return regExPredicate.evaluateWithObject(email.lowercaseString)
    }
    
    /**
    Convert a string to UTF8
    
    :param: string String to be converted
    
    :returns: Returns the converted string
    */
    public static func convertToUTF8Entities(string: NSString) -> NSString
    {
        return string
            .stringByReplacingOccurrencesOfString("%27", withString: "'")
            .stringByReplacingOccurrencesOfString("%e2%80%99".capitalizedString, withString: "’")
            .stringByReplacingOccurrencesOfString("%2d".capitalizedString, withString: "-")
            .stringByReplacingOccurrencesOfString("%c2%ab".capitalizedString, withString: "«")
            .stringByReplacingOccurrencesOfString("%c2%bb".capitalizedString, withString: "»")
            .stringByReplacingOccurrencesOfString("%c3%80".capitalizedString, withString: "À")
            .stringByReplacingOccurrencesOfString("%c3%82".capitalizedString, withString: "Â")
            .stringByReplacingOccurrencesOfString("%c3%84".capitalizedString, withString: "Ä")
            .stringByReplacingOccurrencesOfString("%c3%86".capitalizedString, withString: "Æ")
            .stringByReplacingOccurrencesOfString("%c3%87".capitalizedString, withString: "Ç")
            .stringByReplacingOccurrencesOfString("%c3%88".capitalizedString, withString: "È")
            .stringByReplacingOccurrencesOfString("%c3%89".capitalizedString, withString: "É")
            .stringByReplacingOccurrencesOfString("%c3%8a".capitalizedString, withString: "Ê")
            .stringByReplacingOccurrencesOfString("%c3%8b".capitalizedString, withString: "Ë")
            .stringByReplacingOccurrencesOfString("%c3%8f".capitalizedString, withString: "Ï")
            .stringByReplacingOccurrencesOfString("%c3%91".capitalizedString, withString: "Ñ")
            .stringByReplacingOccurrencesOfString("%c3%94".capitalizedString, withString: "Ô")
            .stringByReplacingOccurrencesOfString("%c3%96".capitalizedString, withString: "Ö")
            .stringByReplacingOccurrencesOfString("%c3%9b".capitalizedString, withString: "Û")
            .stringByReplacingOccurrencesOfString("%c3%9c".capitalizedString, withString: "Ü")
            .stringByReplacingOccurrencesOfString("%c3%a0".capitalizedString, withString: "à")
            .stringByReplacingOccurrencesOfString("%c3%a2".capitalizedString, withString: "â")
            .stringByReplacingOccurrencesOfString("%c3%a4".capitalizedString, withString: "ä")
            .stringByReplacingOccurrencesOfString("%c3%a6".capitalizedString, withString: "æ")
            .stringByReplacingOccurrencesOfString("%c3%a7".capitalizedString, withString: "ç")
            .stringByReplacingOccurrencesOfString("%c3%a8".capitalizedString, withString: "è")
            .stringByReplacingOccurrencesOfString("%c3%a9".capitalizedString, withString: "é")
            .stringByReplacingOccurrencesOfString("%c3%af".capitalizedString, withString: "ï")
            .stringByReplacingOccurrencesOfString("%c3%b4".capitalizedString, withString: "ô")
            .stringByReplacingOccurrencesOfString("%c3%b6".capitalizedString, withString: "ö")
            .stringByReplacingOccurrencesOfString("%c3%bb".capitalizedString, withString: "û")
            .stringByReplacingOccurrencesOfString("%c3%bc".capitalizedString, withString: "ü")
            .stringByReplacingOccurrencesOfString("%c3%bf".capitalizedString, withString: "ÿ")
            .stringByReplacingOccurrencesOfString("%20", withString: " ")
    }
    
    /**
    Encode the given string to Base64
    
    :param: string String to encode
    
    :returns: Returns the encoded string
    */
    public static func encodeToBase64(string: NSString) -> NSString
    {
        let data: NSData = string.dataUsingEncoding(NSUTF8StringEncoding)!
        return data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
    
    /**
    Decode the given Base64 to string
    
    :param: string String to decode
    
    :returns: Returns the decoded string
    */
    public static func decodeBase64(string: NSString) -> NSString
    {
        let data: NSData = NSData(base64EncodedString: string as String, options: NSDataBase64DecodingOptions(rawValue: 0))!
        return NSString(data: data, encoding: NSUTF8StringEncoding)!
    }
}
