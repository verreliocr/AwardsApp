//
//  Helper.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

struct Helper {
    fileprivate static var decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    
    static func formatNumber(value: Double) -> String {
        return decimalFormatter.string(from: NSNumber(value: value))!
    }
    
    static func formatNumber(value: Int) -> String {
        return decimalFormatter.string(from: NSNumber(value: value))!
    }
}
