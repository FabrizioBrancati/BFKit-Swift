//
//  NSString+BFKit.swift
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
import UIKit

/// This extension adds some useful functions to NSString
public extension NSString {
    // MARK: - Instance functions -
    
    /**
     Search in a given string a substring from the start char to the end char (excluded form final string).
     Example: "This is a test" with start char 'h' and end char 't' will return "is is a "
    
     - parameter charStart: The start char
     - parameter charEnd:   The end char
    
     - returns: Returns the substring
     */
    public func searchCharStart(charStart: NSString, charEnd: NSString) -> NSString {
        return NSString.searchInString(self, charStart: charStart, charEnd: charEnd)
    }
    
    /**
     Check if self has the given substring in case-sensitive
    
     - parameter string:        The substring to be searched
     - parameter caseSensitive: If the search has to be case-sensitive or not
    
     - returns: Returns true if founded, false if not
     */
    public func hasString(string: NSString, caseSensitive: Bool = true) -> Bool {
        if caseSensitive {
            return !(self.rangeOfString(string as String).location == NSNotFound)
        } else {
            return !(self.rangeOfString(string.lowercaseString as String).location == NSNotFound)
        }
    }
    
    /**
     Check if self is an email
    
     - returns: Returns true if it's an email, false if not
     */
    public func isEmail() -> Bool {
        return NSString.isEmail(self)
    }
    
    /**
     Encode the given string to Base64
    
     - returns: Returns the encoded string
     */
    public func encodeToBase64() -> NSString {
        return NSString.encodeToBase64(self)
    }
    
    /**
     Decode the given Base64 to string
    
     - returns: Returns the decoded string
     */
    public func decodeBase64() -> NSString {
        return NSString.decodeBase64(self)
    }
    
    /**
     Convert self to a NSData
     
     - returns: Returns self as NSData
     */
    public func convertToNSData() -> NSData {
        return NSString.convertToNSData(self)
    }
    
    /**
     Conver self to a capitalized string.
     Example: "This is a Test" will return "This is a test" and "this is a test" will return "This is a test"
    
     - returns: Returns the capitalized sentence string
     */
    public func sentenceCapitalizedString() -> NSString {
        if self.length == 0 {
            return ""
        }
        let uppercase: NSString = self.substringToIndex(1).uppercaseString
        let lowercase: NSString = self.substringFromIndex(1).lowercaseString
        
        return uppercase.stringByAppendingString(lowercase as String)
    }
    
    /**
     Returns a human legible string from a timestamp
    
     - returns: Returns a human legible string from a timestamp
     */
    public func dateFromTimestamp() -> NSString {
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
    
     - returns: Returns the encoded NSString
     */
    public func URLEncode() -> NSString {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
    
    /**
     Returns a new string containing matching regular expressions replaced with the template string
    
     - parameter regexString: The regex string
     - parameter replacement: The replacement string
    
     - returns: Returns a new string containing matching regular expressions replaced with the template string
     */
    public func stringByReplacingWithRegex(regexString: NSString, withString replacement: NSString) throws -> NSString {
        let regex: NSRegularExpression = try NSRegularExpression(pattern: regexString as String, options: .CaseInsensitive)
        return regex.stringByReplacingMatchesInString(self as String, options: NSMatchingOptions(rawValue: 0), range:NSMakeRange(0, self.length), withTemplate: "")
    }
    
    /**
     Returns if self is a valid UUID or not
     
     - returns: Returns if self is a valid UUID or not
     */
    public func isUUID() -> Bool {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: "^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", options: .CaseInsensitive)
            let matches: Int = regex.numberOfMatchesInString(self as String, options: .ReportCompletion, range: NSMakeRange(0, self.length))
            return matches == 1
        } catch {
            return false
        }
    }
    
