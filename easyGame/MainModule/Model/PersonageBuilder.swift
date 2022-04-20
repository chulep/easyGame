//
//  PersonageBuilder.swift
//  easyGame
//
//  Created by chulep on 19.02.2022.
//

import Foundation

protocol PersonageBuilderProtocol {
    func amount(palm: Int, box: Int) -> [Object]
}

struct PersonageBuilder: PersonageBuilderProtocol {
    
    static let create = PersonageBuilder()
    let room = (x: 16, y: 12) //size screen hardcode
    
    func amount(palm: Int, box: Int) -> [Object] {
        let hero = Object(name: .hero, room: room, x: Int.random(in: 1...room.x), y: Int.random(in: 1...room.y))
        let antiHero = Object(name: .antiHero, room: room, x: Int.random(in: 1...room.x), y: Int.random(in: 1...room.y))
        let heart = Object(name: .heart, room: room, x: Int.random(in: 1...room.x), y: Int.random(in: 1...room.y))
        var all = [hero, antiHero, heart]
        
        for number in 1...palm {
            let palm = Object(name: .palm, index: number, room: room, x: Int.random(in: 1...room.x), y: Int.random(in: 1...room.y))
            all.append(palm)
        }
        
        for number in 1...box {
            let box = Object(name: .box, index: number + palm, room: room, x: Int.random(in: 1...room.x), y: Int.random(in: 1...room.y))
            all.append(box)
        }
        return all
    }
    
}
