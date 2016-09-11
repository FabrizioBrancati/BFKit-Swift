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
    public func characterAtIndex(_ index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
    }

    /**
     It's like substringFromIndex(index: String.Index), but it requires an Int as index

     - parameter index: The index

     - returns: Returns the substring from index
     */
    public func substringFromIndex(_ index: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: index))
    }

    /**
     It's like substringToIndex(index: String.Index), but it requires an Int as index

     - parameter index: The index

     - returns: Returns the substring to index
     */
    public func substringToIndex(_ index: Int) -> String {
        return self.substring(to: self.characters.index(self.startIndex, offsetBy: index))
    }

    /**
     Creates a substring with a given range

     - parameter range: The range

     - returns: Returns the string between the range
     */
    public func substringWithRange(_ range: Range<Int>) -> String {
        let start = self.characters.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.characters.index(self.startIndex, offsetBy: range.upperBound)

        return self.substring(with: start..<end)
    }

    /**
     Creates a substring from the given character

     - parameter character: The character

     - returns: Returns the substring from character
     */
    public func substringFromCharacter(_ character: Character) -> String? {
        let index: Int = self.indexOfCharacter(character)
        if index > -1 {
            return substringFromIndex(index)
        }
        return nil
    }

    /**
     Creates a substring to the given character

     - parameter character: The character

     - returns: Returns the substring to character
     */
    public func substringToCharacter(_ character: Character) -> String? {
        let index: Int = self.indexOfCharacter(character)
        if index > -1 {
            return substringToIndex(index)
        }
        return nil
    }

    /**
     Returns the index of the given character

     - parameter char: The character to search

     - returns: Returns the index of the given character, -1 if not found
     */
    public func indexOfCharacter(_ character: Character) -> Int {
        if let index = self.characters.index(of: character) {
            return self.characters.distance(from: self.startIndex, to: index)
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
    public func searchCharStart(_ charStart: Character, charEnd: Character) -> String {
        return String.searchInString(self, charStart: charStart, charEnd: charEnd)
    }

    /**
     Check if self has the given substring in case-sensitive

     - parameter string:        The substring to be searched
     - parameter caseSensitive: If the search has to be case-sensitive or not

     - returns: Returns true if founded, false if not
     */
    public func hasString(_ string: String, caseSensitive: Bool = true) -> Bool {
        if caseSensitive {
            return self.range(of: string) != nil
        } else {
            return self.lowercased().range(of: string.lowercased()) != nil
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
    public func convertToNSData() -> Data {
        return NSString.convertToNSData(self as NSString)
    }

    /**
     Conver self to a capitalized string.
     Example: "This is a Test" will return "This is a test" and "this is a test" will return "This is a test"

     - returns: Returns the capitalized sentence string
     */
    public func sentenceCapitalizedString() -> String {
        guard self.length > 0 else {
            return ""
        }
        let uppercase: String = self.substringToIndex(1).uppercased()
        let lowercase: String = self.substringFromIndex(1).lowercased()

        return uppercase + lowercase
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
    public func stringByReplacingWithRegex(_ regexString: NSString, withString replacement: NSString) throws -> NSString {
        let regex: NSRegularExpression = try NSRegularExpression(pattern: regexString as String, options: .caseInsensitive)
        return regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range:NSMakeRange(0, self.length), withTemplate: "") as NSString
    }

    /**
     Encode self to an encoded url string

     - returns: Returns the encoded NSString
     */
    public func URLEncode() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
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
            return (self as NSString).deletingLastPathComponent
        }
    }

    /// Delete the path extension
    public var stringByDeletingPathExtension: String {
        get {
            return (self as NSString).deletingPathExtension
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
    public func stringByAppendingPathComponent(_ path: String) -> String {
        let string = self as NSString

        return string.appendingPathComponent(path)
    }

    /**
     Appends a path extension to the string

     - parameter ext: Extension to append

     - returns: returns all the string
     */
    public func stringByAppendingPathExtension(_ ext: String) -> String? {
        let nsSt = self as NSString

        return nsSt.appendingPathExtension(ext)
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
    public func convertToAPNSUUID() -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: "<>")).replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
    }

    /// Returns string with the first character uppercased.
    ///
    /// - returns: Returns string with the first character uppercased.
    public func uppercaseFirst() -> String {
        return String(self.characters.prefix(1)).uppercased() + String(self.characters.dropFirst())
    }

    /// Returns string with the first character lowercased.
    ///
    /// - returns: Returns string with the first character lowercased.
    public func lowercaseFirst() -> String {
        return String(self.characters.prefix(1)).lowercased() + String(self.characters.dropFirst())
    }

    /// Returns the reversed String.
    ///
    /// - parameter preserveFormat: If set to true preserve the String format.
    ///                             The default value is false.
    ///                             **Example:**
    ///                                 "Let's try this function?" ->
    ///                                 "?noitcnuf siht yrt S'tel"
    ///
    /// - returns: Returns the reversed String.
    public func reversed(preserveFormat: Bool = false) -> String {
        guard !self.characters.isEmpty else {
            return ""
        }

        var reversed = String(self.removeExtraSpaces().characters.reversed())

        if !preserveFormat {
            return reversed
        }

        let words = reversed.components(separatedBy: " ").filter { $0 != "" }

        reversed.removeAll()
        for word in words {
            if word.hasUppercaseCharacter() {
                reversed += word.lowercased().uppercaseFirst() + " "
            } else {
                reversed += word.lowercased() + " "
            }
        }

        return reversed
    }


    /// Returns true if the String has at least one uppercase chatacter, otherwise false.
    ///
    /// - returns: Returns true if the String has at least one uppercase chatacter, otherwise false.
    public func hasUppercaseCharacter() -> Bool {
        if CharacterSet.uppercaseLetters.contains(self.unicodeScalars.last!) {
            return true
        }
        return false
    }


    /// Returns true if the String has at least one lowercase chatacter, otherwise false.
    ///
    /// - returns: Returns true if the String has at least one lowercase chatacter, otherwise false.
    public func hasLowercaseCharacter() -> Bool {
        if CharacterSet.lowercaseLetters.contains(self.unicodeScalars.last!) {
            return true
        }
        return false
    }

    // MARK: - Subscript functions -

    /**
     Returns the character at the given index

     - parameter index: The index

     - returns: Returns the character at the given index
     */
    public subscript(index: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: index)]
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
    public static func searchInString(_ string: String, charStart: Character, charEnd: Character) -> String {
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
    public static func isEmail(_ email: String) -> Bool {
        let emailRegEx: String = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"

        let regExPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return regExPredicate.evaluate(with: email.lowercased())
    }

    /**
     Convert a string to UTF8

     - parameter string: String to be converted

     - returns: Returns the converted string
     */
    public static func convertToUTF8Entities(_ string: String) -> String {
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
            .replacingOccurrences(of: "%20", with: " ")
    }

    /**
     Encode the given string to Base64

     - parameter string: String to encode

     - returns: Returns the encoded string
     */
    public static func encodeToBase64(_ string: String) -> String {
        let data: Data = string.data(using: String.Encoding.utf8)!
        return data.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
    }

    /**
     Decode the given Base64 to string

     - parameter string: String to decode

     - returns: Returns the decoded string
     */
    public static func decodeBase64(_ string: String) -> String {
        let data: Data = Data(base64Encoded: string as String, options: .ignoreUnknownCharacters)!
        return NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
    }

    /// Remove double or more duplicated spaces.
    ///
    /// - returns: Remove double or more duplicated spaces.
    public func removeExtraSpaces() -> String {
        return self.NS.removeExtraSpaces() as String
    }

    /**
     Returns a new string containing matching regular expressions replaced with the template string

     - parameter regexString: The regex string
     - parameter replacement: The replacement string

     - returns: Returns a new string containing matching regular expressions replaced with the template string
     */
    public func stringByReplacingWithRegex(_ regexString: String, replacement: String) -> String? {
        return self.NS.stringByReplacingWithRegex(regexString as NSString, replacement: replacement as NSString) as? String
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
        let theUUID: CFUUID? = CFUUIDCreate(kCFAllocatorDefault)
        let string: CFString? = CFUUIDCreateString(kCFAllocatorDefault, theUUID)
        return string! as String
    }
}
