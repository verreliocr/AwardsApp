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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    init(presenter: IFilterPresenter) {
        self.presenter = presenter
        super.init(nibName: "FilterViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hideBarIfNecessary()
        setupTableView()
        closeButton.addAction { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
        
        filterButton.addAction { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.register([FilterItemTableCell.self,
                                 RangeTableCell.self,
                                 CheckListTableCell.self])
    }

}

extension FilterViewController: IFilterView {
    func reloadView() {
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
    }
}

extension FilterViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return presenter.getCurrentFilter().count
        case 2:
            return presenter.getTypes().count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell: FilterItemTableCell = tableView.dequeueReusableCell() {
                
                cell.bind(value: presenter.getCurrentFilter()[indexPath.row],
                          isEnableClose: presenter.getCurrentFilter()[indexPath.row] != "Clear All Filter")
                
                return cell
            }
            return UITableViewCell()
        case 1:
            if let cell: RangeTableCell = tableView.dequeueReusableCell() {
                
                cell.bind(maxValue: presenter.getCurrentMaxValue())
                cell.changeValue = { [weak self] value in
                    self?.presenter.changeMaxValue(value)
                }
                
                return cell
            }
            return UITableViewCell()
        case 2:
            if let cell: CheckListTableCell = tableView.dequeueReusableCell() {
                
                cell.bind(isSelected: presenter.isTypeSelected(at: indexPath.row),
                          value: presenter.getTypes()[indexPath.row])
                
                return cell
            }
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if presenter.getCurrentFilter()[indexPath.row].lowercased().contains("poin") {
                presenter.resetMaxValue()
            }else if presenter.getCurrentFilter()[indexPath.row].lowercased().contains("type") {
                presenter.resetType()
            }else if presenter.getCurrentFilter()[indexPath.row].contains("Clear All Filter") {
                presenter.clearAllFilter()
            }
        case 2:
            presenter.changeType(presenter.getTypes()[indexPath.row])
        default:
            return
        }
    }
    
}
