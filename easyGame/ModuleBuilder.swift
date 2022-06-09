//
//  ModuleBuilder.swift
//  easyGame
//
//  Created by chulep on 01.02.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    static func createMainVC() -> UIViewController
    static func createInfoVC(currentButtonSize: CGSize) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    static func createMainVC() -> UIViewController {
        let objects = PersonageBuilder.create.amount(palm: 3, box: 3)
        let scoreServise = ScoreServise()
        let physicServise = MovePhysicsServise(gameObjects: objects, room: PersonageBuilder.create.room, scoreServise: scoreServise)
        let dataServise = GameScreenDataServise(gameObjects: objects, room: PersonageBuilder.create.room)
        let view = MainViewController()
        let presenter = MainPresenter(view: view, movePhysicsServise: physicServise, gameScreenDataServise: dataServise, scoreServise: scoreServise)
        view.presenter = presenter
        return view
    }
    
    static func createInfoVC(currentButtonSize: CGSize) -> UIViewController {
        let view = InfoViewController(currentButtonSize: currentButtonSize)
        let data = InfoModel()
        let presenter = InfoPresenter(view: view, infoData: data)
        view.presenter = presenter
        view.modalPresentationStyle = .popover
        return view
    }
    
}
