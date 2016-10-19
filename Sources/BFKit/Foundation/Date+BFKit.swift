//
//  Date+BFKit.swift
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
    // MARK: - Variables -
    
    /**
     The simplified date structure
     */
    public struct BFDateInformation {
        /// Year
        var year = 0
        /// Month of the year
        var month = 0
        /// Day of the month
        var day = 0
        
        /// Day of the week
        var weekday = 0
        
        /// Hour of the day
        var hour = 0
        /// Minute of the hour
        var minute = 0
        /// Second of the minute
        var second = 0
        /// Nanosecond of the second
        var nanosecond = 0
        
        //  MARK: - Init functions -
        
        /**
         Create a BFDateInformation to access date components easily
         
         - parameter year:       Year
         - parameter month:      Month
         - parameter day:        Day
         - parameter weekday:    Weekday
         - parameter hour:       Hour
         - parameter minute:     Minute
         - parameter second:     Second
         - parameter nanosecond: Nanosecond
         
         - returns: Returns the BFDateInformation instance
         */
        public init(year: Int = 0, month: Int = 0, day: Int = 0, weekday: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0, nanosecond: Int = 0) {
            self.year = year
            self.month = month
            self.day = day
            self.weekday = weekday
            self.hour = hour
            self.minute = minute
            self.second = second
            self.nanosecond = nanosecond
        }
    }
    
    // MARK: - Instance functions -
    
    /**
     Get self as a BFDateInformation structure with a given time zone
    
     - parameter timeZone: The timezone
    
     - returns: Return self as a BFDateInformation structure with a given time zone
     */
    public func dateInformation(_ timeZone: TimeZone = TimeZone.ReferenceType.system) -> BFDateInformation {
        var calendar = Calendar.autoupdatingCurrent
        calendar.timeZone = timeZone
        let comp = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: self)
        
        return BFDateInformation(year: comp.year!, month: comp.month!, day: comp.day!, weekday: comp.weekday!, hour: comp.hour!, minute: comp.minute!, second: comp.second!, nanosecond: comp.nanosecond!)
    }
    
    /**
     Get the month from today
    
     - returns: Return the month
     */
    public func month() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let comp = calendar.dateComponents([.year, .month], from: self)
        
        (comp as NSDateComponents).setValue(1, forComponent: .day)
        
        return calendar.date(from: comp)!
    }
    
    /**
     Get the weekday number from self
     - 1 - Sunday
     - 2 - Monday
     - 3 - Tuerday
     - 4 - Wednesday
     - 5 - Thursday
     - 6 - Friday
     - 7 - Saturday
     
     - returns: Return weekday number
     */
    public func weekday() -> Int {
        let calendar = Calendar.autoupdatingCurrent
        let comp = calendar.dateComponents([.year, .month, .day, .weekday], from: self)
        
        return comp.weekday!
    }
    
    /**
     Private, return the date with time informations
    
     - returns: Return the date with time informations
     */
    private func timelessDate() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let comp = calendar.dateComponents([.year, .month, .day], from: self)
        
        return calendar.date(from: comp)!
    }
    
    /**
     Private, return the date with time informations
    
     - returns: Return the date with time informations
     */
    private func monthlessDate() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let comp = calendar.dateComponents([.year, .month, .day, .weekday], from: self)
        
        return calendar.date(from: comp)!
    }
    
    /**
     Compare self with another date
    
     - parameter anotherDate: The another date to compare as NSDate
    
     - returns: Returns true if is same day, false if not
     */
    public func isSameDay(_ anotherDate: Date) -> Bool {
        let calendar = Calendar.autoupdatingCurrent
        let components1 = calendar.dateComponents([.year, .month, .day], from: self)
        let components2 = calendar.dateComponents([.year, .month, .day], from: anotherDate)
        
        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
    
    /**
     Get the months number between self and another date
    
     - parameter toDate: The another date
    
     - returns: Returns the months between the two dates
     */
    public func monthsBetweenDate(_ toDate: Date) -> Int {
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.month], from: self.monthlessDate(), to: toDate.monthlessDate())
        
        return abs(components.month!)
    }
    
    /**
     Get the days number between self and another date
    
     - parameter anotherDate: The another date
    
     - returns: Returns the days between the two dates
     */
    public func daysBetweenDate(_ anotherDate: Date) -> Int {
        let time: TimeInterval = self.timeIntervalSince(anotherDate)
        return Int(abs(time / 60 / 60 / 24))
    }
    
    /**
     Returns if self is today
    
     - returns: Returns if self is today
     */
    public func isToday() -> Bool {
        return self.isSameDay(Date())
    }
    
    /**
     Add days to self
    
     - parameter days: The number of days to add
    
     - returns: Returns self by adding the gived days number
     */
    public func dateByAddingDays(_ days: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(days * 24 * 60 * 60))
    }
    
    /**
     Get the month string from self
    
     - returns: Returns the month string
     */
    public func monthString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        
        return dateFormatter.string(from: self)
    }
    
    /**
     Get the year string from self
    
     - returns: Returns the year string
     */
    public func yearString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    /**
     Returns date with the year, month and day only.
     
     - returns: Date after removing all components but not year, month and day
     */
    public func shortData() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let comp = calendar.dateComponents([.year, .month, .day], from:self)
        
        return calendar.date(from: comp)!
    }
    
    /**
     Check if the given date is less than self
     
     - parameter dateToCompare: Date to compare
     
     - returns: Returns a true if self is greater than the given one, otherwise false
     */
    public func isGreaterThanDate(_ dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    /**
     Check if the given date is greater than self
     
     - parameter dateToCompare: Date to compare
     
     - returns: Returns a true if self is less than the given one, otherwise false
     */
    public func isLessThanDate(_ dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    // MARK: - Class functions -
    
    /**
     Create a NSDate with the yesterday date
    
     - returns: Returns a NSDate with the yesterday date
     */
    public static func yesterday() -> Date {
        var info: BFDateInformation = Date().dateInformation()
        info.day -= 1
        return self.dateFromDateInformation(info)
    }
    
    /**
     Get the month from today
    
     - returns: Returns the month
     */
    public static func month() -> Date {
        return Date().month()
    }
    
    /**
     Returns a date from a given BFDateInformation structure with a given time zone
    
     - parameter info:     The BFDateInformation to be converted
     - parameter timeZone: The timezone
    
     - returns: Returns a NSDate from a given BFDateInformation structure with a given time zone
     */
    public static func dateFromDateInformation(_ info: BFDateInformation, timeZone: TimeZone = TimeZone.ReferenceType.system) -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let comp = calendar.dateComponents([.year, .month], from:Date())
        
        (comp as NSDateComponents).setValue(info.day, forComponent:.day)
        (comp as NSDateComponents).setValue(info.month, forComponent:.month)
        (comp as NSDateComponents).setValue(info.year, forComponent:.year)
        
        (comp as NSDateComponents).setValue(info.hour, forComponent:.hour)
        (comp as NSDateComponents).setValue(info.minute, forComponent:.minute)
        (comp as NSDateComponents).setValue(info.second, forComponent:.second)
        (comp as NSDateComponents).setValue(info.nanosecond, forComponent:.nanosecond)
        
        (comp as NSDateComponents).setValue(0, forComponent:.timeZone)
        
        return calendar.date(from: comp)!
    }
    
    /**
     Create an NSDate with other two NSDate objects.
     Taken from the first date: day, month and year.
     Taken from the second date: hours and minutes.
    
     - parameter date: The first date for date
     - parameter time: The second date for time
    
     - returns: Returns the created NSDate
     */
    public static func dateWithDatePart(_ date: Date, andTimePart time: Date) -> Date {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let datePortion: String = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "HH:mm"
        let timePortion: String = dateFormatter.string(from: time)
        
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let dateTime = String(format: "%@ %@", datePortion, timePortion)
        
        return dateFormatter.date(from: dateTime)!
    }
    
    /**
     Get the given BFDateInformation structure as a formatted string
    
     - parameter info:          The BFDateInformation to be formatted
     - parameter dateSeparator: The string to be used as date separator
     - parameter usFormat:      Set if the timestamp is in US format or not
     - parameter nanosecond:    Set if the timestamp has to have the nanosecond
    
     - returns: Returns a String in the following format (dateSeparator = "/", usFormat to false and nanosecond to false). D/M/Y H:M:S. Example: 15/10/2013 10:38:43
     */
    public static func dateInformationDescriptionWithInformation(_ info: BFDateInformation, dateSeparator: String = "/", usFormat: Bool = false, nanosecond: Bool = false) -> String {
        var description: String
        
        if usFormat {
            description = String(format: "%04li%@%02li%@%02li %02li:%02li:%02li", info.year, dateSeparator, info.month, dateSeparator, info.day, info.hour, info.minute, info.second)
        } else {
            description = String(format: "%02li%@%02li%@%04li %02li:%02li:%02li", info.month, dateSeparator, info.day, dateSeparator, info.year, info.hour, info.minute, info.second)
        }
        
        if nanosecond {
            description += String(format: ":%03li", info.nanosecond / 1000000)
        }
        
        return description
    }
}

// MARK: - Operators -

public func >(left: Date, right: Date) -> Bool {
    return left.isGreaterThanDate(right)
}

public func <(left: Date, right: Date) -> Bool {
    return left.isLessThanDate(right)
}
