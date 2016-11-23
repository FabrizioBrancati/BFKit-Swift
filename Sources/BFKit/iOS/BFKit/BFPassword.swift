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

// MARK: - BFPassword struct

/// This struct adds some useful functions to manage passwords.
public struct BFPassword {
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
        let lenght = password.length
        let lowercase = password.countLowercaseLetters()
        let uppercase = password.countUppercaseLetters()
        let numbers = password.countNumbers()
        let symbols = password.countSymbols()
        
        var score = 0
        
        if lenght <= 4 {
            score += 5
        } else {
            if lenght > 4 && lenght <= 8 {
                score += 10
            } else {
                if lenght > 8 {
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
            score += 15
        } else {
            if symbols == 2 {
                score += 20
            } else {
                if symbols > 2 {
                    score += 25
                }
            }
        }
        
        if lowercase == 1 {
            score += 5
        } else {
            if lowercase == 2 {
                score += 7
            } else {
                if lowercase > 2 {
                    score += 10
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
        
        if score >= 100 {
            return .verySecure
        } else {
            if score >= 90 {
                return .secure
            } else {
                if score >= 80 {
                    return .veryStrong
                } else {
                    if score >= 70 {
                        return .strong
                    } else {
                        if score >= 60 {
                            return .average
                        } else {
                            if score >= 50 {
                                return .weak
                            } else {
                                return .veryWeak
                            }
                        }
                    }
                }
            }
        }
    }
}
