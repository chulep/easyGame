//
//  GameScreenView.swift
//  easyGame
//
//  Created by chulep on 16.02.2022.
//

import UIKit

class GameScreenView: UIView {
    
    let screenLabel = MainUIBuilder.createScreenLabel()
    let heatsLabel = MainUIBuilder.createScoreHeartLabel(textAlignment: .left)
    let scoreLabel = MainUIBuilder.createScoreHeartLabel(textAlignment: .right)
    private let brandLabel = MainUIBuilder.createBrandLabel()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        for view in [screenLabel, heatsLabel, brandLabel, scoreLabel] {
            addSubview(view)
        }
    }
    
    //MARK: - UI
    override func layoutSubviews() {
        super.layoutSubviews()
        //screen
        screenLabel.frame = bounds
        screenLabel.layer.borderWidth = 3
        screenLabel.layer.borderColor = UIColorsHelper.border
        screenLabel.layer.cornerRadius = screenLabel.bounds.width / 14
        //паопробовал вертску фреймами
        //hearts for screen
        heatsLabel.frame = CGRect(x: screenLabel.bounds.width / 14,
                                  y: screenLabel.bounds.height - heatsLabel.bounds.height,
                                  width: screenLabel.bounds.width / 2 - screenLabel.bounds.width / 14,
                                  height: screenLabel.bounds.height / 6)
        //score
        scoreLabel.frame = CGRect(x: screenLabel.bounds.width / 2,
                                  y: screenLabel.bounds.height - scoreLabel.bounds.height,
                                  width: screenLabel.bounds.width / 2 - screenLabel.bounds.width / 14,
                                  height: screenLabel.bounds.height / 6)
        //brand
        brandLabel.frame = CGRect(x: screenLabel.bounds.width / 14,
                                  y: screenLabel.bounds.height,
                                  width: screenLabel.bounds.width / 4,
                                  height: screenLabel.bounds.width / 10)
        brandLabel.textColor = UIColorsHelper.createGradientColor(bounds: brandLabel.bounds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
