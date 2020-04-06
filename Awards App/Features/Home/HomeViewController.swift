//
//  HomeViewController.swift
//  Awards App
//
//  Created by Verrelio C. Rizky on 06/04/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let presenter: IHomePresenter
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var constSideBarViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var sideBarBackView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    init(presenter: IHomePresenter) {
        self.presenter = presenter
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hideBarIfNecessary()
        setupTableView()
        hideSideBar()
        
        menuButton.addAction { [unowned self] in
            self.showSideBar()
        }
        
        filterButton.addAction { [unowned self] in
            self.presenter.navigateToFilter()
        }
        
        homeButton.addAction { [unowned self] in
            self.hideSideBar()
        }
        
        logoutButton.addAction { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
        
        sideBarBackView.addAction { [unowned self] in
            self.hideSideBar()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register([AwardTableCell.self])
    }
    
    @objc func showSideBar() {
        UIView.animate(withDuration: 0.3, animations: { [unowned self] in
            self.constSideBarViewTrailing.constant = 111
            self.sideBarBackView.alpha = 1
            self.view.layoutIfNeeded()
        })
    }
    
    func hideSideBar() {
        UIView.animate(withDuration: 0.3, animations: { [unowned self] in
            self.constSideBarViewTrailing.constant = UIScreen.main.bounds.width
            self.sideBarBackView.alpha = 0
            self.view.layoutIfNeeded()
        })
    }

}

extension HomeViewController: IHomeView {
    func reloadView() {
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: AwardTableCell = tableView.dequeueReusableCell() {
            cell.bind(type: presenter.getType(at: indexPath.row),
                      price: presenter.getPrice(at: indexPath.row),
                      reward: presenter.getRewards(at: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
