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
    public func searchCharStart(_ charStart: NSString, charEnd: NSString) -> NSString {
        return NSString.searchInString(self, charStart: charStart, charEnd: charEnd)
    }
    
    /**
     Check if self has the given substring in case-sensitive
    
     - parameter string:        The substring to be searched
     - parameter caseSensitive: If the search has to be case-sensitive or not
    
     - returns: Returns true if founded, false if not
     */
    public func hasString(_ string: NSString, caseSensitive: Bool = true) -> Bool {
        if caseSensitive {
            return !(self.range(of: string as String).location == NSNotFound)
        } else {
            return !(self.range(of: string.lowercased as String).location == NSNotFound)
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
    public func convertToNSData() -> Data {
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
        let uppercase: NSString = self.substring(to: 1).uppercased() as NSString
        let lowercase: NSString = self.substring(from: 1).lowercased() as NSString
        
        return uppercase.appending(lowercase as String) as NSString
    }
    
    /**
     Returns a human legible string from a timestamp
    
     - returns: Returns a human legible string from a timestamp
     */
    public func dateFromTimestamp() -> NSString {
        let year: NSString = self.substring(to: 4) as NSString
        var month: NSString = self.substring(from: 5) as NSString
            month = month.substring(to: 4) as NSString
        var day: NSString = self.substring(from: 8) as NSString
            day = day.substring(to: 2) as NSString
        var hours: NSString = self.substring(from: 11) as NSString
            hours = hours.substring(to: 2) as NSString
        var minutes: NSString = self.substring(from: 14) as NSString
            minutes = minutes.substring(to: 2) as NSString
        
        return "\(day)/\(month)/\(year) \(hours):\(minutes)" as NSString
    }
    
    /**
     Encode self to an encoded url string
    
     - returns: Returns the encoded NSString
     */
    public func URLEncode() -> NSString {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)! as NSString
    }
    
    /**
     Returns a new string containing matching regular expressions replaced with the template string
    
     - parameter regexString: The regex string
     - parameter replacement: The replacement string
    
     - returns: Returns a new string containing matching regular expressions replaced with the template string
     */
    public func stringByReplacingWithRegex(_ regexString: NSString, withString replacement: NSString) throws -> NSString {
        let regex: NSRegularExpression = try NSRegularExpression(pattern: regexString as String, options: .caseInsensitive)
        return regex.stringByReplacingMatches(in: self as String, options: NSRegularExpression.MatchingOptions(rawValue: 0), range:NSMakeRange(0, self.length), withTemplate: "") as NSString
    }
    
    /**
     Returns if self is a valid UUID or not
     
     - returns: Returns if self is a valid UUID or not
     */
    public func isUUID() -> Bool {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: "^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", options: .caseInsensitive)
            let matches: Int = regex.numberOfMatches(in: self as String, options: .reportCompletion, range: NSMakeRange(0, self.length))
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
            let regex: NSRegularExpression = try NSRegularExpression(pattern: "^[0-9a-f]{32}$", options: .caseInsensitive)
            let matches: Int = regex.numberOfMatches(in: self as String, options: .reportCompletion, range: NSMakeRange(0, self.length))
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
        return self.trimmingCharacters(in: CharacterSet(charactersIn: "<>")).replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "") as NSString
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
    public static func searchInString(_ string: NSString, charStart: NSString, charEnd: NSString) -> NSString {
        var start = 0, end = 0
        
        for var i in 0 ..< string.length {
            if string.character(at: i) == charStart.character(at: 0) {
                start = i+1
                i += 1
                continue
            }
            if string.character(at: i) == charEnd.character(at: 0) {
                end = i
                break
            }
        }
        
        end -= start
        
        if end < 0 {
            end = 0
        }
        
        return string.substring(from: start).substringToIndex(end) as NSString
    }
    
    /**
     Check if the given string is an email
    
     - parameter email: The string to be checked
    
     - returns: Returns true if it's an email, false if not
     */
    public static func isEmail(_ email: NSString) -> Bool {
        let emailRegEx: NSString = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let regExPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return regExPredicate.evaluate(with: email.lowercased)
    }
    
    /**
     Convert a string to UTF8
    
     - parameter string: String to be converted
    
     - returns: Returns the converted string
     */
    public static func convertToUTF8Entities(_ string: NSString) -> NSString {
        return string
            .replacingOccurrences(of: "%27", with: "'")
            .replacingOccurrences(of: "%e2%80%99".capitalized, with: "’")
            .replacingOccurrences(of: "%2d".capitalized, with: "-")
            .replacingOccurrences(of: "%c2%ab".capitalized, with: "«")
            .replacingOccurrences(of: "%c2%bb".capitalized, with: "»")
            .replacingOccurrences(of: "%c3%80".capitalized, with: "À")
            .replacingOccurrences(of: "%c3%82".capitalized, with: "Â")
            .replacingOccurrences(of: "%c3%84".capitalized, with: "Ä")
            .replacingOccurrences(of: "%c3%86".capitalized, with: "Æ")
            .replacingOccurrences(of: "%c3%87".capitalized, with: "Ç")
            .replacingOccurrences(of: "%c3%88".capitalized, with: "È")
            .replacingOccurrences(of: "%c3%89".capitalized, with: "É")
            .replacingOccurrences(of: "%c3%8a".capitalized, with: "Ê")
            .replacingOccurrences(of: "%c3%8b".capitalized, with: "Ë")
            .replacingOccurrences(of: "%c3%8f".capitalized, with: "Ï")
            .replacingOccurrences(of: "%c3%91".capitalized, with: "Ñ")
            .replacingOccurrences(of: "%c3%94".capitalized, with: "Ô")
            .replacingOccurrences(of: "%c3%96".capitalized, with: "Ö")
            .replacingOccurrences(of: "%c3%9b".capitalized, with: "Û")
            .replacingOccurrences(of: "%c3%9c".capitalized, with: "Ü")
            .replacingOccurrences(of: "%c3%a0".capitalized, with: "à")
            .replacingOccurrences(of: "%c3%a2".capitalized, with: "â")
            .replacingOccurrences(of: "%c3%a4".capitalized, with: "ä")
            .replacingOccurrences(of: "%c3%a6".capitalized, with: "æ")
            .replacingOccurrences(of: "%c3%a7".capitalized, with: "ç")
            .replacingOccurrences(of: "%c3%a8".capitalized, with: "è")
            .replacingOccurrences(of: "%c3%a9".capitalized, with: "é")
            .replacingOccurrences(of: "%c3%af".capitalized, with: "ï")
            .replacingOccurrences(of: "%c3%b4".capitalized, with: "ô")
            .replacingOccurrences(of: "%c3%b6".capitalized, with: "ö")
            .replacingOccurrences(of: "%c3%bb".capitalized, with: "û")
            .replacingOccurrences(of: "%c3%bc".capitalized, with: "ü")
            .replacingOccurrences(of: "%c3%bf".capitalized, with: "ÿ")
            .replacingOccurrences(of: "%20", with: " ") as NSString
    }
    
    /**
     Encode the given string to Base64
    
     - parameter string: String to encode
    
     - returns: Returns the encoded string
     */
    public static func encodeToBase64(_ string: NSString) -> NSString {
        let data: Data = string.convertToNSData()
        return data.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0)) as NSString
    }
    
    /**
     Decode the given Base64 to string
    
     - parameter string: String to decode
    
     - returns: Returns the decoded string
     */
    public static func decodeBase64(_ string: NSString) -> NSString {
        let data: Data = Data(base64Encoded: string as String, options: .ignoreUnknownCharacters)!
        return data.convertToUTF8String() as NSString as NSString
    }
    
    /**
     Convert the given NSString to NSData
     
     - parameter string: The NSString to be converted
     
     - returns: Returns the converted NSString as NSData
     */
    public static func convertToNSData(_ string: NSString) -> Data {
        return string.data(using: String.Encoding.utf8.rawValue)!
    }
    
    /**
     Remove double or more duplicated spaces
     
     - returns: String without additional spaces
     */
    public func removeExtraSpaces() -> NSString {
        let squashed = self.replacingOccurrences(of: "[ ]+", with: " ", options: .regularExpression, range: NSMakeRange(0, self.length))
        return squashed.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString
    }
    
    /**
     Returns a new string containing matching regular expressions replaced with the template string
     
     - parameter regexString: The regex string
     - parameter replacement: The replacement string
     
     - returns: Returns a new string containing matching regular expressions replaced with the template string
     */
    public func stringByReplacingWithRegex(_ regexString: NSString, replacement: NSString) -> NSString? {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: regexString as String, options: .caseInsensitive)
            return regex.stringByReplacingMatches(in: self as String, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.length), withTemplate: "") as NSString
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
        hex = hex.replacingOccurrences(of: " ", with: "")
        var s: String = ""
        while hex.characters.count > 0 {
            let c: String = hex.substring(to: hex.index(hex.startIndex, offsetBy: 2))
            hex = hex.substring(from: hex.index(hex.startIndex, offsetBy: 2))
            var ch: UInt32 = 0
            Scanner(string: c).scanHexInt32(&ch)
            s = s + String(format: "%c", ch)
        }
        return s as NSString
    }
    
    /**
     Convert string to HEX string
     Example: "hello" -> "68656c6c6f"
     
     - returns: HEX string
     */
    public func stringToHEX() -> NSString {
        let selfString = self as String
        
        let hexString: NSMutableString = NSMutableString()
        
        for i in 0 ..< self.length {
            hexString.appendFormat("%02x", selfString[i ..< i+1])
        }
        
        return hexString
    }
    
    /**
     Used to create an UUID as String
     
     - returns: Returns the created UUID string
     */
    public static func generateUUID() -> NSString {
        let theUUID: CFUUID? = CFUUIDCreate(kCFAllocatorDefault)
        let string: CFString? = CFUUIDCreateString(kCFAllocatorDefault, theUUID)
        return string!
    }
}
