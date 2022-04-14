//
//  InfoModel.swift
//  easyGame
//
//  Created by chulep on 08.03.2022.
//

import Foundation
import CoreData

struct InfoModel {
    
    var version = "0.1"
    var creater = "Chulep Technologies"
    var location = "Russia, Saint-Petersburg"
    var score = [ScoreData]()
    
    mutating func loadScore() {
        let coreDataStack = CoreDataStack()
        let context = coreDataStack.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ScoreData> = ScoreData.fetchRequest()
        do {
            try self.score = context.fetch(fetchRequest)
        } catch {
            print("load error")
        }
        score.sort { a, b in
            a.score! > b.score!
        }
    }
    
}
