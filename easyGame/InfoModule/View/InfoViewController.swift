//
//  InfoViewController.swift
//  easyGame
//
//  Created by chulep on 08.03.2022.
//

import UIKit
import CoreData

protocol InfoViewProtocol: AnyObject {
    func loadInfo()
}

class InfoViewController: UIViewController {
    
    var presenter: InfoPresenter!
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "easyGame"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    var createrLabel: UILabel = {
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
    
    let scoreLabel: UILabel = {
        var label = UILabel()
        label.text = "Top scores:"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var closeButon: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColorsHelper.screenAndOtherButton
        button.setTitle("✕", for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColorsHelper.border
        button.addTarget(nil, action: #selector(tapCloseButton), for: .touchUpInside)
        return button
    }()
    
    lazy private var allElement = [nameLabel, versionLabel, createrLabel, locationLabel, closeButon, scoreLabel, tableView]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColorsHelper.background
        for element in allElement {
            element.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(element)
        }
        presenter.info.loadScore()
        loadInfo()
        createUI()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameLabel.textColor = UIColorsHelper.createGradientColor(bounds: nameLabel.bounds)
        closeButon.layer.cornerRadius = closeButon.bounds.height / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.info.loadScore()
    }
    
}

extension InfoViewController: InfoViewProtocol {
    
    func loadInfo() {
        nameLabel.text = "easyGame"
        createrLabel.text = presenter.info.creater
        locationLabel.text = presenter.info.location
        versionLabel.text = presenter.info.version
    }
    
}

extension InfoViewController {
    
    @objc func tapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension InfoViewController {
    
    func createUI() {
        NSLayoutConstraint.activate([
            closeButon.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            closeButon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            closeButon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/10),
            closeButon.heightAnchor.constraint(equalTo: closeButon.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            createrLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 70),
            createrLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: createrLabel.topAnchor, constant: 30),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 30),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -30),
            
            versionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

extension InfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.info.score.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        cell.textLabel?.text = presenter.info.score[indexPath.row].score
        cell.detailTextLabel?.text = presenter.info.score[indexPath.row].date
        return cell
    }
    
}
