//
//  LaunchPresenter.swift
//  easyGame
//
//  Created by Pavel Schulepov on 25.04.2022.
//

import Foundation
import UIKit

protocol LaunchScreenPresenterProtocol {
    func present()
    func dissmiss(completion: (() -> Void)?)
}

final class LaunchScreenPresenter: LaunchScreenPresenterProtocol {
    
    private lazy var foregroundLaunchWindow: UIWindow = {
        let launchWindow = UIWindow()
        let launchVC = LaunchScreenViewController()
        
        launchWindow.windowLevel = .normal + 1
        launchWindow.rootViewController = launchVC
        return launchWindow
    }()
    
    func present() {
        foregroundLaunchWindow.isHidden = false
    }
    
    func dissmiss(completion: (() -> Void)?) {
        
    }
    
    
}
