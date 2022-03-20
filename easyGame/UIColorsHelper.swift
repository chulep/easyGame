//
//  UIColorsHelper.swift
//  easyGame
//
//  Created by chulep on 20.02.2022.
//

import UIKit

struct UIColorsHelper {
    static let screenAndOtherButton = UIColor(displayP3Red: 145/255, green: 145/255, blue: 145/255, alpha: 1)
    static let background = UIColor(displayP3Red: 245/255, green: 238/255, blue: 238/255, alpha: 1)
    static let upButton = UIColor(displayP3Red: 42/255, green: 31/255, blue: 208/255, alpha: 1)
    static let leftButton = UIColor(displayP3Red: 0, green: 151/255, blue: 108/255, alpha: 1)
    static let rightButton = UIColor(displayP3Red: 255/255, green: 38/255, blue: 76/255, alpha: 1)
    static let downButton = UIColor(displayP3Red: 255/255, green: 190/255, blue: 0, alpha: 1)
    static let border = CGColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
    
    static func createGradientColor(bounds: CGRect) -> UIColor {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColorsHelper.upButton.cgColor, UIColorsHelper.leftButton.cgColor, UIColorsHelper.rightButton.cgColor, UIColorsHelper.downButton.cgColor]
        gradient.frame = bounds
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        UIGraphicsBeginImageContext(gradient.bounds.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIColor(patternImage: image!)
    }
}
