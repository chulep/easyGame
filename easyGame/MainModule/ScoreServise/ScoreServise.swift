//
//  ScoreServise.swift
//  easyGame
//
//  Created by chulep on 05.04.2022.
//

import Foundation
import CoreData
import AudioToolbox

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
        AudioServicesPlaySystemSound(SystemSoundID(4095))
    }
    
    func addHeart() {
        hearts += "♡ "
    }
    
    func reset() {
        score = 0
        hearts = "♡ "
    }
    
    private func currentDate() -> String {
        let format = DateFormatter()
        format.dateFormat = "dd.MM.YY HH:mm"
            format.timeZone = .current
        let data = format.string(from: Date.init())
        return data
    }
    
    //MARK: - Save SCoreData
    func saveScore() {
        var currentArrayScore = [ScoreData]()
        let coreDataStack = CoreDataStack()
        let context = coreDataStack.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ScoreData", in: context)
        let fetchRequest: NSFetchRequest<ScoreData> = ScoreData.fetchRequest()
        let object = NSManagedObject(entity: entity!, insertInto: context) as! ScoreData
        object.date = currentDate()
        object.score = Int32(score)
        
        //export
        do {
            try currentArrayScore = context.fetch(fetchRequest)
            print("export success")
        } catch {
            print("export error")
        }
        
        //save
        for i in currentArrayScore {
            if i.score <= score {
                do {
                    try context.save()
                    try currentArrayScore = context.fetch(fetchRequest)
                    print("save success")
                } catch {
                    print("save error")
                }
            }
            break
        }
        
        //delete excess
        if currentArrayScore.count >= 6 {   //тут мешает <fult> из кор даты, поэтому 6
            do {
                currentArrayScore.sort { s1, s2 in
                    s1.score > s2.score
                }
                context.delete(currentArrayScore.last!)
                try context.save()
                print("delete success")
            } catch {
                print("delete error")
            }
        }
    }
    
}
