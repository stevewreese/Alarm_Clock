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
    
    var seconds = 60
    var timer = Timer()
    var alarmDay = 2
    var alarmPMorAM = 1 //0 = AM 1 = pm
    var alarmHour = 7
    var alarmMinute = 33
    var myText = ""
    let rt = CGRect(x: 100, y: 100, width: 100, height: 100)

    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //addSubview(clockLabel)
        runTimer()
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
        //context.setFillColor((backgroundColor ?? UIColor.white).cgColor)
        
        context.setFillColor(UIColor.darkGray.cgColor)
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
    
    @objc func checkClock()
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
    
    
    @objc func addClock() {
        var addZero: String = ""
        var addZeroHour: String = ""
        var timeOfDay: String = ""
        var weekday: String = getDayofWeek(weekDay: alarmDay)
        if(alarmPMorAM == 0)
        {
            timeOfDay = "AM"
        }
        else{
            timeOfDay = "PM"
        }
        if(alarmMinute < 10)
        {
            addZero = "0"
        }
        if(alarmHour < 10)
        {
            addZeroHour = "0"
        }

        

        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes = [NSAttributedStringKey.paragraphStyle  :  paragraphStyle,
                          NSAttributedStringKey.font            :   UIFont.systemFont(ofSize: 15.0),
                          NSAttributedStringKey.foregroundColor : UIColor.blue,
                          ]
        
        myText = "\(weekday) -> \(addZeroHour)\(alarmHour):\(addZero)\(alarmMinute):\(timeOfDay)"
        let attrString = NSAttributedString(string: myText,
                                            attributes: attributes)
        
        
            
        attrString.draw(in: rt)
        setNeedsDisplay(rt)
  
    }
    
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(Make_Clock.checkClock)), userInfo: nil, repeats: true)
    }
    
    

    
    
    
}
