//
//  Alarm_Time_Control.swift
//  Alarm_Clock
//
//  Created by Stephen Reese on 2/1/18.
//  Copyright © 2018 u0396206. All rights reserved.
//

import UIKit

protocol TimeDelegate: class
{
    func sendSeconds(seconds time: Int)
}

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
    
    weak var delegate: TimeDelegate? = nil
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupButtons() {
        let buttonAddSec = UIButton(frame: CGRect(x: 100, y: 0, width: 25, height: 25))
        buttonAddSec.backgroundColor = .green
        buttonAddSec.setTitle("+S", for: .normal)
        buttonAddSec.addTarget(self, action: #selector(Alarm_Time_Control.addSeconds(sender:)), for: .touchUpInside)
        
        self.addSubview(buttonAddSec)
        
        let buttonMinusSec = UIButton(frame: CGRect(x: 100, y: 75, width: 25, height: 25))
        buttonMinusSec.backgroundColor = .green
        buttonMinusSec.setTitle("-S", for: .normal)
        buttonMinusSec.addTarget(self, action: #selector(Alarm_Time_Control.minusSeconds(sender:)), for: .touchUpInside)
        
        self.addSubview(buttonMinusSec)
        
        let buttonAddMin = UIButton(frame: CGRect(x: 50, y: 0, width: 25, height: 25))
        buttonAddMin.backgroundColor = .green
        buttonAddMin.setTitle("+M", for: .normal)
        buttonAddMin.addTarget(self, action: #selector(Alarm_Time_Control.addMin(sender:)), for: .touchUpInside)
        
        self.addSubview(buttonAddMin)
        
        let buttonMinusMin = UIButton(frame: CGRect(x: 50, y: 75, width: 25, height: 25))
        buttonMinusMin.backgroundColor = .green
        buttonMinusMin.setTitle("-M", for: .normal)
        buttonMinusMin.addTarget(self, action: #selector(Alarm_Time_Control.minusMin(sender:)), for: .touchUpInside)
        
        self.addSubview(buttonMinusMin)
        
        let buttonAddHour = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        buttonAddHour.backgroundColor = .green
        buttonAddHour.setTitle("+H", for: .normal)
        buttonAddHour.addTarget(self, action: #selector(Alarm_Time_Control.addHour2(sender:)), for: .touchUpInside)
        
        self.addSubview(buttonAddHour)
        
        let buttonMinusHour = UIButton(frame: CGRect(x: 0, y: 75, width: 25, height: 25))
        buttonMinusHour.backgroundColor = .green
        buttonMinusHour.setTitle("-H", for: .normal)
        buttonMinusHour.addTarget(self, action: #selector(Alarm_Time_Control.minusHour(sender:)), for: .touchUpInside)
        
        self.addSubview(buttonMinusHour)
        
        let buttonAMPM = UIButton(frame: CGRect(x: 150, y: 0, width: 25, height: 25))
        buttonAMPM.backgroundColor = .green
        buttonAMPM.setTitle("+", for: .normal)
        buttonAMPM.addTarget(self, action: #selector(Alarm_Time_Control.add12(sender:)), for: .touchUpInside)
        
        self.addSubview(buttonAMPM)
        
        let buttonPMAM = UIButton(frame: CGRect(x: 150, y: 75, width: 25, height: 25))
        buttonPMAM.backgroundColor = .green
        buttonPMAM.setTitle("-", for: .normal)
        buttonPMAM.addTarget(self, action: #selector(Alarm_Time_Control.minus12(sender:)), for: .touchUpInside)
        
        self.addSubview(buttonPMAM)
        
        buttonMinusHour.translatesAutoresizingMaskIntoConstraints = false
        buttonAddHour.translatesAutoresizingMaskIntoConstraints = false
        buttonMinusMin.translatesAutoresizingMaskIntoConstraints = false
        buttonAddMin.translatesAutoresizingMaskIntoConstraints = false
        buttonMinusSec.translatesAutoresizingMaskIntoConstraints = false
        buttonAddSec.translatesAutoresizingMaskIntoConstraints = false
        buttonPMAM.translatesAutoresizingMaskIntoConstraints = false
        buttonAMPM.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func addSeconds(sender: UIButton!) {
        print("Button tapped +")
        addSecond()
        delegate?.sendSeconds(seconds: time)
    }
    
    @objc func minusSeconds(sender: UIButton!) {
        print("Button tapped -")
        subSecond()
        delegate?.sendSeconds(seconds: time)
    }
    
    @objc func addMin(sender: UIButton!) {
        print("Button tapped +")
        addMinute()
        delegate?.sendSeconds(seconds: time)
    }
    
    @objc func minusMin(sender: UIButton!) {
        print("Button tapped -")
        subMinute()
        delegate?.sendSeconds(seconds: time)
    }
    
    @objc func addHour2(sender: UIButton!) {
        print("Button tapped +")
        addHour()
        delegate?.sendSeconds(seconds: time)
    }
    
    @objc func minusHour(sender: UIButton!) {
        print("Button tapped -")
        subHour()
        delegate?.sendSeconds(seconds: time)
    }
    
    @objc func add12(sender: UIButton!) {
        print("Button tapped +")
        add12Hours()
        delegate?.sendSeconds(seconds: time)
    }
    
    @objc func minus12(sender: UIButton!) {
        print("Button tapped -")
        sub12Hours()
        delegate?.sendSeconds(seconds: time)
    }
    
    
    func addSecond()
    {
        time = time + 1
        overTime()
    }
    
    func addMinute()
    {
        time = time + 60
        overTime()
    }
    
    func addHour()
    {
        time = time + 3600
        overTime()
    }
    
    func add12Hours()
    {
        time = time + 3600 * 12
        overTime()
    }
    
    func subSecond()
    {
        time = time - 1
        overTime()
    }
    
    func subMinute()
    {
        time = time - 60
        overTime()
    }
    
    func subHour()
    {
        time = time - 3600
        overTime()
    }
    
    func sub12Hours()
    {
        time = time - 3600 * 12
        overTime()
    }
    func overTime()
    {
        print(time)
        if(time < 0)
        {
            time = 86400 + time
        }
        if(time >= 86400)
        {
            time = time - 86400
        }
        
    }
}
