//
//  FilterPresenter.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class FilterPresenter: IFilterPresenter {
    
    weak var view: IFilterView?
    let viewModel: FilterViewModel
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
    }
    
    func setView(_ view: IFilterView) {
        self.view = view
    }
    
    func viewWillAppear() {
        self.view?.reloadView()
    }
    
}
