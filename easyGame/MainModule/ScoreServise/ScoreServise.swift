//
//  ScoreServise.swift
//  easyGame
//
//  Created by chulep on 05.04.2022.
//

import Foundation

protocol ScoreServiseProtocol {
    var score: Int { get set }
    var hearts: String { get set }
    func addHeart()
    func dropHeart()
    func reset()
}

class ScoreServise: ScoreServiseProtocol {
    var score = 0
    var hearts = "♡ " {
        didSet {
            if hearts == "♡ ♡ ♡ ♡ " {
                hearts = oldValue
                score += 1
            }
        }
    }
    
    func dropHeart() {
        let dropHeart = hearts.dropLast(2)
        hearts = String(dropHeart)
    }
    
    func addHeart() {
        hearts += "♡ "
    }
    
    func reset() {
        score = 0
        hearts = "♡ "
    }
}
