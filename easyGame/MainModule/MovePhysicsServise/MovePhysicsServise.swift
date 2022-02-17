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
     var antiHero: Object!
    
    init(obects: [Object]) {
        self.obects = obects
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
    
    enum Direction {
        case up
        case left
        case right
        case down
    }
    
    func heroMovePhysics(direction: Direction) {
        switch direction {
        case .up:
            heroMoveUp()
        case .left:
            heroMoveLeft()
        case .right:
            heroMoveRight()
        case .down:
            heroMoveDown()
        }
    }
    
    func antiHeroMovePhysics(direction: Direction) {
        switch direction {
        case .up:
            antiHeroMoveUp()
        case .left:
            antiHeroMoveLeft()
        case .right:
            antiHeroMoveRight()
        case .down:
            antiHeroMoveDown()
        }
    }
}
