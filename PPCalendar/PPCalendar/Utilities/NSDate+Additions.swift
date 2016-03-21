//
//  NSDate+Additions.swift
//  PPCalendar
//
//  Created by Jan Posz on 17.03.2016.
//  Copyright © 2016 Jan Posz. All rights reserved.
//

import Foundation

extension NSDate {
    
    func day() -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Day, fromDate: self)
        return components.day
    }
    
    func month() -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Month, fromDate: self)
        return components.month
    }
    
    func year() -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Year, fromDate: self)
        return components.year
    }
    
    func numberOfDaysInMoth() -> Int {
        let calendar = NSCalendar.currentCalendar()
        let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: self)
        return range.length
    }
    
    func dateByIncrementingMonth() -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: self)
        components.month = components.month + 1
        return calendar.dateFromComponents(components)!
    }
    
    func dateByDecrementingMonth() -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: self)
        components.month = components.month - 1
        return calendar.dateFromComponents(components)!
    }
    
    func dateWithMonthFirstDay() -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: self)
        components.day = 1
        return calendar.dateFromComponents(components)!
    }
    
    func dateWithMonthLastDay() -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: self)
        components.day = self.numberOfDaysInMoth()
        return calendar.dateFromComponents(components)!
    }
    
    func firstMonthDayIndex() -> Int {
        let firstDay = self.dateWithMonthFirstDay()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Weekday, fromDate: firstDay)
        let weekDay = components.weekday
        if (weekDay == 1) {
            return 6
        }
        return weekDay - 2
    }
    
    func lastMonthDayIndex() -> Int {
        let lastDay = self.dateWithMonthLastDay()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Weekday, fromDate: lastDay)
        let weekDay = components.weekday
        return weekDay
    }
    
    class func dateWith(year year : Int, month : Int, day : Int) -> NSDate {
        let components = NSDateComponents()
        components.hour = 12
        components.day = day
        components.month = month
        components.year = year
        return NSCalendar.currentCalendar().dateFromComponents(components)!
    }
    
    //TODO: remove this
    func stringValue() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.stringFromDate(self)
    }
}
