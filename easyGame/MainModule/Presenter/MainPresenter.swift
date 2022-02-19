//
//  MainPresenter.swift
//  easyGame
//
//  Created by chulep on 01.02.2022.
//

import UIKit

//MARK: - Main Protocols
protocol MainViewProtocol: AnyObject {
    func updateGameScreen()
}

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, movePhysicsServise: MovePhysicsServiseProtocol, gameScreenDataServise: GameScreenDataServiseProtocol)
    var gameScreenData: String? {get set}
    func createDataFromGameScreen()
    func moveUp()
    func moveLeft()
    func moveRight()
    func moveDown()
}

//MARK: - Presenter class
class MainPresenter: MainPresenterProtocol {

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
    func moveUp() {
        movePhysicsServise.universalMove(personage: .hero, direction: .up)
        createDataFromGameScreen()
    }
    
    func moveLeft() {
        movePhysicsServise.universalMove(personage: .hero, direction: .left)
        createDataFromGameScreen()
    }
    
    func moveRight() {
        movePhysicsServise.universalMove(personage: .hero, direction: .right)
        createDataFromGameScreen()
    }
    
    func moveDown() {
        movePhysicsServise.universalMove(personage: .hero, direction: .down)
        createDataFromGameScreen()
    }
    
}
