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
    init(view: MainViewProtocol)
    func createDataFromGameScreen()
    func moveUp()
    func moveLeft()
    func moveRight()
    func moveDown()
}

//MARK: - Presenter class
class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewProtocol?
    let pers = Object(name: .human, x: 1, y: 1)
    var gameScreenData: String!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func createDataFromGameScreen() {
        let obj = [pers]
        var text = ""
        let x = 16
        let y = 12
        
        for i in 0...y - 1 {
            counter: for j in 0...x - 1 {
                for o in obj {
                    switch (o.name, o.x, o.y) {
                    case (.human, let x, let y) where x == j + 1 && y == i + 1:
                        //print("\(o.name.rawValue)", terminator: " ")
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    case (.box, let x, let y) where x == j + 1 && y == i + 1:
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    case (.heart, let x, let y) where x == j + 1 && y == i + 1:
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    case (.palm, let x, let y) where x == j + 1 && y == i + 1:
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    case (.dino, let x, let y) where x == j + 1 && y == i + 1:
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    default:
                        break
                    }
                }
                text.append("⊹ ")
            }
            text.append("\n")
        }
        self.gameScreenData = text
        view?.updateGameScreen()
    }
    
    //MARK: - Movement
    func moveUp() {
        pers.movement(direction: .up)
        createDataFromGameScreen()
    }
    
    func moveLeft() {
        pers.movement(direction: .left)
        createDataFromGameScreen()
    }
    
    func moveRight() {
        pers.movement(direction: .right)
        createDataFromGameScreen()
    }
    
    func moveDown() {
        pers.movement(direction: .down)
        createDataFromGameScreen()
    }
    
}
