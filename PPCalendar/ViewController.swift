//
//  ViewController.swift
//  PPCalendar
//
//  Created by Jan Posz on 17.03.2016.
//  Copyright © 2016 Jan Posz. All rights reserved.
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
        fooCell.selectionHandler = {(cell, date) in
            // do any animation you want
        }
        fooCell.loadWithDate(date)
        return cell
    }
    
    func PPCalendar(calendar calendarView: PPCalendarView, headerForMonth month: Int, inYear year: Int) -> PPCalendarHeader? {
        let header = FOOHeader(frame: CGRectMake(0, 0, calendarView.view.frame.size.width, 50.0))
        header.dateLabel.text = "\(month)" + " " + "\(year)"
        return header
    }
    
    func PPCalendar(calendar calendarView: PPCalendarView, headerHeightForMonth month: Int, inYear year: Int) -> CGFloat? {
        return 50.0
    }
    
    func PPCalendar(calendar calendarView: PPCalendarView, sizeForCellWithDate date: NSDate) -> CGSize {
        return CGSizeMake(40.0, 40.0)
    }
}

