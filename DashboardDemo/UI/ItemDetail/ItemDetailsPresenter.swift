//
//  ItemDetailsPresenter.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//
import Combine

class ItemDetailsPresenter: ObservableObject {
    @Published var title: String

    init(title: String = "") {
        self.title = title
    }
}

extension ItemDetailsPresenter: ItemDetailsPresenting {
    func presentItem(_ item: DashboardItem) {
        title = item.rawValue
    }
}
