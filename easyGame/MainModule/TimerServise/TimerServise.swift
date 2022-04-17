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
    weak var presenter: MainPresenterProtocol!
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func startStopTimer() {
        if isActiveTimer == false {
            timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(moveAntiHero), userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
        }
        isActiveTimer = !isActiveTimer
    }
    
    @objc private func moveAntiHero() {
        switch Int.random(in: 1...4) {
        case 1:
            presenter.moveUp(.antiHero)
        case 2:
            presenter.moveLeft(.antiHero)
        case 3:
            presenter.moveRight(.antiHero)
        case 4:
            presenter.moveDown(.antiHero)
        default:
            break
        }
    }
    
}
