//
//  RangeTableCell.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class RangeTableCell: UITableViewCell {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var endValueLabel: UILabel!
    
    var changeValue: ((Float) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(maxValue: Float) {
        endValueLabel.text = "IDR " + Helper.formatNumber(value: Int(maxValue))
        slider.setValue(maxValue, animated: true)
    }
    
    @IBAction func changeValue(_ sender: UISlider) {
        let step: Float = 10000
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        endValueLabel.text = "IDR " + Helper.formatNumber(value: Int(sender.value))
        changeValue?(sender.value)
    }
    
}
