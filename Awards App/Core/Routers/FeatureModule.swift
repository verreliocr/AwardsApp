//
//  FeatureModule.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

enum FeatureModule {
    case login
    case home
    case filter
    
    func create(using router: IRouter) -> IModule {
        switch self {
        case .login:
            return LoginModule(appRouter: router)
        case .home:
            return HomeModule(appRouter: router)
        case .filter:
            return FilterModule(appRouter: router)
        }
    }
}
