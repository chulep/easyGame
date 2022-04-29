//
//  LaunchPresenter.swift
//  easyGame
//
//  Created by Pavel Schulepov on 25.04.2022.
//

import UIKit

protocol LaunchScreenPresenterProtocol: AnyObject {
    func present(windowScene: UIWindowScene)
    func dismiss(completion: (() -> Void)?)
}

final class LaunchScreenPresenter: LaunchScreenPresenterProtocol {
    
    let window = UIWindow()
    let launchScreenViewController = LaunchScreenViewController()
    
    func present(windowScene: UIWindowScene) {
        window.windowScene = windowScene
        window.windowLevel = .normal + 1
        window.rootViewController = launchScreenViewController
        window.isHidden = false
    }
    
    func dismiss(completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.5) {
            self.window.center.y = self.window.center.y + self.window.bounds.height
        } completion: { _ in
            completion?()
        }
    }
    
}
