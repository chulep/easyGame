//
//  ExtMovePhysicsServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

extension MovePhysicsServise {
    
    func universalMove(direction: Object.Direction) {
        let reverseMove = reverseMove(direction: direction)
        hero.baseMovement(direction: direction)
        
        for i in obects {
            for j in obects {
                switch (i.name, j.name) {
                
                case (.hero, .box):
                    if i.x == j.x && i.y == j.y {
                        j.baseMovement(direction: direction)
                    }
                    if j.x == 1 || j.y == 1 || j.x == 12 || j.y == 12 {
                        if i.y == j.y && i.x == j.x {
                            i.baseMovement(direction: reverseMove)
                        }
                    }
                    
                case (.box, .palm):
                    if i.x == j.x && i.y == j.y {
                        i.baseMovement(direction: reverseMove)
                        if hero.x == i.x && hero.y == i.y {
                            hero.baseMovement(direction: reverseMove)
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
                    j.x = Int.random(in: 1...12)
                    j.y = Int.random(in: 1...12)
                }
                    
                default:
                    break
                }
            }
        }
    }
}

