//
//  LaunchScreenViewController.swift
//  easyGame
//
//  Created by Pavel Schulepov on 25.04.2022.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "easyGame"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.textColor = UIColorsHelper.createGradientColor(bounds: label.bounds)
    }
    
    private func createUI() {
        view.backgroundColor = UIColorsHelper.background
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