    /**
     Returns if self is a valid UUID for APNS (Apple Push Notification System) or not
     
     - returns: Returns if self is a valid UUID for APNS (Apple Push Notification System) or not
     */
    public func isUUIDForAPNS() -> Bool {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: "^[0-9a-f]{32}$", options: .CaseInsensitive)
            let matches: Int = regex.numberOfMatchesInString(self as String, options: .ReportCompletion, range: NSMakeRange(0, self.length))
            return matches == 1
        } catch {
            return false
        }
    }
    
    /**
     Converts self to an UUID APNS valid (No "<>" or "-" or spaces)
     
     - returns: Converts self to an UUID APNS valid (No "<>" or "-" or spaces)
     */
    public func convertToAPNSUUID() -> NSString {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<>")).stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("-", withString: "") as NSString
    }
    
    /**
     Used to calculate text height for max width and font
     
     - parameter width: Max width to fit text
     - parameter font:  Font used in text
     
     - returns: Returns the calculated height of string within width using given font
     */
    public func heightForWidth(width: CGFloat, font: UIFont) -> CGFloat {
        var size: CGSize = CGSizeZero
        if self.length > 0 {
            let frame: CGRect = self.boundingRectWithSize(CGSizeMake(width, 999999), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil)
            size = CGSizeMake(frame.size.width, frame.size.height + 1)
        }
        return size.height
    }
    
    // MARK: - Class functions -
    
    /**
     Search in a given string a substring from the start char to the end char (excluded form final string).
     Example: "This is a test" with start char 'h' and end char 't' will return "is is a "
    
     - parameter string:    The string to search in
     - parameter charStart: The start char
     - parameter charEnd:   The end char
    
     - returns: Returns the substring
     */
    public static func searchInString(string: NSString, charStart: NSString, charEnd: NSString) -> NSString {
        var start = 0, end = 0
        
        for var i in 0 ..< string.length {
            if string.characterAtIndex(i) == charStart.characterAtIndex(0) {
                start = i+1
                i += 1
                continue
            }
            if string.characterAtIndex(i) == charEnd.characterAtIndex(0) {
                end = i
                break
            }
        }
        
        end -= start
        
        if end < 0 {
            end = 0
        }
        
        return string.substringFromIndex(start).substringToIndex(end)
    }
    
    /**
     Check if the given string is an email
    
     - parameter email: The string to be checked
    
     - returns: Returns true if it's an email, false if not
     */
    public static func isEmail(email: NSString) -> Bool {
        let emailRegEx: NSString = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let regExPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return regExPredicate.evaluateWithObject(email.lowercaseString)
    }
    
    /**
     Convert a string to UTF8
    
     - parameter string: String to be converted
    
     - returns: Returns the converted string
     */
    public static func convertToUTF8Entities(string: NSString) -> NSString {
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
    
     - parameter string: String to encode
    
     - returns: Returns the encoded string
     */
    public static func encodeToBase64(string: NSString) -> NSString {
        let data: NSData = string.convertToNSData()
        return data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
    
    /**
     Decode the given Base64 to string
    
     - parameter string: String to decode
    
     - returns: Returns the decoded string
     */
    public static func decodeBase64(string: NSString) -> NSString {
        let data: NSData = NSData(base64EncodedString: string as String, options: NSDataBase64DecodingOptions(rawValue: 0))!
        return data.convertToUTF8String()
    }
    
    /**
     Convert the given NSString to NSData
     
     - parameter string: The NSString to be converted
     
     - returns: Returns the converted NSString as NSData
     */
    public static func convertToNSData(string: NSString) -> NSData {
        return string.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    /**
     Remove double or more duplicated spaces
     
     - returns: String without additional spaces
     */
    public func removeExtraSpaces() -> NSString {
        let squashed = self.stringByReplacingOccurrencesOfString("[ ]+", withString: " ", options: .RegularExpressionSearch, range: NSMakeRange(0, self.length))
        return squashed.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    /**
     Returns a new string containing matching regular expressions replaced with the template string
     
     - parameter regexString: The regex string
     - parameter replacement: The replacement string
     
     - returns: Returns a new string containing matching regular expressions replaced with the template string
     */
    public func stringByReplacingWithRegex(regexString: NSString, replacement: NSString) -> NSString? {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: regexString as String, options: .CaseInsensitive)
            return regex.stringByReplacingMatchesInString(self as String, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, self.length), withTemplate: "")
        } catch {
            
        }
        
        return nil
    }
    
    /**
     Convert HEX string (separated by space) to "usual" characters string.
     Example: "68 65 6c 6c 6f" -> "hello"
     
     - returns: Readable string
     */
    public func HEXToString() -> NSString {
        var hex = self as String
        hex = hex.stringByReplacingOccurrencesOfString(" ", withString: "")
        var s: String = ""
        while hex.characters.count > 0 {
            let c: String = hex.substringToIndex(hex.startIndex.advancedBy(2))
            hex = hex.substringFromIndex(hex.startIndex.advancedBy(2))
            var ch: UInt32 = 0
            NSScanner(string: c).scanHexInt(&ch)
            s = s.stringByAppendingString(String(format: "%c", ch))
        }
        return s
    }
    
    /**
     Convert string to HEX string
     Example: "hello" -> "68656c6c6f"
     
     - returns: HEX string
     */
    public func stringToHEX() -> NSString {
        let len: Int = self.length
        let chars: UnsafeMutablePointer<unichar> = UnsafeMutablePointer<unichar>(malloc(len * sizeof(unichar)));
        self.getCharacters(UnsafeMutablePointer<unichar>(chars))
        
        let hexString: NSMutableString = NSMutableString()
        
        for i in 0 ..< len {
            hexString.appendFormat("%02x", chars[i])
        }
        free(chars)
        
        return hexString
    }
    
    /**
     Used to create an UUID as String
     
     - returns: Returns the created UUID string
     */
    public static func generateUUID() -> NSString {
        let theUUID: CFUUIDRef? = CFUUIDCreate(kCFAllocatorDefault)
        let string: CFStringRef? = CFUUIDCreateString(kCFAllocatorDefault, theUUID)
        return string!
    }
}
