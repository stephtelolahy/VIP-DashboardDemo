//
//  DashboardInteractor.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import Combine

protocol DashboardInteractoring {
}

protocol DashboardPresentering {
    func presentItems(_ items: [DashboardItem])
}

class DashboardInteractor: DashboardInteractoring {
    
    private let presenter: DashboardPresentering
    private let service: DashboardServicing
    private var cancellables = Set<AnyCancellable>()

    init(presenter: DashboardPresentering, service: DashboardServicing) {
        self.presenter = presenter
        self.service = service
        bindToDashboardItems()
    }
    
    private func bindToDashboardItems() {
        service.dashboardItems.sink { [weak self] items in
            self?.presenter.presentItems(items)
        }
        .store(in: &cancellables)
    }
}
