//
//  FOOCell.swift
//  PPCalendar
//
//  Created by Jan Posz on 18.03.2016.
//  Copyright © 2016 Jan Posz. All rights reserved.
//

import UIKit

class FOOCell: PPCalendarCell {
    
    @IBOutlet var dayLabel : UILabel!
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.clearColor()
        dayLabel.clipsToBounds = true
        dayLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
        dayLabel.layer.borderWidth = 2.0
    }
    
    func loadWithDate(date : NSDate) {
        dayLabel.text = "\(date.day())"
    }
}
