//
//  MovePhysicsServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

class MovePhysicsServise {
    var obects: [Object]!
    var room: (x: Int, y: Int)!
    private var hero: Object!
    private var antiHero: Object!
    
    init(obects: [Object], room: (x: Int, y: Int)) {
        self.obects = obects
        self.room = room
        searchHeroes()
    }
    
    private func searchHeroes() {
        for i in obects {
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
    
    //MARK: - physics method
    func universalMove(personage: Object.Name, direction: Object.Direction) {
        let reverseMove = reverseMove(direction: direction)
        
        //base move
        if personage == .hero {
            hero.baseMovement(direction: direction)
        } else if personage == .antiHero {
            antiHero.baseMovement(direction: direction)
        }
        
        for i in obects {
            for j in obects {
                switch (i.name, j.name) {
                
                //hero physics
                case (.hero, .box):
                    if i.x == j.x && i.y == j.y {
                        j.baseMovement(direction: direction)
                    }
                    if j.x == 1 || j.y == 1 || j.x == room.x || j.y == room.y {
                        if i.y == j.y && i.x == j.x {
                            i.baseMovement(direction: reverseMove)
                        }
                    }
                case (.hero, .palm):
                    if i.x == j.x && i.y == j.y {
                        i.baseMovement(direction: reverseMove)
                    }
                case (.hero, .antiHero):
                    if i.x == j.x && i.y == j.y {
                        print("GameOver")
                    }
                case (.hero, .heart):
                    if i.x == j.x && i.y == j.y {
                        j.x = Int.random(in: 1...room.x)
                        j.y = Int.random(in: 1...room.y)
                    }
                    
                //other physics
                case (.box, .palm):
                    if i.x == j.x && i.y == j.y {
                        i.baseMovement(direction: reverseMove)
                        if hero.x == i.x && hero.y == i.y {
                            hero.baseMovement(direction: reverseMove)
                        }
                    }
                    
                //antiHero physics
                case (.antiHero, .palm):
                    if i.x == j.x && i.y == j.y {
                        i.baseMovement(direction: reverseMove)
                    }
                case (.antiHero, .box):
                    if i.x == j.x && i.y == j.y {
                        i.baseMovement(direction: reverseMove)
                    }
                case (.antiHero, .heart):
                    if i.x == j.x && i.y == j.y {
                        i.baseMovement(direction: reverseMove)
                    }
                default:
                    break
                }
            }
        }
    }
}
