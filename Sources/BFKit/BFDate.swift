//
//  BFDate+BFKit.swift
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

/// This extension add some useful functions to NSDate
public extension Date {
    /**
     Get the weekday as a localized string from self
     - 1 - Sunday
     - 2 - Monday
     - 3 - Tuerday
     - 4 - Wednesday
     - 5 - Thursday
     - 6 - Friday
     - 7 - Saturday
     
     - returns: Return weekday as a localized string
     */
    public func dayFromWeekday() -> String {
        switch self.weekday() {
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
    
    /**
     Get the month as a localized string from the given month number
     - 1 - January
     - 2 - February
     - 3 - March
     - 4 - April
     - 5 - May
     - 6 - June
     - 7 - July
     - 8 - August
     - 9 - September
     - 10 - October
     - 11 - November
     - 12 - December
     
     - parameter month: The month to be converted in string
     
     - returns: Returns the given month as a localized string
     */
    public static func monthStringWithMonthNumber(_ month: Int) -> String {
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
}
