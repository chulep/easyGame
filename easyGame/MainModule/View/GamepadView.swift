//
//  GamepadView.swift
//  easyGame
//
//  Created by chulep on 04.02.2022.
//

import UIKit

class GamepadView: UIView {

    let upButton: UIButton = {
       let button = UIButton()
        button.setTitle("U", for: .normal)
        button.tag = 1
        return button
    }()
    
    let leftButton: UIButton = {
       let button = UIButton()
        button.setTitle("L", for: .normal)
        button.tag = 2
        return button
    }()

    let rightButton: UIButton = {
       let button = UIButton()
        button.setTitle("R", for: .normal)
        button.tag = 3
        return button
    }()

    let downButton: UIButton = {
       let button = UIButton()
        button.setTitle("D", for: .normal)
        button.tag = 4
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        
        for button in [upButton, leftButton, rightButton, downButton] {
            button.backgroundColor = .systemGray
            button.translatesAutoresizingMaskIntoConstraints = false
            button.clipsToBounds = true
            self.addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for button in [upButton, leftButton, rightButton, downButton] {
            button.layer.cornerRadius = self.bounds.width / 3 / 2
        }
        
        NSLayoutConstraint.activate([
            upButton.topAnchor.constraint(equalTo: self.topAnchor),
            upButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
            upButton.heightAnchor.constraint(equalTo: upButton.widthAnchor),
            upButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            downButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            downButton.widthAnchor.constraint(equalTo: upButton.widthAnchor),
            downButton.heightAnchor.constraint(equalTo: upButton.widthAnchor),
            downButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            leftButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            leftButton.widthAnchor.constraint(equalTo: upButton.widthAnchor),
            leftButton.heightAnchor.constraint(equalTo: upButton.widthAnchor),
            leftButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            rightButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            rightButton.widthAnchor.constraint(equalTo: upButton.widthAnchor),
            rightButton.heightAnchor.constraint(equalTo: upButton.widthAnchor),
            rightButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
