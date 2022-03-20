//
//  InfoView.swift
//  easyGame
//
//  Created by chulep on 09.03.2022.
//

import UIKit

class InfoView: UIView {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "easyGame"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    var corpLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    var locationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    var versionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    lazy var closeButon: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColorsHelper.screenAndOtherButton
        button.setTitle("✕", for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColorsHelper.border
        button.addTarget(nil, action: #selector(InfoViewController.tapCloseButton), for: .touchUpInside)
        return button
    }()
    
    lazy private var allElement = [nameLabel, versionLabel, corpLabel, locationLabel, closeButon]

    override init(frame: CGRect) {
        super.init(frame: frame)
        for element in allElement {
            element.translatesAutoresizingMaskIntoConstraints = false
            addSubview(element)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            closeButon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            closeButon.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            closeButon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/10),
            closeButon.heightAnchor.constraint(equalTo: closeButon.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            corpLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 70),
            corpLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: corpLabel.topAnchor, constant: 30),
            locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            versionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),
            versionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        closeButon.layer.cornerRadius = closeButon.bounds.height / 2
        nameLabel.textColor = UIColorsHelper.createGradientColor(bounds: nameLabel.bounds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
