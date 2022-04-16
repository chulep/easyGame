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
    
    var gameScreenData: String? { get set }
    var timerServise: TimerServiseProtocol? { get }
    var scoreServise: ScoreServiseProtocol! { get } //
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
    
    var dataTask = [ScoreData]()
    
    var scoreServise: ScoreServiseProtocol!
    private var startBool = false
    var heartsForGameScreen = String()
    var scoreFroGameScreen = String()
    var timerServise: TimerServiseProtocol?
    weak var view: MainViewProtocol?
    var gameScreenData: String?
    private var movePhysicsServise: MovePhysicsServiseProtocol
    private var gameScreenDataServise: GameScreenDataServiseProtocol
    
    required init(view: MainViewProtocol, movePhysicsServise: MovePhysicsServiseProtocol, gameScreenDataServise: GameScreenDataServiseProtocol, scoreServise: ScoreServiseProtocol) {
        self.view = view
        self.movePhysicsServise = movePhysicsServise
        self.gameScreenDataServise = gameScreenDataServise
        self.scoreServise = scoreServise
    }
    
    func createDataFromGameScreen() {
        if startBool == false {
            gameScreenData = "Press START"
            heartsForGameScreen = ""
            scoreFroGameScreen = ""
            view?.updateGameScreen()
        } else {
            gameScreenData = gameScreenDataServise.createData()
            heartsForGameScreen = "heart: \(scoreServise.hearts)"
            scoreFroGameScreen = "score: \(scoreServise.score)"
            view?.updateGameScreen()
        }
        if scoreServise?.hearts == "" {
            startBool = !startBool
            timerServise?.startStopTimer()
            gameScreenData = "Game Over"
            heartsForGameScreen = ""
            gameScreenDataServise.refresh()
            view?.updateGameScreen()
            scoreServise.saveScore()
            scoreServise.reset()
        }
    }
    
    //MARK: - Movement
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
    
    func startButtonTap() {
        startBool = !startBool
        createDataFromGameScreen()
        timerServise?.startStopTimer()
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
