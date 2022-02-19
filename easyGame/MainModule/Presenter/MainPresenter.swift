//
//  MainPresenter.swift
//  easyGame
//
//  Created by chulep on 01.02.2022.
//

import Foundation

//MARK: - Main Protocols
protocol MainViewProtocol: AnyObject {
    func updateGameScreen()
}

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, movePhysicsServise: MovePhysicsServiseProtocol, gameScreenDataServise: GameScreenDataServiseProtocol)
    var gameScreenData: String? {get set}
    var timerServise: TimerServiseProtocol? {get}
    func createDataFromGameScreen()
    func timerCallback()
    func startButtonTap()
    func moveUp(_ personage: Object.Name)
    func moveLeft(_ personage: Object.Name)
    func moveRight(_ personage: Object.Name)
    func moveDown(_ personage: Object.Name)
}

//MARK: - Presenter class
class MainPresenter: MainPresenterProtocol {

    var timerServise: TimerServiseProtocol?
    weak var view: MainViewProtocol?
    var gameScreenData: String?
    private var movePhysicsServise: MovePhysicsServiseProtocol
    private var gameScreenDataServise: GameScreenDataServiseProtocol
    
    required init(view: MainViewProtocol, movePhysicsServise: MovePhysicsServiseProtocol, gameScreenDataServise: GameScreenDataServiseProtocol) {
        self.view = view
        self.movePhysicsServise = movePhysicsServise
        self.gameScreenDataServise = gameScreenDataServise
    }
    
    func createDataFromGameScreen() {
        gameScreenData = gameScreenDataServise.createData()
        view?.updateGameScreen()
    }
    
    //MARK: - Movement
    func moveUp(_ personage: Object.Name) {
        movePhysicsServise.universalMove(personage: personage, direction: .up)
        createDataFromGameScreen()
    }
    
    func moveLeft(_ personage: Object.Name) {
        movePhysicsServise.universalMove(personage: personage, direction: .left)
        createDataFromGameScreen()
    }
    
    func moveRight(_ personage: Object.Name) {
        movePhysicsServise.universalMove(personage: personage, direction: .right)
        createDataFromGameScreen()
    }
    
    func moveDown(_ personage: Object.Name) {
        movePhysicsServise.universalMove(personage: personage, direction: .down)
        createDataFromGameScreen()
    }
    
    func startButtonTap() {
        timerServise?.startTimer()
    }
    
    func timerCallback() {
        switch Int.random(in: 1...4) {
        case 1:
            moveUp(.antiHero)
        case 2:
            moveLeft(.antiHero)
        case 3:
            moveRight(.antiHero)
        case 4:
            moveDown(.antiHero)
        default:
            break
        }
    }
}
