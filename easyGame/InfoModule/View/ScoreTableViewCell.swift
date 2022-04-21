//
//  ScoreTableViewCell.swift
//  easyGame
//
//  Created by Pavel Schulepov on 16.04.2022.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
    
    static let identifire = "scoreCell"
    
    var scoreLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    var dateLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        for label in [scoreLabel, dateLabel] {
            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)
        }
    }
    
    //MARK: - UI
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            scoreLabel.topAnchor.constraint(equalTo: topAnchor),
            scoreLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            scoreLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
