//
//  ScoreServise.swift
//  easyGame
//
//  Created by chulep on 05.04.2022.
//

import Foundation
import CoreData

protocol ScoreServiseProtocol {
    var score: Int { get set }
    var hearts: String { get set }
    func addHeart()
    func dropHeart()
    func reset()
    func saveScore()
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
    
    func saveScore() {
        var currentArrayScore = [ScoreData]()
        let coreDataStack = CoreDataStack()
        let context = coreDataStack.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ScoreData", in: context)
        let fetchRequest: NSFetchRequest<ScoreData> = ScoreData.fetchRequest()
        let object = NSManagedObject(entity: entity!, insertInto: context) as! ScoreData
        object.date = "none"
        object.score = "\(score)"
        
        do {
            try currentArrayScore = context.fetch(fetchRequest)
            print(currentArrayScore.count)
            print(currentArrayScore)
            if try context.fetch(fetchRequest).count <= 5 {
                try context.save()
            } else {
                context.delete(currentArrayScore[5])
                try context.save()
            }
        } catch {
            print("save error")
        }
    }
    
}
