//
//  InfoUIBuilder.swift
//  easyGame
//
//  Created by Pavel Schulepov on 21.04.2022.
//

import UIKit

class InfoUIBuilder {
    
    static func createLabel(textSize: Int) -> UILabel {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(textSize))
        label.textColor = .black
        return label
    }
    
    static func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isUserInteractionEnabled = false
        return tableView
    }
    
    static func createButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColorsHelper.screenAndOtherButton
        button.setTitle("✕", for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColorsHelper.border
        button.addTarget(nil, action: #selector(InfoViewController.closeInfoView), for: .touchUpInside)
        return button
    }
    
}
