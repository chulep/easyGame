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
    
    private var openView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColorsHelper.background
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        startAnimate()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.textColor = UIColorsHelper.createGradientColor(bounds: label.bounds)
    }
    
    //MARK: - UI
    private func createUI() {
        view.backgroundColor = UIColorsHelper.background
        
        for i in [label, openView] {
            i.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(i)
        }
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openView.heightAnchor.constraint(equalTo: label.heightAnchor),
            openView.widthAnchor.constraint(equalTo: label.widthAnchor)
        ])
    }
    
    //MARK: - Animate Logo
    private func startAnimate() {
        UIView.animate(withDuration: 0.3) {
            self.openView.transform = CGAffineTransform(translationX: +150, y: 0)
        }
    }
    
}
