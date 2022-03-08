//
//  CustomButtonAnimate.swift
//  easyGame
//
//  Created by chulep on 08.03.2022.
//
import UIKit

class CustomButtonAnimate: UIButton {
    
    override var isHighlighted: Bool {
            didSet {
                guard let color = backgroundColor else { return }
                layer.removeAllAnimations()
                UIView.animate(withDuration: 0.3, delay: 0.0, options: [.allowUserInteraction], animations: {
                    self.backgroundColor = color.withAlphaComponent(self.isHighlighted ? 0.3 : 1)
            })
        }
    }
}
