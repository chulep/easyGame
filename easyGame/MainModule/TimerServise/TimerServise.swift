//
//  TimerServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

class TimerServise {
    private var timer = Timer()
    private var isActiveTimer = Bool()
    var timerCallback: (() -> ())?
    
    func startTimer() {
        if isActiveTimer == false {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerHelper), userInfo: nil, repeats: true)
        }
        isActiveTimer = true
    }
    
    func timerStop() {
        timer.invalidate()
        isActiveTimer = false
    }
    
    @objc private func timerHelper() {
        timerCallback?()
    }
}
