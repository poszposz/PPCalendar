//
//  PPCalendarHeader.swift
//  PPCalendar
//
//  Created by Jan Posz on 18.03.2016.
//  Copyright © 2016 Woolet. All rights reserved.
//

import UIKit

class PPCalendarHeader: UIView {

    class func defaultHeaderWithDate(date : NSDate, innerFrame frame : CGRect, textColor color : UIColor, backgroundColor bgColor : UIColor) -> PPCalendarHeader {
        
        let header = PPCalendarHeader()
        let title = UILabel(frame: frame)
        title.backgroundColor = bgColor
        title.textColor = color
//        title.text = date.stringValue()
        title.font = UIFont.boldSystemFontOfSize(20)
        title.textAlignment = .Center
        header.addSubview(title)
        return header
    }
}
