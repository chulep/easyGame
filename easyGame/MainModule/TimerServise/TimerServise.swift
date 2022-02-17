//
//  TimerServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

class TimerServise {
    private var timer = Timer()
    var timerCallback: (() -> ())?
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerHelper), userInfo: nil, repeats: true)
    }
    
    func timerStop() {
        timer.invalidate()
    }
    
    @objc private func timerHelper() {
        timerCallback?()
    }
}
