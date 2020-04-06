//
//  FilterInterfaces.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

protocol IFilterView: class {
    func reloadView()
}

protocol IFilterPresenter {
    func setView(_ view: IFilterView)
    func viewWillAppear()
    func getCurrentFilter() -> [String]
    func getCurrentMaxValue() -> Float
    func getCurrentTypes() -> String
    func getTypes() -> [String]
    func isTypeSelected(at index: Int) -> Bool
    func changeMaxValue(_ value: Float)
    func clearAllFilter()
    func resetMaxValue()
    func resetType()
    func changeType(_ value: String)
}
