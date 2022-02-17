//
//  MovePhysicsServise.swift
//  easyGame
//
//  Created by chulep on 17.02.2022.
//

import Foundation

class MovePhysicsServise {
    var obects: [Object]!
    var hero: Object!
    
    init(obects: [Object]) {
        self.obects = obects
        searchHero()
    }
    
    private func searchHero() {
        for i in obects {
            if i.name == .hero {
                hero = i
            }
        }
    }
    
    enum Direction {
        case up
        case left
        case right
        case down
    }
    
    func heroMoveUp() {
        for i in obects {
            switch i.name {
            case .box:
                if hero.x == i.x && hero.y == i.y {
                    i.baseMovement(direction: .up)
                }
                if 
            default:
                break
            }
        }
    }
    
}
