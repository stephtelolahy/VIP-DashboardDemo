//
//  SettingsInteractor.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import Combine

protocol SettingsInteractoring {
    func onReorder()
}

protocol SettingsPresentering {
    func presentItems(_ items: [DashboardItem])
}

class SettingsInteractor: SettingsInteractoring {

    private let presenter: SettingsPresentering
    private let service: DashboardServicing
    private var cancellables = Set<AnyCancellable>()

    init(presenter: SettingsPresentering, service: DashboardServicing) {
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

    func onReorder() {
        var items: [DashboardItem] = service.dashboardItems.value
        items.shuffle()
        service.update(items)
    }
}
