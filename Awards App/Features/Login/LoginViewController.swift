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
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var alertLabel: UILabel!
    
    init(presenter: ILoginPresenter) {
        self.presenter = presenter
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hideBarIfNecessary()
        loginTextField.becomeFirstResponder()
        signInButton.applySketchShadow(color: .black, alpha: 0.15, x: 0, y: 2, blur: 116, spread: 0)
        signInButton.addAction { [unowned self] in
            self.presenter.didLogin(with: self.loginTextField.text ?? "")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    @IBAction func didSelectAction(_ sender: UITextField) {
        self.view.endEditing(true)
        self.presenter.didLogin(with: self.loginTextField.text ?? "")
    }
    
}

extension LoginViewController: ILoginView {
    func didShowInfo(_ value: Bool, with caption: String) {
        alertLabel.isHidden = !value
        alertLabel.text = caption
    }
}
