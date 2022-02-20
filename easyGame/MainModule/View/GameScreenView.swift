//
//  GameScreenView.swift
//  easyGame
//
//  Created by chulep on 16.02.2022.
//

import UIKit

class GameScreenView: UIView {
    
    let screen: UILabel = {
        var label = UILabel()
        label.backgroundColor = ColorsHelper.screenAndStartButton
        label.numberOfLines = 17
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    let heats: UILabel = {
        var label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(screen)
        addSubview(heats)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        screen.layer.borderWidth = 3
        screen.layer.borderColor = ColorsHelper.border
        screen.frame = bounds
        screen.layer.cornerRadius = screen.bounds.width / 14
        heats.frame = CGRect(x: 20,
                             y: screen.bounds.height - heats.bounds.height,
                             width: screen.bounds.width / 2,
                             height: screen.bounds.height / 6)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
