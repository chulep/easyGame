//
//  ObjectModel.swift
//  easyGame
//
//  Created by chulep on 29.01.2022.
//

import Foundation

class Object {
    
    enum Name: String {
        case human = "✦"
        case box = "⊠"
        case heart = "♡"
        case palm = "✽"
        case dino = "X"
    }
    
    enum DirectionOfTravel {
        case left
        case right
        case up
        case down
    }
    
    func movement (direction: DirectionOfTravel) {
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
            if x < 1 || x >= 14 {
                x = oldValue
            }
        }
    }
    
    var y: Int {
        didSet {
            if y < 1 || y >= 10 {
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
