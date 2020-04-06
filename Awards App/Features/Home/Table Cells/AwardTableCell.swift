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
        
        typeLabel.backgroundColor = type == "Voucher" ? #colorLiteral(red: 0, green: 0.3541563749, blue: 0.9975861907, alpha: 1) : #colorLiteral(red: 0.8645781875, green: 0.3807055354, blue: 0.1469473243, alpha: 1)
        
        typeLabel.text = type
        priceLabel.text = price
        rewardLabel.text = reward
    }
    
}
