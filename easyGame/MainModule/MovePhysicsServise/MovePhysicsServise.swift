//
//  MovePhysicsServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

protocol MovePhysicsServiseProtocol {
    init(gameObjects: [Object], room: (x: Int, y: Int), scoreServise: ScoreServiseProtocol)
    var scoreServise: ScoreServiseProtocol! { get }
    func universalMove(personage: Object.Name, direction: Object.Direction)
    func antiheroMove()
}

class MovePhysicsServise: MovePhysicsServiseProtocol {
    
    var scoreServise: ScoreServiseProtocol!
    private var gameObjects: [Object]
    private var room: (x: Int, y: Int)!
    private var hero: Object!
    private var antiHero: Object!
    
    required init(gameObjects: [Object], room: (x: Int, y: Int), scoreServise: ScoreServiseProtocol) {
        self.gameObjects = gameObjects
        self.room = room
        self.scoreServise = scoreServise
        searchHeroes()
    }
    
    //MARK: - Support method
    private func searchHeroes() {
        for i in gameObjects {
            if i.name == .hero {
                hero = i
            }
            if i.name == .antiHero {
                antiHero = i
            }
        }
    }
    
    private func reverseMove(direction: Object.Direction) -> Object.Direction {
        switch direction {
        case .up:
            return .down
        case .left:
            return .right
        case .right:
            return .left
        case .down:
            return .up
        }
    }
    
    //MARK: - Move physics method
    func universalMove(personage: Object.Name, direction: Object.Direction) {
        let reverseMove = reverseMove(direction: direction)
        
        //base move
        if personage == .hero {
            hero.baseMovement(direction: direction)
        } else if personage == .antiHero {
            antiHero.baseMovement(direction: direction)
        }
        
        for i in gameObjects {
            for j in gameObjects {
                switch (i.name, j.name) {
                //push box
                case (.hero, .box):
                    if i.x == j.x && i.y == j.y {
                        j.baseMovement(direction: direction)
                    }
                    if j.x == 1 || j.y == 1 || j.x == room.x || j.y == room.y {
                        if i.y == j.y && i.x == j.x {
                            i.baseMovement(direction: reverseMove)
                        }
                    }
                //stop move
                case (.hero, .palm), (.antiHero, .palm), (.antiHero, .box), (.antiHero, .heart):
                    if i.x == j.x && i.y == j.y {
                        i.baseMovement(direction: reverseMove)
                    }
                //hero drop heart
                case (.hero, .antiHero):
                    if i.x == j.x && i.y == j.y {
                        scoreServise?.dropHeart()
                    }
                //collect hearts
                case (.hero, .heart):
                    if i.x == j.x && i.y == j.y {
                        scoreServise?.addHeart()
                        j.x = Int.random(in: 1...room.x)
                        j.y = Int.random(in: 1...room.y)
                    }
                //stop push box
                case (.box, .palm), (.box, .box), (.box, .heart): //(.box, .antiHero)
                    if i.index != j.index {
                        if i.x == j.x && i.y == j.y {
                            i.baseMovement(direction: reverseMove)
                            if hero.x == i.x && hero.y == i.y {
                                hero.baseMovement(direction: reverseMove)
                            }
                        }
                    }
                default:
                    break
                }
            }
        }
    }
    
    //MARK: - Antihero move method
    
    func antiheroMove() {
        switch Int.random(in: 1...4) {
        case 1:
            universalMove(personage: .antiHero, direction: .up)
        case 2:
            universalMove(personage: .antiHero, direction: .left)
        case 3:
            universalMove(personage: .antiHero, direction: .right)
        case 4:
            universalMove(personage: .antiHero, direction: .down)
        default:
            break
        }
    }
}
