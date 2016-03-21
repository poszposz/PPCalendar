//
//  FOOHeader.swift
//  PPCalendar
//
//  Created by Jan Posz on 21.03.2016.
//  Copyright © 2016 Jan Posz. All rights reserved.
//

import UIKit

class FOOHeader: PPCalendarHeader {

    var dateLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func loadView() {
        dateLabel = UILabel(frame: self.frame)
        dateLabel.textAlignment = .Center
        dateLabel.font = UIFont.boldSystemFontOfSize(25)
        self.addSubview(dateLabel)
        self.backgroundColor = UIColor.lightGrayColor()
    }
}
