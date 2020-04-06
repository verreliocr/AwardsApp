//
//  HomePresenter.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class HomePresenter: IHomePresenter {
    
    weak var view: IHomeView?
    let viewModel: HomeViewModel
    let wireframe: IHomeWireframe
    
    init(viewModel: HomeViewModel, wireframe: IHomeWireframe) {
        self.viewModel = viewModel
        self.wireframe = wireframe
    }
    
    func setView(_ view: IHomeView) {
        self.view = view
    }
    
    func viewWillAppear() {
        self.view?.reloadView()
    }
    
    func getDataCount() -> Int {
        viewModel.data.count
    }
    
    func getType(at section: Int) -> String {
        return viewModel.data[section].type
    }
    
    func getPrice(at section: Int) -> String {
        return "\(viewModel.data[section].price) Poin"
    }
    
    func getRewards(at section: Int) -> String {
        return viewModel.data[section].reward
    }
    
}
