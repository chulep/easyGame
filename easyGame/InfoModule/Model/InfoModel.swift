//
//  InfoModel.swift
//  easyGame
//
//  Created by chulep on 08.03.2022.
//

import Foundation
import CoreData

struct InfoModel {
    
    let name = "easyGame"
    let creater = "Chulep Technologies"
    let location = "Russia, Saint-Petersburg"
    let scoreLabel = "Top scores:"
    let version = "0.1"
    var score = [ScoreData]()
    
    mutating func loadScore() {
        let coreDataStack = CoreDataStack()
        let context = coreDataStack.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ScoreData> = ScoreData.fetchRequest()
        do {
            try self.score = context.fetch(fetchRequest)
        } catch {
            print("export info error")
        }
        score.sort { a, b in
            a.score > b.score
        }
    }
    
}
