//
//  AwardTableCell.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class AwardTableCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var typeLabel: EdgeInsetLabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rewardLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backGroundView.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 2, blur: 116, spread: 0)
    }
    
    func bind(type: String, price: String, reward: String) {
        typeLabel.text = type
        priceLabel.text = price
        rewardLabel.text = reward
    }
    
}
