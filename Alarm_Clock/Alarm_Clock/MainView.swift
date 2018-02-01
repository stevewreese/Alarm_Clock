//
//  MainView.swift
//  Alarm_Clock
//
//  Created by Stephen Reese on 1/31/18.
//  Copyright © 2018 u0396206. All rights reserved.
//

import UIKit

class MainView : UIView {
    var Alarm_Time = 0/* - An alarm time represented as an NSTimeInterval representing seconds since midnight within a single day. Assume all days have exactly 86400 seconds.*/
    var Alarm_Duration = 0 /*A value expressed as an NSTimeInterval which represents the number of seconds for which an alarm will sound. Supported values must be between 1 and 120 seconds.*/
    enum Alarm_Days {
        case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    } /*A set of enum values which represents the days of the week on which the alarm will occur.*/
    var Alarm_Time_Zone = 0 /*An enum value indicating which time zone the alarm occurs in.*/
    
    let clock: Make_Clock = {
        let clock = Make_Clock(Seconds: 549, Day: "Monday", Dur: 30)
        clock.translatesAutoresizingMaskIntoConstraints = false
        clock.backgroundColor = UIColor.darkGray
        return clock
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(clock)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        clock.frame = bounds
    }
    
}
