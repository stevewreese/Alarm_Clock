//
//  Make_Clock.swift
//  Alarm_Clock
//
//  Created by u0396206 on 1/24/18.
//  Copyright © 2018 u0396206. All rights reserved.
//

import UIKit
import CoreText

class Make_Clock : UIView {
    
    var seconds = 0
    var timer = Timer()
    var Week_Day = ""
    var alarmPMorAM = 1 //0 = AM 1 = pm
    var alarmHour = 0
    var alarmMinute = 0
    var alarmSec = 0
    var duration = 0
    var TimeZone = ""

    
    
    override init(frame: CGRect){
        
        super.init(frame: frame)
        
    }
    
    func initValues(sec: Int, day: String, dur: Int, zone: String)
    {
        self.seconds = sec
        self.Week_Day = day
        self.duration = dur
        self.TimeZone = zone
        
    }
    
    
    var drawingBounds: CGRect {
        if (bounds.width <= 0.0 || bounds.height <= 0.0)
        {
            return .zero
        }
        if(bounds.width > bounds.height){
            
            return CGRect(x: bounds.midX - (bounds.height * 0.5), y: 0.0, width: bounds.height, height: bounds.height)
            
        }else{
            
            return CGRect(x: 0.0, y: bounds.midY - (bounds.width * 0.5), width: bounds.width, height: bounds.width)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect){
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            return
        }
        context.clear(bounds)
        context.setFillColor((backgroundColor ?? UIColor.white).cgColor)
        
        //context.setFillColor(UIColor.darkGray.cgColor)
        //
        context.fill(bounds)
        
        addClock()
        
  
        
        
    }
    
    
    func getDayofWeek(weekDay: Int) -> String{
        
        switch(weekDay) {
        case 1 :
            return "Sunday"
        case 2  :
            return "Monday"
        case 3 :
            return "Tuesday"
        case 4  :
            return "Wednesday"
        case 5 :
            return "Thursday"
        case 6  :
            return "Friday"
        case 7 :
            return "Saturday"
        default:
            return ""
        }
        
    }
    
    /*@objc func checkClock()
    {
        let date = Date()
        let calendar = Calendar.current
        var hour = calendar.component(.hour, from: date)
        var timeOfDay: Int = -1
        if(hour >= 12)
        {
            hour = hour - 12
            if(hour == 0)
            {
                hour = 12
            }
            timeOfDay = 1
        }
        else{
            timeOfDay = 0
        }
        let minutes = calendar.component(.minute, from: date)
        let day = calendar.component(.weekday, from: date)
        
        if((minutes == alarmMinute && hour == alarmHour) && (timeOfDay == alarmPMorAM && day == alarmDay))
        {
            print("equal")
        }
        
        
    }
    */
    
    @objc func addClock() {
        
        alarmHour = seconds/3600
        alarmMinute = seconds%3600/60
        alarmSec = seconds%60
        var addZeroMin: String = ""
        var addZeroHour: String = ""
        var addZeroSec: String = ""
        var timeOfDay: String = ""
        if(alarmHour >= 12)
        {
            timeOfDay = "PM"
            alarmHour = alarmHour - 11
        }
        else{
            timeOfDay = "AM"
            if(alarmHour == 0)
            {
               alarmHour = 12
            }
        }
        if(alarmMinute < 10)
        {
            addZeroMin = "0"
        }
        if(alarmHour < 10)
        {
            addZeroHour = "0"
        }
        if(alarmSec < 10)
        {
            addZeroSec = "0"
        }

        let rtDay = CGRect(x: -50, y: 200, width: 500, height: 200)
        let paragraphStyleDay = NSMutableParagraphStyle()
        paragraphStyleDay.alignment = .center
        
        let attributesDay = [NSAttributedStringKey.paragraphStyle  :  paragraphStyleDay,
                          NSAttributedStringKey.font            :   UIFont.systemFont(ofSize: 35.0),
                          NSAttributedStringKey.foregroundColor : UIColor.blue,
        ]
        
        var myTextDay = "\(Week_Day)"
        let attrStringDay = NSAttributedString(string: myTextDay,
                                            attributes: attributesDay)
        
        
        attrStringDay.draw(in: rtDay)

        let rt = CGRect(x: -50, y: 250, width: 500, height: 200)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes = [NSAttributedStringKey.paragraphStyle  :  paragraphStyle,
                          NSAttributedStringKey.font            :   UIFont.systemFont(ofSize: 35.0),
                          NSAttributedStringKey.foregroundColor : UIColor.blue,
                          NSAttributedStringKey.backgroundColor : UIColor.white
                          ]
        
        var myText = "\(addZeroHour)\(alarmHour):\(addZeroMin)\(alarmMinute):\(addZeroSec)\(alarmSec) \(timeOfDay)"
        let attrString = NSAttributedString(string: myText,
                                            attributes: attributes)
        
        
        attrString.draw(in: rt)
        
        let rtDuration = CGRect(x: -50, y: 300, width: 500, height: 200)
        let paragraphStyleDuration = NSMutableParagraphStyle()
        paragraphStyleDuration.alignment = .center
        
        let attributesDuration = [NSAttributedStringKey.paragraphStyle  :  paragraphStyleDuration,
                          NSAttributedStringKey.font            :   UIFont.systemFont(ofSize: 35.0),
                          NSAttributedStringKey.foregroundColor : UIColor.blue,
        ]
        
        var myTextDuration = "Duration \(duration)"
        let attrStringDuration = NSAttributedString(string: myTextDuration,
                                            attributes: attributesDuration)
        
        
        attrStringDuration.draw(in: rtDuration)
        
        let rtZone = CGRect(x: -50, y: 350, width: 500, height: 200)
        let paragraphStyleZone = NSMutableParagraphStyle()
        paragraphStyleZone.alignment = .center
        
        let attributesZone = [NSAttributedStringKey.paragraphStyle  :  paragraphStyleZone,
                                  NSAttributedStringKey.font            :   UIFont.systemFont(ofSize: 35.0),
                                  NSAttributedStringKey.foregroundColor : UIColor.blue,
                                  ]
        
        var myTextZone = "\(TimeZone) Time"
        let attrStringZone = NSAttributedString(string: myTextZone,
                                                    attributes: attributesZone)
        
        
        attrStringZone.draw(in: rtZone)
        
  
    }
    
    
    
    /*func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(Make_Clock.checkClock)), userInfo: nil, repeats: true)
    }*/
    
    

    
    
    
}
