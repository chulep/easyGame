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
        label.backgroundColor = .gray
        label.numberOfLines = 17
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(screen)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        screen.frame = bounds
        screen.layer.cornerRadius = screen.bounds.width / 14
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
