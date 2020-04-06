//
//  LoginModule.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

class LoginModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let viewModel = LoginViewModel()
        let wireframe = LoginWireframe(appRouter: router)
        let presenter = LoginPresenter(viewModel: viewModel, wireframe: wireframe)
        let view = LoginViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
