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
    
    lazy private var allLabels = [nameLabel, versionLabel, corpLabel, locationLabel]

    override init(frame: CGRect) {
        super.init(frame: frame)
        for label in allLabels {
            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            corpLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 70),
            corpLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: corpLabel.topAnchor, constant: 30),
            locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            versionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),
            versionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        nameLabel.textColor = UIColorsHelper.createGradientColor(bounds: nameLabel.bounds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
