//
//  ViewController.swift
//  PPCalendar
//
//  Created by Jan Posz on 17.03.2016.
//  Copyright © 2016 Woolet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calendar : PPCalendarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar = PPCalendarView(frame: CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width), currentDate: NSDate())
        calendar.registerCellNib(UINib(nibName: "FOOCell", bundle: nil))
        calendar.delegate = self
        calendar.dataSource = self
        self.view.addSubview(calendar.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : PPCalendarViewDelegate {
    
    func PPCalendar(calendar calendarView: PPCalendarView, didSelectCell cell: PPCalendarCell, withDate date: NSDate) {
        print("Selected: \(date)")
    }
}

extension ViewController : PPCalendarViewDataSource {
    
    func PPCalendar(calendar calendarView: PPCalendarView, customizedCell cell: PPCalendarCell, forItemWithDate date: NSDate) -> PPCalendarCell {
        let fooCell = cell as! FOOCell
        fooCell.dayLabel.text = "\(date.day())"
        fooCell.dayLabel.layer.masksToBounds = true
        fooCell.dayLabel.layer.cornerRadius = fooCell.dayLabel.frame.size.width / 2.0
        return fooCell
    }
    
    func PPCalendar(calendar calendarView: PPCalendarView, headerForMonth month: Int, inYear year: Int) -> PPCalendarHeader? {
        return PPCalendarHeader.defaultHeaderWithDate(NSDate.dateWith(year: year, month: month, day: 1), innerFrame: CGRectMake(0, 0, calendar.view.frame.size.width, 40.0), textColor: UIColor.whiteColor(), backgroundColor: UIColor.orangeColor())
    }
    
    func PPCalendar(calendar calendarView: PPCalendarView, headerHeightForMonth month: Int, inYear year: Int) -> CGFloat? {
        return 40.0
    }
    
    func PPCalendar(calendar calendarView: PPCalendarView, sizeForCellWithDate date: NSDate) -> CGSize {
        return CGSizeMake(40.0, 40.0)
    }
}

