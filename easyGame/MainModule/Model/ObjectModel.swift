//
//  ObjectModel.swift
//  easyGame
//
//  Created by chulep on 29.01.2022.
//

import Foundation

class Object {
    
    enum Name: String {
        case hero = "✦"
        case box = "⊠"
        case heart = "♡"
        case palm = "✽"
        case antiHero = "X"
    }
    
    enum Direction {
        case left
        case right
        case up
        case down
    }
    
    func baseMovement (direction: Direction) {
        switch direction {
        case .right:
            self.x += 1
        case .left:
            self.x -= 1
        case .up:
            self.y -= 1
        case .down:
            self.y += 1
        }
    }
    
    let name: Name
    
    var x: Int {
        didSet {
            if x < 1 || x > 16 {
                x = oldValue
            }
        }
    }
    
    var y: Int {
        didSet {
            if y < 1 || y > 12 {
                y = oldValue
            }
        }
    }
    
    init(name: Name, x: Int, y: Int) {
        self.name = name
        self.x = x
        self.y = y
    }
}

class Palm: Object {
    
}
