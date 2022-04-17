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
        let scoreServise = ScoreServise()
        let physicServise = MovePhysicsServise(obects: objects, room: PersonageBuilder.create.room, scoreServise: scoreServise)
        let dataServise = GameScreenDataServise(objects: objects, room: PersonageBuilder.create.room)
        let view = MainViewController()
        let presenter = MainPresenter(view: view, movePhysicsServise: physicServise, gameScreenDataServise: dataServise, scoreServise: scoreServise)
        let timer = TimerServise(presenter: presenter)
        presenter.timerServise = timer
        view.presenter = presenter
        return view
    }
    
    static func createInfoVC(currentButtonSize: CGSize) -> UIViewController {
        let info = InfoModel()
        let VC = InfoViewController(currentButtonSize: currentButtonSize)
        let presenter = InfoPresenter(view: VC, info: info)
        VC.presenter = presenter
        VC.modalPresentationStyle = .popover
        return VC
    }
    
}
