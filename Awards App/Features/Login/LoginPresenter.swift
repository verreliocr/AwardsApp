//
//  LoginPresenter.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class LoginPresenter: ILoginPresenter {
    
    weak var view: ILoginView?
    let viewModel: LoginViewModel
    let wireframe: ILoginWireframe
    
    init(viewModel: LoginViewModel, wireframe: ILoginWireframe) {
        self.viewModel = viewModel
        self.wireframe = wireframe
    }
    
    func setView(_ view: ILoginView) {
        self.view = view
    }
    
    func viewWillAppear() {
        
    }
    
    func didLogin(with email: String) {
        if email == viewModel.email {
            
        }else if !email.contains("@") || !email.contains(".") {
            self.view?.didShowInfo(true, with: "Wrong email format")
        }else{
            self.view?.didShowInfo(true, with: "Email not found")
        }
    }
    
}
