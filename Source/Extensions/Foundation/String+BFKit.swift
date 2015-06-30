//
//  String+BFKit.swift
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

public extension String
{
    // MARK: - Variables -
    
    public var floatValue: Float
    {
        return (self as NSString).floatValue
    }
    
    // MARK: - Instance functions -
    
    public func length() -> Int
    {
        return count(self)
    }
    
    public func characterAtIndex(index: Int) -> Character
    {
        return self[advance(self.startIndex, index)]
    }
    
    public func substringFromIndex(index: Int) -> String
    {
        return self[advance(self.startIndex, index)...advance(self.startIndex, self.length()-1)]
    }
    
    public func substringToIndex(index: Int) -> String
    {
        return self[advance(self.startIndex, 0)...advance(self.startIndex, index-1)]
    }
    
    public func searchCharStart(charStart: Character, charEnd: Character) -> String
    {
        return String.searchInString(self, charStart: charStart, charEnd: charEnd)
    }
    
    public func hasString(string: String, caseSensitive: Bool = true) -> Bool
    {
        if caseSensitive
        {
            return self.rangeOfString(string) != nil
        }
        else
        {
            return self.lowercaseString.rangeOfString(string.lowercaseString) != nil
        }
    }
    
    public func isEmail() -> Bool
    {
        return String.isEmail(self)
    }
    
    public func encodeToBase64() -> String
    {
        return String.encodeToBase64(self)
    }
    
    public func decodeBase64() -> String
    {
        return String.decodeBase64(self)
    }
    
    public func sentenceCapitalizedString() -> String
    {
        if self.length() == 0
        {
            return ""
        }
        let uppercase: String = self.substringToIndex(1).uppercaseString
        let lowercase: String = self.substringFromIndex(1).lowercaseString
        
        return uppercase.stringByAppendingString(lowercaseString)
    }
    
    public func dateFromTimestamp() -> String
    {
        let year: String = self.substringToIndex(4)
        var month: String = self.substringFromIndex(5)
        month = month.substringToIndex(4)
        var day: String = self.substringFromIndex(8)
        day = day.substringToIndex(2)
        var hours: String = self.substringFromIndex(11)
        hours = hours.substringToIndex(2)
        var minutes: String = self.substringFromIndex(14)
        minutes = minutes.substringToIndex(2)
        
        return "\(day)/\(month)/\(year) \(hours):\(minutes)"
    }
    
    public func URLEncode() -> String
    {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
    
    // TODO: Missing hash functions
    
    private func MD5() -> String
    {
        return ""
    }
    
    private func SHA1() -> String
    {
        return ""
    }
    
    private func SHA256() -> String
    {
        return ""
    }
    
    private func SHA512() -> String
    {
        return ""
    }
    
    // MARK: - Class functions -
    
    public static func searchInString(string: String, charStart: Character, charEnd: Character) -> String
    {
        var start = 0, stop = 0
        
        for var i = 0; i < string.length(); i++
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
        
        var string: String = string.substringFromIndex(start-1)
        string = string.substringFromIndex(0)
        
        return string
    }
    
    public static func isEmail(email: String) -> Bool
    {
        let emailRegEx: String =
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
    
    public static func convertToUTF8Entities(string: String) -> String
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
    
    public static func encodeToBase64(string: String) -> String
    {
        let data: NSData = string.dataUsingEncoding(NSUTF8StringEncoding)!
        return data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
    
    public static func decodeBase64(string: String) -> String
    {
        let data: NSData = NSData(base64EncodedString: string as String, options: NSDataBase64DecodingOptions(rawValue: 0))!
        return NSString(data: data, encoding: NSUTF8StringEncoding)! as String
    }
}
