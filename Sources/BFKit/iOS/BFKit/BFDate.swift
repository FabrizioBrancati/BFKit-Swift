//
//  BFDateExtension.swift
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

// MARK: - Date extension

/// Extends Date with localization.
public extension Date {
    // MARK: - Functions
    
    /// Get weekday as a localized string from given weekday number:
    /// - 1 - Sunday.
    /// - 2 - Monday.
    /// - 3 - Tuerday.
    /// - 4 - Wednesday.
    /// - 5 - Thursday.
    /// - 6 - Friday.
    /// - 7 - Saturday.
    ///
    /// - Parameter weekday: The weekday to be converted in string.
    /// - Returns: Return weekday as a localized string.
    public static func localizedWeekday(weekday: Int) -> String {
        switch weekday {
        case 1:
            return BFLocalizedString("SUNDAY")
        case 2:
            return BFLocalizedString("MONDAY")
        case 3:
            return BFLocalizedString("TUESDAY")
        case 4:
            return BFLocalizedString("WEDNESDAY")
        case 5:
            return BFLocalizedString("THURSDAY")
        case 6:
            return BFLocalizedString("FRIDAY")
        case 7:
            return BFLocalizedString("SATURDAY")
        default:
            return ""
        }
    }
    
    /// Get month as a localized string from given month number:
    /// - 1 - January.
    /// - 2 - February.
    /// - 3 - March.
    /// - 4 - April.
    /// - 5 - May.
    /// - 6 - June.
    /// - 7 - July.
    /// - 8 - August.
    /// - 9 - September.
    /// - 10 - October.
    /// - 11 - November.
    /// - 12 - December.
    ///
    /// - Parameter month: The month to be converted in string.
    /// - Returns: Returns the given month as a localized string.
    public static func localizedMonth(month: Int) -> String {
        switch month {
        case 1:
            return BFLocalizedString("JANUARY")
        case 2:
            return BFLocalizedString("FEBRUARY")
        case 3:
            return BFLocalizedString("MARCH")
        case 4:
            return BFLocalizedString("APRIL")
        case 5:
            return BFLocalizedString("MAY")
        case 6:
            return BFLocalizedString("JUNE")
        case 7:
            return BFLocalizedString("JULY")
        case 8:
            return BFLocalizedString("AUGUST")
        case 9:
            return BFLocalizedString("SEPTEMBER")
        case 10:
            return BFLocalizedString("OCTOBER")
        case 11:
            return BFLocalizedString("NOVEMBER")
        case 12:
            return BFLocalizedString("DECEMBER")
        default:
            return ""
        }
    }
    
    /// Get weekday as a localized string from current weekday number:
    /// - 1 - Sunday.
    /// - 2 - Monday.
    /// - 3 - Tuerday.
    /// - 4 - Wednesday.
    /// - 5 - Thursday.
    /// - 6 - Friday.
    /// - 7 - Saturday.
    ///
    /// - Returns: Return weekday as a localized string.
    public func localizedWeekday() -> String {
        return Date.localizedWeekday(weekday: self.weekday)
    }
    
    /// Get month as a localized string from current month:
    /// - 1 - January.
    /// - 2 - February.
    /// - 3 - March.
    /// - 4 - April.
    /// - 5 - May.
    /// - 6 - June.
    /// - 7 - July.
    /// - 8 - August.
    /// - 9 - September.
    /// - 10 - October.
    /// - 11 - November.
    /// - 12 - December.
    ///
    /// - Returns: Returns the given month as a localized string.
    public func localizedMonth() -> String {
        return Date.localizedMonth(month: self.month)
    }
}
