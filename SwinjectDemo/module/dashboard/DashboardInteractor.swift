//
//  DashboardInteractor.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

protocol DashboardInteractoring {
}

protocol DashboardPresentering {
    func presentItems(_ items: [DashboardItem])
}

struct DashboardInteractor: DashboardInteractoring {
    
    private let presenter: DashboardPresentering
    private let service: DashboardServicing

    init(presenter: DashboardPresentering, service: DashboardServicing) {
        self.presenter = presenter
        self.service = service
        bindToDashboardItems()
    }

    private func bindToDashboardItems() {
        // TODO: make interactor stateless
        _ = service.dashboardItems.sink { items in
            presenter.presentItems(items)
        }
    }
}
