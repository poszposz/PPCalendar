//
//  PPCalendarProtocols.swift
//  PPCalendar
//
//  Created by Jan Posz on 18.03.2016.
//  Copyright © 2016 Jan Posz. All rights reserved.
//

import UIKit

//MARK: calendar view

protocol PPCalendarViewDataSource {
    
    func PPCalendar(calendar calendarView : PPCalendarView, customizedCell cell : PPCalendarCell, forItemWithDate date : NSDate) -> PPCalendarCell
    func PPCalendar(calendar calendarView : PPCalendarView, headerForMonth month : Int, inYear year : Int) -> PPCalendarHeader?
    func PPCalendar(calendar calendarView : PPCalendarView, headerHeightForMonth month : Int, inYear year : Int) -> CGFloat?
    func PPCalendar(calendar calendarView : PPCalendarView, sizeForCellWithDate date : NSDate) -> CGSize
}

protocol PPCalendarViewDelegate {
    
    func PPCalendar(calendar calendarView : PPCalendarView, didSelectCell cell : PPCalendarCell, withDate date : NSDate)
}

//MARK: calendar page

protocol PPCalendarPageDataSource {
    
    func PPPage(customizeCell cell : PPCalendarCell, withDate date : NSDate) -> PPCalendarCell
    func PPPage(headerForMonth month : Int, inYear year : Int) -> PPCalendarHeader?
    func PPPage(headerHeightFor month: Int, inYear year : Int) -> CGFloat?
    func PPPage(sizeForCellWithDate date : NSDate) -> CGSize
}

protocol PPCalendarPageDelegate {
    
    func PPPage(didSelectCell cell : PPCalendarCell, withDate date : NSDate)
}
