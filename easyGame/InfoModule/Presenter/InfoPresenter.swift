//
//  InfoPresenter.swift
//  easyGame
//
//  Created by chulep on 08.03.2022.
//

import Foundation

protocol InfoPresenterProtocol: AnyObject {
    init(view: InfoViewProtocol, infoData: InfoModel)
    func loadData()
}

class InfoPresenter: InfoPresenterProtocol {
    
    var info: InfoModel
    private weak var view: InfoViewProtocol!
    
    required init(view: InfoViewProtocol, infoData: InfoModel) {
        self.view = view
        self.info = infoData
    }
    
    func loadData() {
        info.loadScore()
        view.showInfo(info: info)
    }
    
}
