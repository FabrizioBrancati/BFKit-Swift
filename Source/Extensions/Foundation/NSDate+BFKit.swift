//
//  NSDate+BFKit.swift
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
public extension NSDate {
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
    public func dateInformation(timeZone: NSTimeZone = NSTimeZone.systemTimeZone()) -> BFDateInformation {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        calendar.timeZone = timeZone
        let comp = calendar.components(NSCalendarUnit(rawValue: UInt.max), fromDate: self)
        
        return BFDateInformation(year: comp.year, month: comp.month, day: comp.day, weekday: comp.weekday, hour: comp.hour, minute: comp.minute, second: comp.second, nanosecond: comp.nanosecond)
    }
    
    /**
     Get the month from today
    
     - returns: Return the month
     */
    public func month() -> NSDate {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let comp = calendar.components([.Year, .Month], fromDate: self)
        
        if #available(iOS 8.0, *)
        {
            comp.setValue(1, forComponent: .Day)
        } else {
            return calendar.dateFromComponents(comp)!
        }
        return calendar.dateFromComponents(comp)!
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
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let comp = calendar.components([.Year, .Month, .Day, .Weekday], fromDate: self)
        
        return comp.weekday
    }
    
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
    public func dayFromWeekday() -> NSString {
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
     Private, return the date with time informations
    
     - returns: Return the date with time informations
     */
    private func timelessDate() -> NSDate {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let comp = calendar.components([.Year, .Month, .Day], fromDate: self)
        
        return calendar.dateFromComponents(comp)!
    }
    
    /**
     Private, return the date with time informations
    
     - returns: Return the date with time informations
     */
    private func monthlessDate() -> NSDate {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let comp = calendar.components([.Year, .Month, .Day, .Weekday], fromDate: self)
        
        return calendar.dateFromComponents(comp)!
    }
    
    /**
     Compare self with another date
    
     - parameter anotherDate: The another date to compare as NSDate
    
     - returns: Returns true if is same day, false if not
     */
    public func isSameDay(anotherDate: NSDate) -> Bool {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let components1 = calendar.components([.Year, .Month, .Day], fromDate: self)
        let components2 = calendar.components([.Year, .Month, .Day], fromDate: anotherDate)
        
        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
    
    /**
     Get the months number between self and another date
    
     - parameter toDate: The another date
    
     - returns: Returns the months between the two dates
     */
    public func monthsBetweenDate(toDate: NSDate) -> Int {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let components = calendar.components(.Month, fromDate: self.monthlessDate(), toDate: toDate.monthlessDate(), options: NSCalendarOptions.WrapComponents)
        
        return abs(components.month)
    }
    
    /**
     Get the days number between self and another date
    
     - parameter anotherDate: The another date
    
     - returns: Returns the days between the two dates
     */
    public func daysBetweenDate(anotherDate: NSDate) -> Int {
        let time: NSTimeInterval = self.timeIntervalSinceDate(anotherDate)
        return Int(abs(time / 60 / 60 / 24))
    }
    
    /**
     Returns if self is today
    
     - returns: Returns if self is today
     */
    public func isToday() -> Bool {
        return self.isSameDay(NSDate())
    }
    
    /**
     Add days to self
    
     - parameter days: The number of days to add
    
     - returns: Returns self by adding the gived days number
     */
    public func dateByAddingDays(days: Int) -> NSDate {
        return self.dateByAddingTimeInterval(NSTimeInterval(days * 24 * 60 * 60))
    }
    
    /**
     Get the month string from self
    
     - returns: Returns the month string
     */
    public func monthString() -> String {
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM"
        
        return dateFormatter.stringFromDate(self)
    }
    
    /**
     Get the year string from self
    
     - returns: Returns the year string
     */
    public func yearString() -> String {
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.stringFromDate(self)
    }
    
    /**
     Returns date with the year, month and day only.
     
     - returns: Date after removing all components but not year, month and day
     */
    public func shortData() -> NSDate {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let comp = calendar.components([.Year, .Month, .Day], fromDate:self)
        
        return calendar.dateFromComponents(comp)!
    }
    
    /**
     Check if the given date is less than self
     
     - parameter dateToCompare: Date to compare
     
     - returns: Returns a true if self is greater than the given one, otherwise false
     */
    public func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending {
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
    public func isLessThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending {
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
    public static func yesterday() -> NSDate {
        var info: BFDateInformation = NSDate().dateInformation()
        info.day -= 1
        return self.dateFromDateInformation(info)
    }
    
    /**
     Get the month from today
    
     - returns: Returns the month
     */
    public static func month() -> NSDate {
        return NSDate().month()
    }
    
    /**
     Returns a date from a given BFDateInformation structure with a given time zone
    
     - parameter info:     The BFDateInformation to be converted
     - parameter timeZone: The timezone
    
     - returns: Returns a NSDate from a given BFDateInformation structure with a given time zone
     */
    public static func dateFromDateInformation(info: BFDateInformation, timeZone: NSTimeZone = NSTimeZone.systemTimeZone()) -> NSDate {
        let calendar = NSCalendar.autoupdatingCurrentCalendar()
        let comp = calendar.components([.Year, .Month], fromDate:NSDate())
        
        if #available(iOS 8.0, *) {
            comp.setValue(info.day, forComponent:.Day)
            comp.setValue(info.month, forComponent:.Month)
            comp.setValue(info.year, forComponent:.Year)
            
            comp.setValue(info.hour, forComponent:.Hour)
            comp.setValue(info.minute, forComponent:.Minute)
            comp.setValue(info.second, forComponent:.Second)
            comp.setValue(info.nanosecond, forComponent:.Nanosecond)
            
            comp.setValue(0, forComponent:.TimeZone)
        } else {
            return calendar.dateFromComponents(comp)!
        }
        
        return calendar.dateFromComponents(comp)!
    }
    
    /**
     Create an NSDate with other two NSDate objects.
     Taken from the first date: day, month and year.
     Taken from the second date: hours and minutes.
    
     - parameter date: The first date for date
     - parameter time: The second date for time
    
     - returns: Returns the created NSDate
     */
    public static func dateWithDatePart(date: NSDate, andTimePart time: NSDate) -> NSDate {
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let datePortion: String = dateFormatter.stringFromDate(date)
        
        dateFormatter.dateFormat = "HH:mm"
        let timePortion: String = dateFormatter.stringFromDate(time)
        
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let dateTime = String(format: "%@ %@", datePortion, timePortion)
        
        return dateFormatter.dateFromString(dateTime)!
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
    public static func monthStringWithMonthNumber(month: Int) -> String {
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
    
    /**
     Get the given BFDateInformation structure as a formatted string
    
     - parameter info:          The BFDateInformation to be formatted
     - parameter dateSeparator: The string to be used as date separator
     - parameter usFormat:      Set if the timestamp is in US format or not
     - parameter nanosecond:    Set if the timestamp has to have the nanosecond
    
     - returns: Returns a String in the following format (dateSeparator = "/", usFormat to false and nanosecond to false). D/M/Y H:M:S. Example: 15/10/2013 10:38:43
     */
    public static func dateInformationDescriptionWithInformation(info: BFDateInformation, dateSeparator: String = "/", usFormat: Bool = false, nanosecond: Bool = false) -> String {
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

public func >(left: NSDate, right: NSDate) -> Bool {
    return left.isGreaterThanDate(right)
}

public func <(left: NSDate, right: NSDate) -> Bool {
    return left.isLessThanDate(right)
}
