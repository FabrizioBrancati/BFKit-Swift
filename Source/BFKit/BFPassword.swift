//
//  BFPassword.swift
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

/// This class adds some useful functions to manage passwords
public class BFPassword {
    // MARK: - Enums -
    
    /**
     Password strength level enum, from 0 (min) to 6 (max)
    
     - VeryWeak:   Password strength very weak
     - Weak:       Password strength weak
     - Average:    Password strength average
     - Strong:     Password strength strong
     - VeryStrong: Password strength very strong
     - Secure:     Password strength secure
     - VerySecure: Password strength very secure
     */
    public enum PasswordStrengthLevel : Int {
        case VeryWeak
        case Weak
        case Average
        case Strong
        case VeryStrong
        case Secure
        case VerySecure
    }
    
    // MARK: - Class functions -
    
    /**
     Check the password strength level
    
     - parameter password: Password string
    
     - returns: Returns the password strength level with value from enum PasswordStrengthLevel
     */
    public static func checkPasswordStrength(password: String) -> PasswordStrengthLevel {
        let lenght = password.length
        let lowercase = self.countLowercaseLetters(password)
        let uppercase = self.countUppercaseLetters(password)
        let numbers = self.countNumbers(password)
        let symbols = self.countSymbols(password)
        
        var score = 0
        
        if lenght < 5 {
            score += 5
        } else {
            if lenght > 4 && lenght < 8 {
                score += 10
            } else {
                if lenght > 7 {
                    score += 20
                }
            }
        }
        
        if numbers == 1 {
            score += 10
        } else {
            if numbers == 2 {
                score += 15
            } else {
                if numbers > 2 {
                    score += 20
                }
            }
        }
        
        if symbols == 1 {
            score += 10
        } else {
            if symbols == 2 {
                score += 15
            } else {
                if symbols > 2 {
                    score += 20
                }
            }
        }
        
        if lowercase == 1 {
            score += 10
        } else {
            if lowercase == 2 {
                score += 15
            } else {
                if lowercase > 2 {
                    score += 20
                }
            }
        }
        
        if uppercase == 1 {
            score += 10
        } else {
            if uppercase == 2 {
                score += 15
            } else {
                if uppercase > 2 {
                    score += 20
                }
            }
        }
        
        if score == 100 {
            return .VerySecure
        } else {
            if score >= 90 {
                return .Secure
            } else {
                if score >= 80 {
                    return .VeryStrong
                } else {
                    if score >= 70 {
                        return .Strong
                    } else {
                        if score >= 60 {
                            return .Average
                        } else {
                            if score >= 50 {
                                return .Weak
                            } else {
                                return .VeryWeak
                            }
                        }
                    }
                }
            }
        }
    }
    
    /**
     Private, count the number of lowercase letters
    
     - parameter password: Password string
    
     - returns: Number of lowercase letters
     */
    private static func countLowercaseLetters(password: String) -> Int {
        var countChar = 0
        for i in 0 ..< password.length {
            let isLowercase = NSCharacterSet.lowercaseLetterCharacterSet().characterIsMember((String(password) as NSString).characterAtIndex(i))
            if isLowercase {
                countChar += 1
            }
        }
        
        return countChar
    }
    
    /**
     Private, count the number of uppercase letters
    
     - parameter password: Password string
    
     - returns: Number of uppercase letters
     */
    private static func countUppercaseLetters(password: String) -> Int {
        var countChar = 0
        for i in 0 ..< password.length {
            let isUppercase = NSCharacterSet.lowercaseLetterCharacterSet().characterIsMember((String(password) as NSString).characterAtIndex(i))
            if isUppercase {
                countChar += 1
            }
        }
        
        return countChar
    }
    
    /**
     Private, count the number of numbers
    
     - parameter password: Password string
    
     - returns: Number of numbers
     */
    private static func countNumbers(password: String) -> Int {
        var countNumber = 0
        for i in 0 ..< password.length {
            let isNumber = NSCharacterSet(charactersInString: "0123456789").characterIsMember((String(password) as NSString).characterAtIndex(i))
            if isNumber {
                countNumber += 1
            }
        }
        
        return countNumber
    }
    
    /**
     Private, count the number of symbols
    
     - parameter password: Password string
    
     - returns: Number of symbols
     */
    private static func countSymbols(password: String) -> Int {
        var countSymbol = 0
        for i in 0 ..< password.length {
            let isSymbol = NSCharacterSet(charactersInString: "`~!?@#$€£¥§%^&*()_+-={}[]:\";.,<>'•\\|/").characterIsMember((String(password) as NSString).characterAtIndex(i))
            if isSymbol {
                countSymbol += 1
            }
        }
        
        return countSymbol
    }
}
