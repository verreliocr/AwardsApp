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
}
