//
//  ViewController.swift
//  easyGame
//
//  Created by chulep on 28.01.2022.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func updateGameScreen()
}

class MainViewController: UIViewController {
    
    var presenter: MainPresenter!
    private var gameScreenView = GameScreenView()
    private var gamepadView = GamepadView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        presenter.createDataFromGameScreen()
    }
    
    //MARK: - Tap Btton Func
    @objc func tapButton(_ button: UIButton) {
        switch button.tag {
        case 0:
            presenter.startButtonTap()
        case 1:
            presenter.moveUp(.hero)
        case 2:
            presenter.moveLeft(.hero)
        case 3:
            presenter.moveRight(.hero)
        case 4:
            presenter.moveDown(.hero)
        default:
            break
        }
    }
}

//MARK: - ViewProtocol
extension MainViewController: MainViewProtocol {
    func updateGameScreen() {
        gameScreenView.screenLabel.text = presenter.gameScreenData
        gameScreenView.heatsLabel.text = presenter.heartsGameScreen
    }
}



//MARK: - Create UI
extension MainViewController {
    private func createUI() {
        view.backgroundColor = UIColorsHelper.background

        for subview in [gamepadView, gameScreenView] {
            subview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subview)
        }
        //MARK: - Constraints
        let safeArea = UIApplication.shared.windows.first!.safeAreaInsets.top
        let sqareSize = view.bounds.height <= 780 ? view.bounds.height / 2 - safeArea - 3 : view.bounds.width - view.bounds.width  / 20
    
        NSLayoutConstraint.activate([
            gameScreenView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -3),
            gameScreenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameScreenView.widthAnchor.constraint(equalToConstant: sqareSize),
            gameScreenView.heightAnchor.constraint(equalTo: gameScreenView.widthAnchor),
            
            gamepadView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 3),
            gamepadView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gamepadView.widthAnchor.constraint(equalToConstant: sqareSize),
            gamepadView.heightAnchor.constraint(equalTo: gamepadView.widthAnchor),
        ])
    }
}
