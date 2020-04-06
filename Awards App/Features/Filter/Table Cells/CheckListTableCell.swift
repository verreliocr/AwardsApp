//
//  CheckListTableCell.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class CheckListTableCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(isSelected: Bool, value: String) {
        if isSelected {
            imgView.image = UIImage(systemName: "checkmark.square.fill")
        }else{
            imgView.image = UIImage(systemName: "square")
        }
        
        valueLabel.text = value
    }
    
}
