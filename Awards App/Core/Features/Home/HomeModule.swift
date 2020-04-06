//
//  HomeModule.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

class HomeModule: IModule {
    var router: IRouter
    
    init(appRouter: IRouter) {
        self.router = appRouter
    }
    
    func resolve(using params: [String : Any]) -> UIViewController {
        let viewModel = HomeViewModel()
        let wireframe = HomeWireframe(appRouter: router)
        let presenter = HomePresenter(viewModel: viewModel, wireframe: wireframe)
        let view = HomeViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
