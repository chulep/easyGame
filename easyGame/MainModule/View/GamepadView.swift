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
        button.backgroundColor = ColorsHelper.screenAndStartButton
        button.tag = 0
        return button
    }()

    private let upButton: UIButton = {
       let button = UIButton()
        button.setTitle("U", for: .normal)
        button.backgroundColor = ColorsHelper.upButton
        button.tag = 1
        return button
    }()
    
    private let leftButton: UIButton = {
       let button = UIButton()
        button.setTitle("L", for: .normal)
        button.backgroundColor = ColorsHelper.leftButton
        button.tag = 2
        return button
    }()

    private let rightButton: UIButton = {
       let button = UIButton()
        button.setTitle("R", for: .normal)
        button.backgroundColor = ColorsHelper.rightButton
        button.tag = 3
        return button
    }()

    private let downButton: UIButton = {
       let button = UIButton()
        button.setTitle("D", for: .normal)
        button.backgroundColor = ColorsHelper.downButton
        button.tag = 4
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "easyGame"
        label.textColor = .none
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //разобраться какого черта не пашет теперь
        label.backgroundColor = .clear
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        addSubview(nameLabel)
        
        for button in [startButton, upButton, leftButton, rightButton, downButton] {
            button.addTarget(nil, action: #selector(MainViewController.tapButton(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.clipsToBounds = true
            button.layer.borderWidth = 3
            button.layer.borderColor = ColorsHelper.border
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //gradientColor
        nameLabel.textColor = ColorsHelper.createGradientColor(bounds: nameLabel.frame)
        
        for button in [startButton, upButton, leftButton, rightButton, downButton] {
            if button.tag == 0 {
                button.layer.cornerRadius = startButton.bounds.height / 2
            } else {
                button.layer.cornerRadius = button.bounds.height / 2
            }
        }
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: topAnchor),
            startButton.rightAnchor.constraint(equalTo: rightAnchor),
            startButton.heightAnchor.constraint(equalTo: upButton.heightAnchor, multiplier: 1/2),
            startButton.widthAnchor.constraint(equalTo: upButton.widthAnchor, multiplier: 3/4),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor),
            nameLabel.heightAnchor.constraint(equalTo: upButton.heightAnchor, multiplier: 2/2),
            nameLabel.widthAnchor.constraint(equalTo: upButton.widthAnchor, multiplier: 6/4),
            
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
