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

extension NSDate
{
    // MARK: - Variables -
    
    struct BFDateInformation
    {
        var day = 0
        var month = 0
        var year = 0
        
        var weekday = 0
        
        var minute = 0
        var hour = 0
        var second = 0
    }
    
    // MARK: - Instance functions -
    
    func dateInformation(timeZone: NSTimeZone = NSTimeZone.systemTimeZone()) -> BFDateInformation
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
    
    func month() -> NSDate
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comp = gregorian!.components(.CalendarUnitYear | .CalendarUnitMonth, fromDate: self)
        
        comp.setValue(1, forComponent: .CalendarUnitDay)
        let date = gregorian?.dateFromComponents(comp)
        return date!
    }
    
    func weekday() -> Int
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comp = gregorian!.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: self)
        
        return comp.weekday
    }
    
    func dayFromWeekday() -> NSString
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
    
    func timelessDate() -> NSDate
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comp = gregorian!.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: self)
        
        return gregorian!.dateFromComponents(comp)!
    }
    
    func monthlessDate() -> NSDate
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let comp = gregorian!.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: self)
        
        return gregorian!.dateFromComponents(comp)!
    }
    
    func isSameDay(anotherDate: NSDate) -> Bool
    {
        let calendar = NSCalendar.currentCalendar()
        let components1 = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: self)
        let components2 = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: anotherDate)
        
        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
    
    func monthsBetweenDate(toDate: NSDate) -> Int
    {
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let components = gregorian!.components(.CalendarUnitMonth, fromDate: self.monthlessDate(), toDate: toDate.monthlessDate(), options: NSCalendarOptions.WrapComponents)
        
        return abs(components.month)
    }
    
    func daysBetweenDate(anotherDate: NSDate) -> Int
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
    
    func isToday() -> Bool
    {
        return self.isSameDay(NSDate())
    }
    
    func dateByAddingDays(days: Int) -> NSDate
    {
        return self.dateByAddingTimeInterval(NSTimeInterval(days * 24 * 60 * 60))
        
        /*var comp = NSDateComponents()
        comp.day = days
        
        return NSCalendar.currentCalendar().dateByAddingComponents(comp, toDate: self, options: .WrapComponents)!*/
    }
    
    func monthString() -> String
    {
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM"
        
        return dateFormatter.stringFromDate(self)
    }
    
    func yearString() -> String
    {
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.stringFromDate(self)
    }
    
    // MARK: - Class functions -
    
    static func yesterday() -> NSDate
    {
        var inf: BFDateInformation = NSDate().dateInformation()
        inf.day--
        return self.dateFromDateInformation(inf)
    }
    
    static func month() -> NSDate
    {
        return NSDate().month()
    }
    
    static func dateFromDateInformation(info: BFDateInformation, timeZone: NSTimeZone = NSTimeZone.systemTimeZone()) -> NSDate
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
    
    static func dateWithDatePart(date: NSDate, andTimePart time: NSDate) -> NSDate
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
    
    static func monthStringWithMonthNumber(month: Int) -> String
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
    
    static func dateInformationDescriptionWithInformation(info: BFDateInformation, dateSeparator: String = "/", usFormat: Bool = false) -> String
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
