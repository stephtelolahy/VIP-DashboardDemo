//
//  DashboardViewController.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import UIKit
import Combine

class DashboardViewController: UITableViewController {

    private let presenter: DashboardPresenter
    private let interactor: DashboardInteractoring?
    private var items: [String] = []
    private var cancellables = Set<AnyCancellable>()

    init(presenter: DashboardPresenter, interactor: DashboardInteractoring?) {
        self.presenter = presenter
        self.interactor = interactor
        super.init(style: .plain)

        presenter.$items.sink { [weak self] items in
            self?.items = items
            self?.tableView.reloadData()
        }
        .store(in: &cancellables)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        tabBarItem.title = "Dashboard"
        tableView.dataSource = self
        interactor?.onLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
