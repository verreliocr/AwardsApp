//
//  HomeInterfaces.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

protocol IHomeView: class {
    func reloadView()
}

protocol IHomePresenter {
    func setView(_ view: IHomeView)
    func viewWillAppear()
}

protocol IHomeWireframe {
    
}
