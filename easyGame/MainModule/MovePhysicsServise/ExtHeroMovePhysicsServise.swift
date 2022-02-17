//
//  ExtMovePhysicsServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

extension MovePhysicsServise {
    func heroMoveUp() {
        hero.baseMovement(direction: .up)
        
        for i in obects {
            switch i.name {
            case .box:
                if hero.x == i.x && hero.y == i.y {
                    i.baseMovement(direction: .up)
                }
                if i.x == 1 || i.y == 1 || i.x == 12 || i.y == 12 {
                    if hero.y == i.y && hero.x == i.x {
                        hero.baseMovement(direction: .down)
                    }
                }
            case .palm:
                if hero.y == i.y && hero.x == i.x {
                    hero.baseMovement(direction: .down)
                }
            case .heart:
                if hero.x == i.x && hero.y == i.y {
                    i.x = Int.random(in: 1...12)
                    i.y = Int.random(in: 1...12)
                }
            case .antiHero:
                if hero.x == i.x && hero.y == i.y {
                    print("GameOver")
                }
            default:
                break
            }
        }
    }
    
    func heroMoveLeft() {
        hero.baseMovement(direction: .left)
        
        for i in obects {
            switch i.name {
            case .box:
                if hero.x == i.x && hero.y == i.y {
                    i.baseMovement(direction: .left)
                }
                if i.x == 1 || i.y == 1 || i.x == 12 || i.y == 12 {
                    if hero.y == i.y && hero.x == i.x {
                        hero.baseMovement(direction: .right)
                    }
                }
            case .palm:
                if hero.y == i.y && hero.x == i.x {
                    hero.baseMovement(direction: .right)
                }
            case .heart:
                if hero.x == i.x && hero.y == i.y {
                    i.x = Int.random(in: 1...12)
                    i.y = Int.random(in: 1...12)
                }
            case .antiHero:
                if hero.x == i.x && hero.y == i.y {
                    print("GameOver")
                }
            default:
                break
            }
        }
    }
    
    func heroMoveRight() {
        hero.baseMovement(direction: .right)
        
        for i in obects {
            switch i.name {
            case .box:
                if hero.x == i.x && hero.y == i.y {
                    i.baseMovement(direction: .right)
                }
                if i.x == 1 || i.y == 1 || i.x == 12 || i.y == 12 {
                    if hero.y == i.y && hero.x == i.x {
                        hero.baseMovement(direction: .left)
                    }
                }
            case .palm:
                if hero.y == i.y && hero.x == i.x {
                    hero.baseMovement(direction: .left)
                }
            case .heart:
                if hero.x == i.x && hero.y == i.y {
                    i.x = Int.random(in: 1...12)
                    i.y = Int.random(in: 1...12)
                }
            case .antiHero:
                if hero.x == i.x && hero.y == i.y {
                    print("GameOver")
                }
            default:
                break
            }
        }
    }
    
    func heroMoveDown() {
        hero.baseMovement(direction: .down)
        
        for i in obects {
            switch i.name {
            case .box:
                if hero.x == i.x && hero.y == i.y {
                    i.baseMovement(direction: .down)
                }
                if i.x == 1 || i.y == 1 || i.x == 12 || i.y == 12 {
                    if hero.y == i.y && hero.x == i.x {
                        hero.baseMovement(direction: .up)
                    }
                }
            case .palm:
                if hero.y == i.y && hero.x == i.x {
                    hero.baseMovement(direction: .up)
                }
            case .heart:
                if hero.x == i.x && hero.y == i.y {
                    i.x = Int.random(in: 1...12)
                    i.y = Int.random(in: 1...12)
                }
            case .antiHero:
                if hero.x == i.x && hero.y == i.y {
                    print("GameOver")
                }
            default:
                break
            }
        }
    }
    
    
}
