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
    
    init(presenter: IHomePresenter) {
        self.presenter = presenter
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register([AwardTableCell.self])
    }
    
    func setupNavBar() {
        self.title = "Awards"
        let leftBar = UIBarButtonItem(image: #imageLiteral(resourceName: "justification"), style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftBar
        let rightBar = UIBarButtonItem(image: #imageLiteral(resourceName: "justification"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBar
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
