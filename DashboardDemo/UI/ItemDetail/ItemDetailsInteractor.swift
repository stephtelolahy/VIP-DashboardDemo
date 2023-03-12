//
//  ItemDetailsInteractor.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

protocol ItemDetailsInteracting {}

protocol ItemDetailsPresenting {
    func presentItem(_ item: DashboardItem)
}

struct ItemDetailsInteractor: ItemDetailsInteracting {

    let item: DashboardItem
    let presenter: ItemDetailsPresenting

    init(item: DashboardItem, presenter: ItemDetailsPresenting) {
        self.item = item
        self.presenter = presenter
        presenter.presentItem(item)
    }
}
