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
    
    func reverseMove(direction: Object.Direction) -> Object.Direction {
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
    
}
