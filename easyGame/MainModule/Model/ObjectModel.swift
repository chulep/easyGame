//
//  ObjectModel.swift
//  easyGame
//
//  Created by chulep on 29.01.2022.
//

import Foundation

class Object {
    
    let name: Name
    var index: Int
    private let room: (x: Int, y: Int)
    
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
    
    var x: Int {
        didSet {
            if x < 1 || x > room.x {
                x = oldValue
            }
        }
    }
    
    var y: Int {
        didSet {
            if y < 1 || y > room.y {
                y = oldValue
            }
        }
    }
    
    init(name: Name, index: Int, room: (x: Int, y: Int), x: Int, y: Int) {
        self.name = name
        self.x = x
        self.y = y
        self.index = index
        self.room = room
    }
    
    convenience init(name: Name, room: (x: Int, y: Int), x: Int, y: Int) {
        self.init(name: name, index: 0, room: room, x: x, y: y)
    }
}
