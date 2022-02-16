//
//  GamepadView.swift
//  easyGame
//
//  Created by chulep on 04.02.2022.
//

import UIKit

class GamepadView: UIView {
    
    private let startButton: UIButton = {
        var button = UIButton()
        button.setTitle("START", for: .normal)
        button.backgroundColor = .systemGray
        button.tag = 0
        return button
    }()

    private let upButton: UIButton = {
       let button = UIButton()
        button.setTitle("U", for: .normal)
        button.tag = 1
        return button
    }()
    
    private let leftButton: UIButton = {
       let button = UIButton()
        button.setTitle("L", for: .normal)
        button.tag = 2
        return button
    }()

    private let rightButton: UIButton = {
       let button = UIButton()
        button.setTitle("R", for: .normal)
        button.tag = 3
        return button
    }()

    private let downButton: UIButton = {
       let button = UIButton()
        button.setTitle("D", for: .normal)
        button.tag = 4
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        
        for button in [startButton, upButton, leftButton, rightButton, downButton] {
            button.backgroundColor = .systemGray
            button.addTarget(nil, action: #selector(MainViewController.tapButton(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.clipsToBounds = true
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for button in [startButton, upButton, leftButton, rightButton, downButton] {
            if button.tag == 0 {
                button.layer.cornerRadius = startButton.bounds.height / 2
            } else {
                button.layer.cornerRadius = button.bounds.height / 2
            }
        }
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: topAnchor),
            startButton.rightAnchor.constraint(equalTo: rightAnchor),
            startButton.heightAnchor.constraint(equalTo: upButton.heightAnchor, multiplier: 1/3),
            startButton.widthAnchor.constraint(equalTo: upButton.widthAnchor, multiplier: 2/3),
            
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
            downButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
