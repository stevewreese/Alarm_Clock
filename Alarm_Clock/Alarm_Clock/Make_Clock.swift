//
//  Make_Clock.swift
//  Alarm_Clock
//
//  Created by u0396206 on 1/24/18.
//  Copyright © 2018 u0396206. All rights reserved.
//

import UIKit

class Make_Clock : UIView {
    
    private let clockLabel: UILabel = {
        let clockLabel = UILabel(frame: .zero)
        
        clockLabel.textColor = UIColor.green
        clockLabel.adjustsFontSizeToFitWidth = true
        clockLabel.textAlignment = NSTextAlignment.center
        return clockLabel
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(clockLabel)
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
        context.fill(bounds)
        context.setFillColor(UIColor.darkGray.cgColor)
        clockLabel.frame = drawingBounds
        let date = Date()
        let calendar = Calendar.current
        var hour = calendar.component(.hour, from: date)
        var timeOfDay: String = ""
        if(hour >= 12)
        {
            hour = hour - 12
            if(hour == 0)
            {
                hour = 12
            }
            timeOfDay = "PM"
        }
        else{
            timeOfDay = "AM"
        }
        let minutes = calendar.component(.minute, from: date)
    
        let day = calendar.component(.weekday, from: date)
        let weekday = getDayofWeek(weekDay: day)
        clockLabel.text = "\(weekday) -> \(hour):\(minutes) \(timeOfDay)"
        
        
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

    
    
    
}
