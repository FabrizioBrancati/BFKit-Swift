//
//  NSDate+BFKit.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Fabrizio Brancati. All rights reserved.
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
public extension NSDate
{
    // MARK: - Variables -
    
    /**
    *  The simplified date structure
    */
    public struct BFDateInformation
    {
        /// Day of the year
        var day = 0
        /// Month of the year
        var month = 0
        /// Year
        var year = 0
        
        /// Day of the week
        var weekday = 0
        
        /// Minute of the day
        var minute = 0
        /// Hour of the day
        var hour = 0
        /// Second of the day
        var second = 0
    }
    
    // MARK: - Instance functions -
    
    /**
    Get self as a BFDateInformation structure with a given time zone
    
    :param: timeZone The timezone
    
    :returns: Return self as a BFDateInformation structure with a given time zone
    */
    public func dateInformation(timeZone: NSTimeZone = NSTimeZone.systemTimeZone()) -> BFDateInformation
    {
        var info = BFDateInformation()
        
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        gregorian?.timeZone = timeZone
        let comp = gregorian!.components(NSCalendarUnit(UInt.max), fromDate: self)
        
        info.day = comp.day
        info.month = comp.month
        info.year = comp.year
        
        info.hour = comp.hour
        info.minute = comp.minute
        info.second = comp.second
        
        info.weekday = comp.weekday
        
        return info
    }
    
    /**
    Get the month from today
    
    :returns: Return the month
    */
    public func month() -> NSDate
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comp = gregorian!.components(.CalendarUnitYear | .CalendarUnitMonth, fromDate: self)
        
