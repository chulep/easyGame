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

        for subView in [gamepadView, gameScreenView] {
            subView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subView)
        }
        //MARK: - Constraints
        if view.bounds.width >= 375 && view.bounds.height >= 812 {
            //IPhone X +
            NSLayoutConstraint.activate([
                gameScreenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
                gameScreenView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                gameScreenView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                gameScreenView.heightAnchor.constraint(equalTo: gameScreenView.widthAnchor),
                
                gamepadView.topAnchor.constraint(equalTo: gameScreenView.bottomAnchor, constant: 50),
                gamepadView.leftAnchor.constraint(equalTo: gameScreenView.leftAnchor),
                gamepadView.rightAnchor.constraint(equalTo: gameScreenView.rightAnchor),
                gamepadView.heightAnchor.constraint(equalTo: gamepadView.widthAnchor)
            ])
        } else {
            //Iphone 8P -
            NSLayoutConstraint.activate([
                gameScreenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                gameScreenView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 29),
                gameScreenView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -29),
                gameScreenView.heightAnchor.constraint(equalTo: gameScreenView.widthAnchor),
                
                gamepadView.topAnchor.constraint(equalTo: gameScreenView.bottomAnchor, constant: 10),
                gamepadView.leftAnchor.constraint(equalTo: gameScreenView.leftAnchor),
                gamepadView.rightAnchor.constraint(equalTo: gameScreenView.rightAnchor),
                gamepadView.heightAnchor.constraint(equalTo: gamepadView.widthAnchor)
            ])
        }
    }
}


