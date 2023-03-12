//
//  SettingsPresenter.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import Combine

class SettingsPresenter: ObservableObject {
    @Published var position: Int
    @Published var count: Int

    init(position: Int = -1, count: Int = 0) {
        self.position = position
        self.count = count
    }
}

extension SettingsPresenter: SettingsPresentering {

    func presentItems(_ items: [DashboardItem]) {
        position = items.firstIndex(where: { $0.name == "Item0" }) ?? -1
        count = items.count
    }
}
