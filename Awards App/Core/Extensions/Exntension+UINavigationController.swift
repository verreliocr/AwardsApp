//
//  Exntension+UINavigationController.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func hideBarIfNecessary() {
        if self.isNavigationBarHidden != true {
            self.setNavigationBarHidden(true, animated: true)
        }
    }
    
    func showBarIfNecessary() {
        if self.isNavigationBarHidden {
            self.setNavigationBarHidden(false, animated: true)
        }
    }
}
