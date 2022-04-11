//
//  GamepadView.swift
//  easyGame
//
//  Created by chulep on 04.02.2022.
//

import UIKit

class GamepadView: UIView {
    
    private let startButton: UIButton = {
        var button = CustomButtonAnimate()
        button.setTitle("START", for: .normal)
        button.backgroundColor = UIColorsHelper.screenAndOtherButton
        button.tag = 0
        return button
    }()
    
    private let upButton: UIButton = {
        let button = CustomButtonAnimate()
        button.setTitle("U", for: .normal)
        button.backgroundColor = UIColorsHelper.upButton
        button.tag = 1
        return button
    }()
    
    private let leftButton: UIButton = {
        let button = CustomButtonAnimate()
        button.setTitle("L", for: .normal)
        button.backgroundColor = UIColorsHelper.leftButton
        button.tag = 2
        return button
    }()
    
    private let rightButton: UIButton = {
        let button = CustomButtonAnimate()
        button.setTitle("R", for: .normal)
        button.backgroundColor = UIColorsHelper.rightButton
        button.tag = 3
        return button
    }()
    
    private let downButton: UIButton = {
        let button = CustomButtonAnimate()
        button.setTitle("D", for: .normal)
        button.backgroundColor = UIColorsHelper.downButton
        button.tag = 4
        return button
    }()
    
    private let infoButton: UIButton = {
        let button = CustomButtonAnimate()
        button.setTitle("?", for: .normal)
        button.backgroundColor = UIColorsHelper.screenAndOtherButton
        button.tag = 5
        return button
    }()
    
    private lazy var allButtons = [startButton, upButton, leftButton, rightButton, downButton, infoButton]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        
        for button in allButtons {
            button.addTarget(nil, action: #selector(MainViewController.tapButton(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.clipsToBounds = true
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColorsHelper.border
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for button in allButtons {
            button.layer.cornerRadius = button.bounds.height / 2
        }
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: topAnchor),
            startButton.rightAnchor.constraint(equalTo: rightAnchor),
            startButton.heightAnchor.constraint(equalTo: upButton.heightAnchor, multiplier: 1/2),
            startButton.widthAnchor.constraint(equalTo: upButton.widthAnchor, multiplier: 3/4),
            
            upButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            upButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 9/30),
            upButton.heightAnchor.constraint(equalTo: upButton.widthAnchor),
            upButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            leftButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            leftButton.widthAnchor.constraint(equalTo: upButton.widthAnchor),
            leftButton.heightAnchor.constraint(equalTo: upButton.widthAnchor),
            leftButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            rightButton.rightAnchor.constraint(equalTo: rightAnchor,constant: -10),
            rightButton.widthAnchor.constraint(equalTo: upButton.widthAnchor),
            rightButton.heightAnchor.constraint(equalTo: upButton.widthAnchor),
            rightButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            downButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            downButton.widthAnchor.constraint(equalTo: upButton.widthAnchor),
            downButton.heightAnchor.constraint(equalTo: upButton.widthAnchor),
            downButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            infoButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            infoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            infoButton.heightAnchor.constraint(equalTo: upButton.heightAnchor, multiplier: 2/5),
            infoButton.widthAnchor.constraint(equalTo: infoButton.heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
