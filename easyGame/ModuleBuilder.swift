//
//  ModuleBuilder.swift
//  easyGame
//
//  Created by chulep on 01.02.2022.
//

import UIKit

protocol BuilderProtocol {
    static func createMainVC() -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    static func createMainVC() -> UIViewController {
        let hero = Object(name: .hero, x: 1, y: 1)
        let antiHero = Object(name: .antiHero, x: Int.random(in: 1...12), y: Int.random(in: 1...12))
        let palm = Palm(name: .palm, x: Int.random(in: 1...12), y: Int.random(in: 1...12))
        let box = Object(name: .box, x: Int.random(in: 1...12), y: Int.random(in: 1...12))
        let heart = Object(name: .heart, x: Int.random(in: 1...12), y: Int.random(in: 1...12))
        let servise = MovePhysicsServise(obects: [hero, antiHero, box, palm, heart])
        let view = MainViewController()
        let presenter = MainPresenter(view: view, movePhysicsServise: servise)
        view.presenter = presenter
        return view
    }
}