        comp.setValue(1, forComponent: .CalendarUnitDay)
        let date = gregorian?.dateFromComponents(comp)
        return date!
    }
    
    /**
    Get the weekday number from self
    
    :returns: Return weekday number
    - [1 - Sunday]
    - [2 - Monday]
    - [3 - Tuerday]
    - [4 - Wednesday]
    - [5 - Thursday]
    - [6 - Friday]
    - [7 - Saturday]
    */
    public func weekday() -> Int
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comp = gregorian!.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: self)
        
        return comp.weekday
    }
    
    /**
    Get the weekday as a localized string from self
    
    :returns: Return weekday as a localized string
    - [1 - Sunday]
    - [2 - Monday]
    - [3 - Tuerday]
    - [4 - Wednesday]
    - [5 - Thursday]
    - [6 - Friday]
    - [7 - Saturday]
    */
    public func dayFromWeekday() -> NSString
    {
        switch self.weekday()
        {
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
    
    :returns: Return the date with time informations
    */
    private func timelessDate() -> NSDate
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comp = gregorian!.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: self)
        
        return gregorian!.dateFromComponents(comp)!
    }
    
    /**
    Private, return the date with time informations
    
    :returns: Return the date with time informations
    */
    private func monthlessDate() -> NSDate
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comp = gregorian!.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: self)
        
        return gregorian!.dateFromComponents(comp)!
    }
    
    /**
    Compare self with another date
    
    :param: anotherDate The another date to compare as NSDate
    
    :returns: Returns true if is same day, false if not
    */
    public func isSameDay(anotherDate: NSDate) -> Bool
    {
        let calendar = NSCalendar.currentCalendar()
        let components1 = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: self)
        let components2 = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: anotherDate)
        
        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
    
    /**
    Get the months number between self and another date
    
    :param: toDate The another date
    
    :returns: Returns the months between the two dates
    */
    public func monthsBetweenDate(toDate: NSDate) -> Int
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let components = gregorian!.components(.CalendarUnitMonth, fromDate: self.monthlessDate(), toDate: toDate.monthlessDate(), options: NSCalendarOptions.WrapComponents)
        
        return abs(components.month)
    }
    
    /**
    Get the days number between self and another date
    
    :param: anotherDate The another date
    
    :returns: Returns the days between the two dates
    */
    public func daysBetweenDate(anotherDate: NSDate) -> Int
    {
        let time: NSTimeInterval = self.timeIntervalSinceDate(anotherDate)
        return Int(abs(time / 60 / 60 / 24))
        
        /*var fromDate: NSDate? = nil
        var toDate: NSDate? = nil
        var duration: NSTimeInterval = 0
        
        let gregorian = NSCalendar.init(identifier: NSCalendarIdentifierGregorian)
        gregorian!.rangeOfUnit(.CalendarUnitDay, startDate: &fromDate, interval: &duration, forDate: self)
        gregorian!.rangeOfUnit(.CalendarUnitDay, startDate: &toDate, interval: &duration, forDate: anotherDate)
        
        let components = gregorian!.components(.CalendarUnitDay, fromDate: fromDate!, toDate: toDate!, options: .WrapComponents)
        
        return abs(components.day)*/
    }
    
    /**
    Returns if self is today
    
    :returns: Returns if self is today
    */
    public func isToday() -> Bool
    {
        return self.isSameDay(NSDate())
    }
    
    /**
    Add days to self
    
    :param: days The number of days to add
    
    :returns: Returns self by adding the gived days number
    */
    public func dateByAddingDays(days: Int) -> NSDate
    {
        return self.dateByAddingTimeInterval(NSTimeInterval(days * 24 * 60 * 60))
        
        /*var comp = NSDateComponents()
        comp.day = days
        
        return NSCalendar.currentCalendar().dateByAddingComponents(comp, toDate: self, options: .WrapComponents)!*/
    }
    
    /**
    Get the month string from self
    
    :returns: Returns the month string
    */
    public func monthString() -> String
    {
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM"
        
        return dateFormatter.stringFromDate(self)
    }
    
    /**
    Get the year string from self
    
    :returns: Returns the year string
    */
    public func yearString() -> String
    {
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.stringFromDate(self)
    }
    
    // MARK: - Class functions -
    
    /**
    Create a NSDate with the yesterday date
    
    :returns: Returns a NSDate with the yesterday date
    */
    public static func yesterday() -> NSDate
    {
        var inf: BFDateInformation = NSDate().dateInformation()
        inf.day--
        return self.dateFromDateInformation(inf)
    }
    
    /**
    Get the month from today
    
    :returns: Returns the month
    */
    public static func month() -> NSDate
    {
        return NSDate().month()
    }
    
    /**
    Returns a date from a given BFDateInformation structure with a given time zone
    
    :param: info     The BFDateInformation to be converted
    :param: timeZone The timezone
    
    :returns: Returns a NSDate from a given BFDateInformation structure with a given time zone
    */
    public static func dateFromDateInformation(info: BFDateInformation, timeZone: NSTimeZone = NSTimeZone.systemTimeZone()) -> NSDate
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comp = gregorian!.components(.CalendarUnitYear | .CalendarUnitMonth, fromDate:NSDate())
        
        comp.setValue(info.day, forComponent:.CalendarUnitDay)
        comp.setValue(info.month, forComponent:.CalendarUnitMonth)
        comp.setValue(info.year, forComponent:.CalendarUnitYear)
        
        comp.setValue(info.hour, forComponent:.CalendarUnitHour)
        comp.setValue(info.minute, forComponent:.CalendarUnitMinute)
        comp.setValue(info.second, forComponent:.CalendarUnitSecond)
        
        comp.setValue(0, forComponent:.CalendarUnitTimeZone)
        
        return gregorian!.dateFromComponents(comp)!
    }
    
    /**
    Create an NSDate with other two NSDate objects.
    Taken from the first date: day, month and year.
    Taken from the second date: hours and minutes.
    
    :param: date The first date for date
    :param: time The second date for time
    
    :returns: Returns the created NSDate
    */
    public static func dateWithDatePart(date: NSDate, andTimePart time: NSDate) -> NSDate
    {
        var dateFormatter: NSDateFormatter = NSDateFormatter()
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
    
    :param: month The month to be converted in string
    - [1 - January]
    - [2 - February]
    - [3 - March]
    - [4 - April]
    - [5 - May]
    - [6 - June]
    - [7 - July]
    - [8 - August]
    - [9 - September]
    - [10 - October]
    - [11 - November]
    - [12 - December]
    
    :returns: Returns the given month as a localized string
    */
    public static func monthStringWithMonthNumber(month: Int) -> String
    {
        switch month
        {
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
    
    :param: info          The BFDateInformation to be formatted
    :param: dateSeparator The string to be used as date separator
    :param: usFormat      Set if the timestamp is in US format or not
    
    :returns: Returns a NSString in the following format (dateSeparator = "/" and usFormat to NO). D/M/Y H:M:S. Example: 15/10/2013 10:38:43
    */
    public static func dateInformationDescriptionWithInformation(info: BFDateInformation, dateSeparator: String = "/", usFormat: Bool = false) -> String
    {
        if(usFormat)
        {
            return String(format:"%04li%@%02li%@%02li %02li:%02li:%02li", info.year, dateSeparator, info.month, dateSeparator, info.day, info.hour, info.minute, info.second)
        }
        else
        {
            return String(format: "%02li%@%02li%@%04li %02li:%02li:%02li", info.month, dateSeparator, info.day, dateSeparator, info.year, info.hour, info.minute, info.second)
        }
    }
}
