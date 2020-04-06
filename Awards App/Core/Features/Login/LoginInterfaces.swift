//
//  LoginInterfaces.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

protocol ILoginView: class {
    func reloadView()
    func showLoading(_ show: Bool)
}

protocol ILoginPresenter {
    func setView(_ view: ILoginView)
    func viewWillAppear()
    func didLogin(with email: String)
}

protocol ILoginWireframe {
    
}
