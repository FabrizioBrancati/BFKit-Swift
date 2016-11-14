//
//  DateExtension.swift
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

/// This extension add some useful functions to Date.
public extension Date {
    // MARK: - Variables
    
    /// Set and get current year.
    public var year: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.year], from: self)
            
            guard let year = components.year else {
                return 0
            }
            
            return year
        }
        set {
            let calendar = Calendar.autoupdatingCurrent
            var components = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: self)
            
            components.year = newValue
            
            guard let gregorian = NSCalendar(identifier: .gregorian), let date = gregorian.date(from: components) else {
                return
            }
            
            self = date
        }
    }
    
    /// Set and get current month.
    public var month: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.month], from: self)
            
            guard let month = components.month else {
                return 0
            }
            
            return month
        }
        set {
            let calendar = Calendar.autoupdatingCurrent
            var components = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: self)
            
            components.month = newValue
            
            guard let gregorian = NSCalendar(identifier: .gregorian), let date = gregorian.date(from: components) else {
                return
            }
            
            self = date
        }
    }
    
    /// Set and get current day.
    public var day: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.day], from: self)
            
            guard let day = components.day else {
                return 0
            }
            
            return day
        }
        set {
            let calendar = Calendar.autoupdatingCurrent
            var components = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: self)
            
            components.day = newValue
            
            guard let gregorian = NSCalendar(identifier: .gregorian), let date = gregorian.date(from: components) else {
                return
            }
            
            self = date
        }
    }
    
    /// Set and get current hour.
    public var hour: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.hour], from: self)
            
            guard let hour = components.hour else {
                return 0
            }
            
            return hour
        }
        set {
            let calendar = Calendar.autoupdatingCurrent
            var components = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: self)
            
            components.hour = newValue
            
            guard let gregorian = NSCalendar(identifier: .gregorian), let date = gregorian.date(from: components) else {
                return
            }
            
            self = date
        }
    }
    
    /// Set and get current minute.
    public var minute: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.minute], from: self)
            
            guard let minute = components.minute else {
                return 0
            }
            
            return minute
        }
        set {
            let calendar = Calendar.autoupdatingCurrent
            var components = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: self)
            
            components.minute = newValue
            
            guard let gregorian = NSCalendar(identifier: .gregorian), let date = gregorian.date(from: components) else {
                return
            }
            
            self = date
        }
    }
    
    /// Set and get current second.
    public var second: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.second], from: self)
            
            guard let second = components.second else {
                return 0
            }
            
            return second
        }
        set {
            let calendar = Calendar.autoupdatingCurrent
            var components = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second, .nanosecond], from: self)
            
            components.second = newValue
            
            guard let gregorian = NSCalendar(identifier: .gregorian), let date = gregorian.date(from: components) else {
                return
            }
            
            self = date
        }
    }
    
    /// Set and get current second.
    public var nanosecond: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.nanosecond], from: self)
            
            guard let nanosecond = components.nanosecond else {
                return 0
            }
            
            return nanosecond
        }
    }
    
    /// Get the weekday number from self.
    /// - 1 - Sunday.
    /// - 2 - Monday.
    /// - 3 - Tuerday.
    /// - 4 - Wednesday.
    /// - 5 - Thursday.
    /// - 6 - Friday.
    /// - 7 - Saturday.
    public var weekday: Int {
        get {
            let calendar = Calendar.autoupdatingCurrent
            let components = calendar.dateComponents([.weekday], from: self)
            
            guard let weekday = components.weekday else {
                return 0
            }
            
            return weekday
        }
    }
    
    // MARK: - Functions
    
    /// Creates a Date object from year, month and day as Int.
    ///
    /// - Parameters:
    ///   - year: Year.
    ///   - month: Month.
    ///   - day: Day.
    ///   - hour: Hour.
    ///   - minute: Minute.
    ///   - second: Second.
    public init?(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        guard let gregorian = NSCalendar(identifier: .gregorian), let date = gregorian.date(from: components) else {
            return nil
        }
        self = date
    }
    
    /// Creates a Date object from a date String in a given format.
    ///
    /// - Parameters:
    ///   - dateString: Date String.
    ///   - format: Date String format. Default is "yyyy-MM-dd". Example: "2014-05-20".
    public init?(parse dateString: String, format: String="yyyy-MM-dd") {
        let date = DateFormatter()
        date.timeZone = TimeZone.current
        date.dateFormat = format
        guard let parsed = date.date(from: dateString) else {
            return nil
        }
        self = parsed
    }
    
    /// Return the date with time informations.
    ///
    /// - Returns: Return the date with time informations.
    private func timelessDate() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let comp = calendar.dateComponents([.year, .month, .day], from: self)
        
        return calendar.date(from: comp)!
    }
    
    /// Return the date with time informations.
    ///
    /// - Returns: Return the date with time informations.
    private func monthlessDate() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let comp = calendar.dateComponents([.year, .month, .day, .weekday], from: self)
        
        return calendar.date(from: comp)!
    }
    
    /// Compare self with another date.
    ///
    /// - Parameter anotherDate: The another date to compare as Date.
    /// - Returns: Returns true if is same day, false if not.
    public func isSameDay(_ anotherDate: Date) -> Bool {
        let calendar = Calendar.autoupdatingCurrent
        let components1 = calendar.dateComponents([.year, .month, .day], from: self)
        let components2 = calendar.dateComponents([.year, .month, .day], from: anotherDate)
        
        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
    
    /// Get the months number between self and another date.
    ///
    /// - Parameter toDate: The another date.
    /// - Returns: Returns the months between the two dates.
    public func monthsBetweenDate(_ toDate: Date) -> Int {
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.month], from: self.monthlessDate(), to: toDate.monthlessDate())
        
        return abs(components.month!)
    }
    
    /// Get the days number between self and another date.
    ///
    /// - Parameter anotherDate: The another date.
    /// - Returns: Returns the days between the two dates.
    public func daysBetweenDate(_ anotherDate: Date) -> Int {
        let time: TimeInterval = self.timeIntervalSince(anotherDate)
        return Int(abs(time / 60 / 60 / 24))
    }
    
    /// Returns if self is today.
    ///
    /// - Returns: Returns if self is today.
    public func isToday() -> Bool {
        return self.isSameDay(Date())
    }
    
    /// Add days to self.
    ///
    /// - Parameter days: The number of days to add.
    /// - Returns: Returns self by adding the gived days number.
    public func dateByAddingDays(_ days: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(days * 24 * 60 * 60))
    }
    
    /// Get the month string from self.
    ///
    /// - Returns: Get the month string from self.
    public func monthString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        
        return dateFormatter.string(from: self)
    }
    
    /// Get the year string from self.
    ///
    /// - Returns: Get the year string from self.
    public func yearString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    /// Returns date with the year, month and day only.
    ///
    /// - Returns: Date after removing all components but not year, month and day.
    public func shortDate() -> Date {
        let calendar = Calendar.autoupdatingCurrent
        let comp = calendar.dateComponents([.year, .month, .day], from:self)
        
        return calendar.date(from: comp)!
    }
    
    /// Check if the given date is less than self.
    ///
    /// - Parameter date: Date to compare.
    /// - Returns: Returns a true if self is greater than the given one, otherwise false.
    public func isGreaterThan(_ date: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(date) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    /// Check if the given date is greater than self.
    ///
    /// - Parameter date: Date to compare.
    /// - Returns: Returns a true if self is less than the given one, otherwise false.
    public func isLessThan(_ date: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(date) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    /// Create a Date with the yesterday date.
    ///
    /// - Returns: Returns a Date with the yesterday date.
    public static func yesterday() -> Date {
        var date = Date()
        date.day = date.day - 1
        
        return date
    }
    
    /// Create a Date with other two Date objects.
    /// Taken from the first date: day, month and year.
    /// Taken from the second date: hours and minutes.
    ///
    /// - Parameters:
    ///   - date: The first date for date.
    ///   - time: The second date for time.
    /// - Returns: Returns the created Date.
    public static func dateFrom(date: Date, time: Date) -> Date {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let datePortion: String = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "HH:mm"
        let timePortion: String = dateFormatter.string(from: time)
        
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let dateTime = String(format: "%@ %@", datePortion, timePortion)
        
        return dateFormatter.date(from: dateTime)!
    }
    
    /// Get the given BFDateInformation structure as a formatted string.
    ///
    /// - Parameters:
    ///   - info: The BFDateInformation to be formatted.
    ///   - dateSeparator: The string to be used as date separator.
    ///   - usFormat: Set if the timestamp is in US format or not.
    ///   - nanosecond: Set if the timestamp has to have the nanosecond.
    /// - Returns: Returns a String in the following format (dateSeparator = "/", usFormat to false and nanosecond to false). D/M/Y H:M:S. Example: 15/10/2013 10:38:43.
    public static func dateDescription(_ date: Date, dateSeparator: String = "/", usFormat: Bool = false, nanosecond: Bool = false) -> String {
        var description: String
        
        if usFormat {
            description = String(format: "%04li%@%02li%@%02li %02li:%02li:%02li", date.year, dateSeparator, date.month, dateSeparator, date.day, date.hour, date.minute, date.second)
        } else {
            description = String(format: "%02li%@%02li%@%04li %02li:%02li:%02li", date.month, dateSeparator, date.day, dateSeparator, date.year, date.hour, date.minute, date.second)
        }
        
        if nanosecond {
            description += String(format: ":%03li", date.nanosecond / 1000000)
        }
        
        return description
    }
}


/// Compare two Date objects.
///
/// - Parameters:
///   - left: First Date object to compare.
///   - right: Second Date object to compare.
/// - Returns: Returns if left is greater than right.
public func > (left: Date, right: Date) -> Bool {
    return left.isGreaterThan(right)
}

/// Compare two Date objects.
///
/// - Parameters:
///   - left: First Date object to compare.
///   - right: Second Date object to compare.
/// - Returns: Returns if left is less than right.
public func < (left: Date, right: Date) -> Bool {
    return left.isLessThan(right)
}
