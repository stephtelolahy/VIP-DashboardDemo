//
//  ItemPresenter.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import Combine

class ItemPresenter: ObservableObject {
    @Published var title: String

    init(title: String) {
        self.title = title
    }
}

extension ItemPresenter: ItemPresenting {
    func present(_ item: DashboardItem) {
        title = item.rawValue
    }
}
