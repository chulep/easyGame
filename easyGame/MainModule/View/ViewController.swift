//
//  ViewController.swift
//  easyGame
//
//  Created by chulep on 28.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenter!
    private var gameScreenLabel = UILabel()
    private var startButton = UIButton()
    private var gamepadView = GamepadView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        setAddTarget()
        presenter.createDataFromGameScreen()
    }
}

//MARK: - ViewProtocol
extension MainViewController: MainViewProtocol {
    
    func updateGameScreen() {
        gameScreenLabel.text = presenter.gameScreenData
    }
}

//MARK: - Create UI
extension MainViewController {

    private func createUI() {
        
        view.backgroundColor = .white
        
        gameScreenLabel.backgroundColor = .gray
        gameScreenLabel.layer.cornerRadius = (view.bounds.width - 40) / 14
        gameScreenLabel.numberOfLines = 17
        gameScreenLabel.textAlignment = .center

        startButton.setTitle("START", for: .normal)
        startButton.backgroundColor = .systemGray
        startButton.layer.cornerRadius = (view.bounds.width - 60) / 4 / 2 / 2

        for subView in [gameScreenLabel, startButton, gamepadView] {
            subView.translatesAutoresizingMaskIntoConstraints = false
            subView.clipsToBounds = true
            view.addSubview(subView)
        }

        //MARK: - Layout Constraint
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        NSLayoutConstraint.activate([

            gameScreenLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight + 10),
            gameScreenLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            gameScreenLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            gameScreenLabel.heightAnchor.constraint(equalTo: gameScreenLabel.widthAnchor),

            startButton.topAnchor.constraint(equalTo: gameScreenLabel.bottomAnchor, constant: 10),
            startButton.rightAnchor.constraint(equalTo: gameScreenLabel.rightAnchor),
            startButton.widthAnchor.constraint(equalTo: gameScreenLabel.widthAnchor, multiplier: 1/4),
            startButton.heightAnchor.constraint(equalTo: startButton.widthAnchor, multiplier: 1/2),

            gamepadView.topAnchor.constraint(equalTo: startButton.bottomAnchor),
            gamepadView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            gamepadView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            gamepadView.heightAnchor.constraint(equalTo: gamepadView.widthAnchor)
        ])
    }

    //MARK: - Tap Btton Func
    private func setAddTarget() {
        startButton.tag = 0
        startButton.addTarget(nil, action: #selector(tapButton(_:)), for: .touchUpInside)
        gamepadView.upButton.addTarget(nil, action: #selector(tapButton(_:)), for: .touchUpInside)
        gamepadView.leftButton.addTarget(nil, action: #selector(tapButton(_:)), for: .touchUpInside)
        gamepadView.rightButton.addTarget(nil, action: #selector(tapButton(_:)), for: .touchUpInside)
        gamepadView.downButton.addTarget(nil, action: #selector(tapButton(_:)), for: .touchUpInside)
    }
    
    @objc func tapButton(_ button: UIButton) {
        switch button.tag {
        case 0:
            print("start")
        case 1:
            presenter.moveUp()
        case 2:
            presenter.moveLeft()
        case 3:
            presenter.moveRight()
        case 4:
            presenter.moveDown()
        default:
            break
        }
    }
}


