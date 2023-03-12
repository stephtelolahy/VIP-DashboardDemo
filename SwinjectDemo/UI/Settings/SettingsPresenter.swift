//
//  SettingsPresenter.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import Combine

class SettingsPresenter: ObservableObject {
    @Published var status: String

    init(status: String = "") {
        self.status = status
    }
}

extension SettingsPresenter: SettingsPresentering {

    func presentItems(_ items: [DashboardItem]) {
        status = items.map(\.rawValue).joined(separator: " - ")
    }
}
