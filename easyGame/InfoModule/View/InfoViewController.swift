//
//  InfoViewController.swift
//  easyGame
//
//  Created by chulep on 08.03.2022.
//

import UIKit

protocol InfoViewProtocol: AnyObject {
    func loadInfo()
}

class InfoViewController: UIViewController {
    
    var presenter: InfoPresenter!
    private var infoView = InfoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColorsHelper.background
        view.addSubview(infoView)
        infoView.frame = view.bounds
        loadInfo()
    }
}

extension InfoViewController: InfoViewProtocol {
    func loadInfo() {
        infoView.corpLabel.text = presenter.info.creater
        infoView.locationLabel.text = presenter.info.location
        infoView.versionLabel.text = "ver" + presenter.info.version
    }
}

extension InfoViewController {
    @objc func tapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
