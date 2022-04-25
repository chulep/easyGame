//
//  MainPresenter.swift
//  easyGame
//
//  Created by chulep on 01.02.2022.
//

import Foundation
import CoreData

protocol MainPresenterProtocol: AnyObject {
    
    init(view: MainViewProtocol, movePhysicsServise: MovePhysicsServiseProtocol, gameScreenDataServise: GameScreenDataServiseProtocol, scoreServise: ScoreServiseProtocol)
    
    var timerServise: TimerServiseProtocol! { get }
    var gameScreenData: String? { get set }
    func createDataFromGameScreen()
    func startButtonTap()
    func moveUp(_ personage: Object.Name)
    func moveLeft(_ personage: Object.Name)
    func moveRight(_ personage: Object.Name)
    func moveDown(_ personage: Object.Name)
}

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    var timerServise: TimerServiseProtocol!
    var scoreServise: ScoreServiseProtocol!
    var gameScreenData: String?
    var heartsForGameScreen = String()
    var scoreFomGameScreen = String()
    private var startBool = false
    private var movePhysicsServise: MovePhysicsServiseProtocol
    private var gameScreenDataServise: GameScreenDataServiseProtocol
    
    required init(view: MainViewProtocol, movePhysicsServise: MovePhysicsServiseProtocol, gameScreenDataServise: GameScreenDataServiseProtocol, scoreServise: ScoreServiseProtocol) {
        self.view = view
        self.movePhysicsServise = movePhysicsServise
        self.gameScreenDataServise = gameScreenDataServise
        self.scoreServise = scoreServise
    }
    
    //MARK: - Data from gamescreen
    func createDataFromGameScreen() {
        if startBool == false {
            gameScreenData = "PAUSE"
            heartsForGameScreen = ""
            scoreFomGameScreen = ""
            view?.updateGameScreen()
        } else {
            gameScreenData = gameScreenDataServise.createData()
            heartsForGameScreen = "heart: \(scoreServise.hearts)"
            scoreFomGameScreen = "score: \(scoreServise.score)"
            view?.updateGameScreen()
        }
        if scoreServise?.hearts == "" {
            startBool = !startBool
            timerServise?.stopTimer()
            gameScreenData = "GAME OVER\n \npress START to a new game"
            heartsForGameScreen = ""
            gameScreenDataServise.refreshObjects()
            scoreServise.saveScore()
            scoreServise.reset()
            view?.updateGameScreen()
        }
    }
    
    //MARK: - Movement personage
    func moveUp(_ personage: Object.Name) {
        if startBool == true {
            movePhysicsServise.universalMove(personage: personage, direction: .up)
            createDataFromGameScreen()
        }
    }
    
    func moveLeft(_ personage: Object.Name) {
        if startBool == true {
            movePhysicsServise.universalMove(personage: personage, direction: .left)
            createDataFromGameScreen()
        }
    }
    
    func moveRight(_ personage: Object.Name) {
        if startBool == true {
            movePhysicsServise.universalMove(personage: personage, direction: .right)
            createDataFromGameScreen()
        }
    }
    
    func moveDown(_ personage: Object.Name) {
        if startBool == true {
            movePhysicsServise.universalMove(personage: personage, direction: .down)
            createDataFromGameScreen()
        }
    }
    
    //MARK: - Start buton 
    func startButtonTap() {
        startBool = !startBool
        createDataFromGameScreen()
        timerServise?.startTimer()
    }
    
}
