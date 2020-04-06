//
//  HomeWireframe.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

class HomeWireframe: IHomeWireframe {
    let appRouter: IRouter
    
    init(appRouter: IRouter) {
        self.appRouter = appRouter
    }
}
