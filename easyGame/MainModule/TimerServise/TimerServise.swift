//
//  TimerServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

protocol TimerServiseProtocol {
    func startStopTimer()
}

class TimerServise: TimerServiseProtocol {
    private var timer = Timer()
    private var isActiveTimer = false
    weak var presenter: MainPresenterProtocol?
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func startStopTimer() {
        if isActiveTimer == false {
            timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
        }
        isActiveTimer = !isActiveTimer
    }
    
    @objc private func timerCallback() {
        presenter?.timerCallback()
    }
}
