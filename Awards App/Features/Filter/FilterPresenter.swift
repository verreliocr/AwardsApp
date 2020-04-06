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
    
    func getCurrentFilter() -> [String] {
        var currentFilter: [String] = []
        if viewModel.currentMaxValue != 10000 {
            currentFilter.append("Poin: 10000 - \(viewModel.currentMaxValue)")
        }
        if viewModel.currentType != "All" {
            currentFilter.append("Type: \(viewModel.currentType)")
        }
        if !currentFilter.isEmpty {
            currentFilter.append("Clear All Filter")
        }
        return currentFilter
    }
    
    func getCurrentMaxValue() -> Float {
        return viewModel.currentMaxValue
    }
    
    func getTypes() -> [String] {
        return ["All", "Vouchers", "Products"]
    }
    
    func getCurrentTypes() -> String {
        return viewModel.currentType
    }
    
    func isTypeSelected(at index: Int) -> Bool {
        getTypes()[index] == getCurrentTypes()
    }
    
    func changeMaxValue(_ value: Float) {
        viewModel.currentMaxValue = value
        viewWillAppear()
    }
    
    func clearAllFilter() {
        viewModel.currentMaxValue = 10000
        viewModel.currentType = "All"
        viewWillAppear()
    }
    
    func resetType() {
        viewModel.currentType = "All"
        viewWillAppear()
    }
    
    func resetMaxValue() {
        viewModel.currentMaxValue = 10000
        viewWillAppear()
    }
    
    func changeType(_ value: String) {
        viewModel.currentType = value
        viewWillAppear()
    }
    
}
