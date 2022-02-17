//
//  ExtAntiHeroMovePhysicsServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

extension MovePhysicsServise {
    func antiHeroMoveUp() {
        antiHero.baseMovement(direction: .up)
        for i in obects {
            switch i.name {
            case .box:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .down)
                }
            case .palm:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .down)
                }
            case .heart:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .down)
                }
            case .hero:
                if hero.x == i.x && hero.y == i.y {
                    print("GameOver")
                }
            default:
                break
            }
        }
    }
    
    func antiHeroMoveLeft() {
        antiHero.baseMovement(direction: .left)
        for i in obects {
            switch i.name {
            case .box:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .right)
                }
            case .palm:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .right)
                }
            case .heart:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .right)
                }
            case .hero:
                if hero.x == i.x && hero.y == i.y {
                    print("GameOver")
                }
            default:
                break
            }
        }
    }
    
    func antiHeroMoveRight() {
        antiHero.baseMovement(direction: .right)
        for i in obects {
            switch i.name {
            case .box:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .left)
                }
            case .palm:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .left)
                }
            case .heart:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .left)
                }
            case .hero:
                if hero.x == i.x && hero.y == i.y {
                    print("GameOver")
                }
            default:
                break
            }
        }
    }
    
    func antiHeroMoveDown() {
        antiHero.baseMovement(direction: .down)
        for i in obects {
            switch i.name {
            case .box:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .up)
                }
            case .palm:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .up)
                }
            case .heart:
                if antiHero.y == i.y && antiHero.x == i.x {
                    antiHero.baseMovement(direction: .up)
                }
            case .hero:
                if hero.x == i.x && hero.y == i.y {
                    print("GameOver")
                }
            default:
                break
            }
        }
    }
}
