//
//  TimerServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

protocol TimerServiseProtocol {
    func startTimer()
    func timerStop()
}

class TimerServise: TimerServiseProtocol {
    private var timer = Timer()
    private var isActiveTimer = Bool()
    weak var presenter: MainPresenterProtocol?
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func startTimer() {
        if isActiveTimer == false {
            timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
        isActiveTimer = true
    }
    
    func timerStop() {
        timer.invalidate()
        isActiveTimer = false
    }
    
    @objc private func timerCallback() {
        presenter?.timerCallback()
    }
}
