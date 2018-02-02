//
//  MainView.swift
//  Alarm_Clock
//
//  Created by Stephen Reese on 1/31/18.
//  Copyright © 2018 u0396206. All rights reserved.
//

import UIKit

class MainView : UIView, TimeDelegate {
    
    enum Alarm_Days {
        case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    } /*A set of enum values which represents the days of the week on which the alarm will occur.*/
    enum Alarm_Time_Zone
    {
        case Hawaii, Alaska, Pacific, Mountain, Central, Eastern
    } /*An enum value indicating which time zone the alarm occurs in.*/
    
    public var theDay = Alarm_Days.Friday
    public var theTimeZone = Alarm_Time_Zone.Mountain
    public var Alarm_Time: Int = 86399/* - An alarm time represented as an NSTimeInterval representing seconds since midnight within a single day. Assume all days have exactly 86400 seconds.*/
    public var Alarm_Duration = 90 /*A value expressed as an NSTimeInterval which represents the number of seconds for which an alarm will sound. Supported values must be between 1 and 120 seconds.*/
    
    public var alarmControl:  Alarm_Time_Control = Alarm_Time_Control(frame: CGRect(x: 110, y: 220, width: 200, height: 200))
    
    let clock: Make_Clock = {
        let clock = Make_Clock()
        clock.translatesAutoresizingMaskIntoConstraints = false
        clock.backgroundColor = UIColor.darkGray
        return clock
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clock.initValues(sec: Alarm_Time, day: "\(theDay)", dur: Alarm_Duration, zone: "\(theTimeZone)")
        addSubview(clock)
        
        alarmControl.initValue(seconds: Alarm_Time)
        alarmControl.delegate = self
        addSubview(alarmControl)
        
    }
    
    
    
    func sendSeconds(seconds time: Int)
    {
        print("it worked \(time)")
        Alarm_Time = time
        clock.setTime(time: time)
        clock.addClock()
        
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        clock.frame = bounds
    }
    
}
