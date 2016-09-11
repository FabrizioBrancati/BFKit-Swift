//
//  String+BFKit.swift
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

/// This extesion adds some useful functions to String
public extension String {
    // MARK: - Variables -
    
    /// Return the float value
    public var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    // MARK: - Instance functions -
    
    /**
     Returns the lenght of the string
    
     - returns: Returns the lenght of the string
     */
    public var length: Int {
        return self.characters.count
    }
    
    /**
     Get the character at a given index
    
     - parameter index: The index
    
     - returns: Returns the character at a given index
     */
    public func characterAtIndex(index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
    
    /**
     It's like substringFromIndex(index: String.Index), but it requires an Int as index
    
     - parameter index: The index
    
     - returns: Returns the substring from index
     */
    public func substringFromIndex(index: Int) -> String {
        return self.substringFromIndex(self.startIndex.advancedBy(index))
    }
    
    /**
     It's like substringToIndex(index: String.Index), but it requires an Int as index
    
     - parameter index: The index
    
     - returns: Returns the substring to index
     */
    public func substringToIndex(index: Int) -> String {
        return self.substringToIndex(self.startIndex.advancedBy(index))
    }
    
    /**
     Creates a substring with a given range
    
     - parameter range: The range
    
     - returns: Returns the string between the range
     */
    public func substringWithRange(range: Range<Int>) -> String {
        let start = self.startIndex.advancedBy(range.startIndex)
        let end = self.startIndex.advancedBy(range.endIndex)
        
        return self.substringWithRange(start..<end)
    }
    
    /**
     Creates a substring from the given character
    
     - parameter character: The character
    
     - returns: Returns the substring from character
     */
    public func substringFromCharacter(character: Character) -> String? {
        if let index: Int = self.indexOfCharacter(character) {
            return substringFromIndex(index)
        }
        return nil
    }
    
    /**
     Creates a substring to the given character
    
     - parameter character: The character
    
     - returns: Returns the substring to character
     */
    public func substringToCharacter(character: Character) -> String? {
        if let index: Int = self.indexOfCharacter(character) {
            return substringToIndex(index)
        }
        return nil
    }
    
    /**
     Returns the index of the given character
    
     - parameter char: The character to search
    
     - returns: Returns the index of the given character, -1 if not found
     */
    public func indexOfCharacter(character: Character) -> Int {
        if let index = self.characters.indexOf(character) {
            return self.startIndex.distanceTo(index)
        }
        return -1
    }
    
    /**
     Search in a given string a substring from the start char to the end char (excluded form final string).
     Example: "This is a test" with start char 'h' and end char 't' will return "is is a "
    
     - parameter charStart: The start char
     - parameter charEnd:   The end char
    
     - returns: Returns the substring
     */
    public func searchCharStart(charStart: Character, charEnd: Character) -> String {
        return String.searchInString(self, charStart: charStart, charEnd: charEnd)
    }
    
    /**
     Check if self has the given substring in case-sensitive
    
     - parameter string:        The substring to be searched
     - parameter caseSensitive: If the search has to be case-sensitive or not
    
     - returns: Returns true if founded, false if not
     */
    public func hasString(string: String, caseSensitive: Bool = true) -> Bool {
        if caseSensitive {
            return self.rangeOfString(string) != nil
        } else {
            return self.lowercaseString.rangeOfString(string.lowercaseString) != nil
        }
    }
    
    /**
     Check if self is an email
    
     - returns: Returns true if it's an email, false if not
     */
    public func isEmail() -> Bool {
        return String.isEmail(self)
    }
    
    /**
     Encode the given string to Base64
    
     - returns: Returns the encoded string
     */
    public func encodeToBase64() -> String {
        return String.encodeToBase64(self)
    }
    
    /**
     Decode the given Base64 to string
    
     - returns: Returns the decoded string
     */
    public func decodeBase64() -> String {
        return String.decodeBase64(self)
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
    public func sentenceCapitalizedString() -> String {
        if self.length == 0 {
            return ""
        }
        let uppercase: String = self.substringToIndex(1).uppercaseString
        let lowercase: String = self.substringFromIndex(1).lowercaseString
        
        return uppercase.stringByAppendingString(lowercase)
    }
    
    /**
     Returns a human legible string from a timestamp
    
     - returns: Returns a human legible string from a timestamp
     */
    public func dateFromTimestamp() -> String {
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
    
    /**
     Returns a new string containing matching regular expressions replaced with the template string
    
     - parameter regexString: The regex string
     - parameter replacement: The replacement string
    
     - returns: Returns a new string containing matching regular expressions replaced with the template string
     */
    public func stringByReplacingWithRegex(regexString: NSString, withString replacement: NSString) throws -> NSString {
        let regex: NSRegularExpression = try NSRegularExpression(pattern: regexString as String, options: .CaseInsensitive)
        return regex.stringByReplacingMatchesInString(self, options: NSMatchingOptions(rawValue: 0), range:NSMakeRange(0, self.length), withTemplate: "")
    }
    
    /**
     Encode self to an encoded url string
    
     - returns: Returns the encoded NSString
     */
    public func URLEncode() -> String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
    
    /// Returns the last path component
    public var lastPathComponent: String {
        get {
            return (self as NSString).lastPathComponent
        }
    }
    
    /// Returns the path extension
    public var pathExtension: String {
        get {
            return (self as NSString).pathExtension
        }
    }
    
    /// Delete the last path component
    public var stringByDeletingLastPathComponent: String {
        get {
            return (self as NSString).stringByDeletingLastPathComponent
        }
    }
    
    /// Delete the path extension
    public var stringByDeletingPathExtension: String {
        get {
            return (self as NSString).stringByDeletingPathExtension
        }
    }
    
    /// Returns an array of path components
    public var pathComponents: [String] {
        get {
            return (self as NSString).pathComponents
        }
    }
    
    /**
     Appends a path component to the string
     
     - parameter path: Path component to append
     
     - returns: Returns all the string
     */
    public func stringByAppendingPathComponent(path: String) -> String {
        let string = self as NSString
        
        return string.stringByAppendingPathComponent(path)
    }
    
    /**
     Appends a path extension to the string
     
     - parameter ext: Extension to append
     
     - returns: returns all the string
     */
    public func stringByAppendingPathExtension(ext: String) -> String? {
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathExtension(ext)
    }
    
    /// Converts self to a NSString
    public var NS: NSString {
        return (self as NSString)
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
    
    // MARK: - Subscript functions -
    
    /**
     Returns the character at the given index
    
     - parameter index: The index
    
     - returns: Returns the character at the given index
     */
    public subscript(index: Int) -> Character {
        return self[self.startIndex.advancedBy(index)]
    }
    
    /**
     Returns the index of the given character, -1 if not found
     
     - parameter character: The character to found
     
     - returns: Returns the index of the given character, -1 if not found
     */
    public subscript(character: Character) -> Int {
        return self.indexOfCharacter(character)
    }
    
    /**
     Returns the character at the given index as String
    
     - parameter index: The index
    
     - returns: Returns the character at the given index as String
     */
    public subscript(index: Int) -> String {
            return String(self[index] as Character)
    }
    
    /**
     Returns the string from a given range
     Example: print("BFKit"[1...3]) the result is "FKi"
    
     - parameter range: The range
    
     - returns: Returns the string from a given range
     */
    public subscript(range: Range<Int>) -> String {
        return substringWithRange(range)
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
    public static func searchInString(string: String, charStart: Character, charEnd: Character) -> String {
        var start = 0, stop = 0
        
        for var i in 0 ..< string.length {
            if string.characterAtIndex(i) == charStart {
                start = i+1
                i += 1
            }
            if string.characterAtIndex(i) == charEnd {
                stop = i
                break
            }
        }
        
        stop -= start
        
        return string.substringFromIndex(start).substringToIndex(stop)
    }
    
    /**
     Check if the given string is an email
    
     - parameter email: The string to be checked
    
     - returns: Returns true if it's an email, false if not
     */
    public static func isEmail(email: String) -> Bool {
        let emailRegEx: String = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let regExPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return regExPredicate.evaluateWithObject(email.lowercaseString)
    }
    
    /**
     Convert a string to UTF8
    
     - parameter string: String to be converted
    
     - returns: Returns the converted string
     */
    public static func convertToUTF8Entities(string: String) -> String {
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
    public static func encodeToBase64(string: String) -> String {
        let data: NSData = string.dataUsingEncoding(NSUTF8StringEncoding)!
        return data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
    
    /**
     Decode the given Base64 to string
    
     - parameter string: String to decode
    
     - returns: Returns the decoded string
     */
    public static func decodeBase64(string: String) -> String {
        let data: NSData = NSData(base64EncodedString: string as String, options: NSDataBase64DecodingOptions(rawValue: 0))!
        return NSString(data: data, encoding: NSUTF8StringEncoding)! as String
    }
    
    /**
     Remove double or more duplicated spaces
     
     - returns: String without additional spaces
     */
    public func removeExtraSpaces() -> String {
        return self.NS.removeExtraSpaces() as String
    }
    
    /**
     Returns a new string containing matching regular expressions replaced with the template string
     
     - parameter regexString: The regex string
     - parameter replacement: The replacement string
     
     - returns: Returns a new string containing matching regular expressions replaced with the template string
     */
    public func stringByReplacingWithRegex(regexString: String, replacement: String) -> String? {
        return self.NS.stringByReplacingWithRegex(regexString, replacement: replacement) as? String
    }
    
    /**
     Convert HEX string (separated by space) to "usual" characters string.
     Example: "68 65 6c 6c 6f" -> "hello"
     
     - returns: Readable string
     */
    public func HEXToString() -> String {
        return self.NS.HEXToString() as String
    }
    
    /**
     Convert string to HEX string
     Example: "hello" -> "68656c6c6f"
     
     - returns: HEX string
     */
    public func stringToHEX() -> String {
        return self.NS.stringToHEX() as String
    }
    
    /**
     Used to create an UUID as String
     
     - returns: Returns the created UUID string
     */
    public static func generateUUID() -> String {
        let theUUID: CFUUIDRef? = CFUUIDCreate(kCFAllocatorDefault)
        let string: CFStringRef? = CFUUIDCreateString(kCFAllocatorDefault, theUUID)
        return string! as String
    }
}
