//
//  MainUIbuilder.swift
//  easyGame
//
//  Created by Pavel Schulepov on 21.04.2022.
//

import UIKit

class MainUIBuilder {
    
    static func createButton(title: String, tag: Int, color: UIColor) -> UIButton {
        let button = CustomButtonAnimate()
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.tag = tag
        return button
    }
    
    static func createScoreHeartLabel(textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = textAlignment
        return label
    }
    
    static func createScreenLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = UIColorsHelper.screenAndOtherButton
        label.numberOfLines = 17
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }
    
    static func createBrandLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "easyGame"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        //при динамическом размере текста центруется только так
        label.baselineAdjustment = UIBaselineAdjustment.alignCenters
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
}
