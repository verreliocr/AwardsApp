//
//  FilterItemTableCell.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class FilterItemTableCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.borderColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        backView.layer.borderWidth = 1
        closeButton.isUserInteractionEnabled = false
    }
    
    func bind(value: String, isEnableClose: Bool) {
        valueLabel.text = value
        closeButton.isHidden = !isEnableClose
    }
    
}
