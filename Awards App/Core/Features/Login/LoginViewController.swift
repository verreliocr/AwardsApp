//
//  LoginViewController.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let presenter: ILoginPresenter
    
    init(presenter: ILoginPresenter) {
        self.presenter = presenter
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension LoginViewController: ILoginView {
    func reloadView() {
        
    }
    
    func showLoading(_ show: Bool) {
        
    }
}
