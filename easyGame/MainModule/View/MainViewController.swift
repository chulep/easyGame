//
//  ViewController.swift
//  easyGame
//
//  Created by chulep on 28.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenter!
    private var gameScreenView = GameScreenView()
    private var gamepadView = GamepadView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        presenter.createDataFromGameScreen()
    }
}

//MARK: - ViewProtocol
extension MainViewController: MainViewProtocol {
    
    func updateGameScreen() {
        gameScreenView.screen.text = presenter.gameScreenData
    }
}

//MARK: - Create UI
extension MainViewController {

    private func createUI() {
        view.backgroundColor = .white

        for subView in [gamepadView, gameScreenView] {
            subView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subView)
        }

        //MARK: - Constraints
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        NSLayoutConstraint.activate([
            
            gameScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight + 10),
            gameScreenView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            gameScreenView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            gameScreenView.heightAnchor.constraint(equalTo: gameScreenView.widthAnchor),
            
            gamepadView.topAnchor.constraint(equalTo: gameScreenView.bottomAnchor, constant: 30),
            gamepadView.leftAnchor.constraint(equalTo: gameScreenView.leftAnchor),
            gamepadView.rightAnchor.constraint(equalTo: gameScreenView.rightAnchor),
            gamepadView.heightAnchor.constraint(equalTo: gamepadView.widthAnchor)
        ])
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


