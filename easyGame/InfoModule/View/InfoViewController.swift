//
//  InfoViewController.swift
//  easyGame
//
//  Created by chulep on 08.03.2022.
//

import UIKit
import CoreData

protocol InfoViewProtocol: AnyObject {
    func closeInfoView()
    func showInfo(info: InfoModel)
}

class InfoViewController: UIViewController {
    
    private var info: InfoModel!
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
        button.addTarget(nil, action: #selector(closeInfoView), for: .touchUpInside)
        return button
    }()
    
    lazy private var allElement = [nameLabel, versionLabel, createrLabel, locationLabel, closeButon, scoreLabel, tableView]
    
    private var closeButtonSize = CGSize()
    
    init(currentButtonSize: CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.closeButtonSize = currentButtonSize
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColorsHelper.background
        for element in allElement {
            element.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(element)
        }
        createUI()
        tableView.register(ScoreTableViewCell.self, forCellReuseIdentifier: ScoreTableViewCell.identifire)
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameLabel.textColor = UIColorsHelper.createGradientColor(bounds: nameLabel.bounds)
        closeButon.layer.cornerRadius = closeButon.bounds.height / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.loadData()
    }
    
}

//MARK: - Protocol method
extension InfoViewController: InfoViewProtocol {
    func showInfo(info: InfoModel) {
        self.info = info
        tableView.reloadData()
    }
    
    @objc func closeInfoView() {
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - UI
extension InfoViewController {
    
    func createUI() {
        NSLayoutConstraint.activate([
            closeButon.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            closeButon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            closeButon.widthAnchor.constraint(equalToConstant: CGFloat(closeButtonSize.width)),
            closeButon.heightAnchor.constraint(equalToConstant: CGFloat(closeButtonSize.height)),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            createrLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 70),
            createrLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: createrLabel.topAnchor, constant: 30),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 30),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -30),
            
            versionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

//MARK: - TableView DataSourse
extension InfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        info.score.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScoreTableViewCell.identifire, for: indexPath) as! ScoreTableViewCell
        cell.scoreLabel.text = info.score[indexPath.row].score
        cell.dateLabel.text = info.score[indexPath.row].date
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColorsHelper.borderCell
        cell.layer.cornerRadius = cell.bounds.height / 2
        return cell
    }
    
}
