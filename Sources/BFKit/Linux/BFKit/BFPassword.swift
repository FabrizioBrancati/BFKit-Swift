//
//  BFPassword.swift
//  BFKit-Swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2019 Fabrizio Brancati.
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

// MARK: - BFPassword struct

/// This struct adds some useful functions to manage passwords.
public enum BFPassword {
    // MARK: - Variables
    
    /// Password strength level enum, from 0 (min) to 6 (max).
    ///
    /// - veryWeak:   Password strength very weak.
    /// - weak:       Password strength weak.
    /// - average:    Password strength average.
    /// - strong:     Password strength strong.
    /// - veryStrong: Password strength very strong.
    /// - secure:     Password strength secure.
    /// - verySecure: Password strength very secure.
    public enum PasswordStrengthLevel: Int {
        case veryWeak
        case weak
        case average
        case strong
        case veryStrong
        case secure
        case verySecure
    }
    
    // MARK: - Functions
    
    /// Check the password strength level.
    ///
    /// - Rarameter password: Password string.
    /// - Returns: Returns the password strength level with value from enum PasswordStrengthLevel.
    public static func strength(password: String) -> PasswordStrengthLevel {
        switch lengthScore(password) + numbersScore(password) + symbolsScore(password) + lowercasedCharactersScore(password) + uppercasedCharactersScore(password) {
        case 1...49:
            return .veryWeak

        case 50...59:
            return .weak

        case 60...69:
            return .average

        case 70...79:
            return .strong

        case 80...89:
            return .veryStrong

        case 90...99:
            return .secure

        case 100...Int.max:
            return .verySecure

        default:
            return .veryWeak
        }
    }
    
    /// Return the score based on password length.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on password length.
    private static func lengthScore(_ password: String) -> Int {
        let lenght = password.count
        
        switch lenght {
        case 1...4:
            return 5

        case 5...8:
            return 10

        case 9...Int.max:
            return 20

        default:
            return 0
        }
    }
    
    /// Return the score based on number of numbers in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of numbers in password.
    private static func numbersScore(_ password: String) -> Int {
        let numbers = password.countNumbers()
        
        switch numbers {
        case 1:
            return 10

        case 2:
            return 15

        case 3...Int.max:
            return 20

        default:
            return 0
        }
    }
    
    /// Return the score based on number of symbols in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of symbols in password.
    private static func symbolsScore(_ password: String) -> Int {
        let symbols = password.countPunctuations()
        
        switch symbols {
        case 1:
            return 15

        case 2:
            return 20

        case 3...Int.max:
            return 25

        default:
            return 0
        }
    }
    
    /// Return the score based on number of lowercased characters in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of lowercased characters in password.
    private static func lowercasedCharactersScore(_ password: String) -> Int {
        let lowercasedCharacters = password.countLowercasedCharacters()
        
        switch lowercasedCharacters {
        case 1:
            return 5

        case 2:
            return 7

        case 3...Int.max:
            return 10

        default:
            return 0
        }
    }
    
    /// Return the score based on number of uppercased characters in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of uppercased characters in password.
    private static func uppercasedCharactersScore(_ password: String) -> Int {
        let uppercasedCharacters = password.countUppercasedCharacters()
        
        switch uppercasedCharacters {
        case 1:
            return 10

        case 2:
            return 15

        case 3...Int.max:
            return 25

        default:
            return 0
        }
    }
}
