//
//  InfoPresenter.swift
//  easyGame
//
//  Created by chulep on 08.03.2022.
//

import Foundation

protocol InfoPresenterProtocol: AnyObject {
    var info: InfoModel {get}
    func close()
}

class InfoPresenter: InfoPresenterProtocol {
    
    var info: InfoModel
    private weak var view: InfoViewProtocol!
    
    init(view: InfoViewProtocol, info: InfoModel) {
        self.view = view
        self.info = info
    }
    
    func close() {
        
    }
}
