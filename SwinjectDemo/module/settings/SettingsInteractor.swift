//
//  SettingsInteractor.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

protocol SettingsInteractoring {
    func onReorder()
}

protocol SettingsPresentering {
    func presentItems(_ items: [DashboardItem])
}

struct SettingsInteractor: SettingsInteractoring {

    private let presenter: SettingsPresentering
    private let service: DashboardServicing

    init(presenter: SettingsPresentering, service: DashboardServicing) {
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

    func onReorder() {
        var items: [DashboardItem] = service.dashboardItems.value
        items.shuffle()
        service.update(items)
    }
}
