//
//  GameScreenDataServise.swift
//  easyGame
//
//  Created by chulep on 19.02.2022.
//

import Foundation

protocol GameScreenDataServiseProtocol {
    init(objects: [Object], room: (x: Int, y: Int))
    func createData() -> String
    func refresh()
    var objects: [Object] {get set}
}

struct GameScreenDataServise: GameScreenDataServiseProtocol {
    
    var objects: [Object]
    private var room: (x: Int, y: Int)
    
    init(objects: [Object], room: (x: Int, y: Int)) {
        self.objects = objects
        self.room = room
    }
    
    func refresh() {
        for i in objects {
            i.x = Int.random(in: 1...PersonageBuilder.create.room.x)
            i.y = Int.random(in: 1...PersonageBuilder.create.room.y)
        }
    }
    
    func createData() -> String {
        var text = ""
        
        for i in 0...room.y - 1 {
            counter: for j in 0...room.x - 1 {
                for o in objects {
                    switch (o.name, o.x, o.y) {
                    case (.hero, let x, let y) where x == j + 1 && y == i + 1:
                        //print("\(o.name.rawValue)", terminator: " ")
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    case (.box, let x, let y) where x == j + 1 && y == i + 1:
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    case (.heart, let x, let y) where x == j + 1 && y == i + 1:
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    case (.palm, let x, let y) where x == j + 1 && y == i + 1:
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    case (.antiHero, let x, let y) where x == j + 1 && y == i + 1:
                        text.append("\(o.name.rawValue) ")
                        continue counter
                    default:
                        break
                    }
                }
                text.append("⊹ ")
            }
            text.append("\n")
        }
        return text
    }
    
}
