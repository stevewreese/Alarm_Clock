//
//  Alarm_Time_Control.swift
//  Alarm_Clock
//
//  Created by Stephen Reese on 2/1/18.
//  Copyright © 2018 u0396206. All rights reserved.
//

import UIKit


class Alarm_Time_Control : UIControl {
    
    var time = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        self.isUserInteractionEnabled = true
    }
    
    func initValue(seconds: Int)
    {
        self.time = seconds

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupButtons() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(Alarm_Time_Control.buttonPressed(sender:)), for: .touchUpInside)
        
        self.addSubview(button)
        
    }
    
    @objc func buttonPressed(sender: UIButton!) {
        print("Button tapped")
    }
    
    
    
    func addSecond()
    {
        time = time + 1
    }
    
    func addMinute()
    {
        time = time + 60
    }
    
    func addHour()
    {
        time = time + 3600
    }
    
    func add12Hours()
    {
        time = time + 3600 * 12
    }
    
    func subSecond()
    {
        time = time - 1
    }
    
    func subMinute()
    {
        time = time - 60
    }
    
    func subHour()
    {
        time = time - 3600
    }
    
    func sub12Hours()
    {
        time = time - 3600 * 12
    }
}
