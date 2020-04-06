//
//  FilterViewController.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    let presenter: IFilterPresenter
    
    init(presenter: IFilterPresenter) {
        self.presenter = presenter
        super.init(nibName: "FilterViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension FilterViewController: IFilterView {
    func reloadView() {
        
    }
}
