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
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
