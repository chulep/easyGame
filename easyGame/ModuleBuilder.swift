//
//  ModuleBuilder.swift
//  easyGame
//
//  Created by chulep on 01.02.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    static func createMainVC() -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    static func createMainVC() -> UIViewController {
        let objects = PersonageBuilder.create.amount(palm: 3, box: 3)
        let physicServise = MovePhysicsServise(obects: objects, room: PersonageBuilder.create.room)
        let dataServise = GameScreenDataServise(objects: objects, room: PersonageBuilder.create.room)
        let view = MainViewController()
        let presenter = MainPresenter(view: view, movePhysicsServise: physicServise, gameScreenDataServise: dataServise)
        view.presenter = presenter
        return view
    }
}
