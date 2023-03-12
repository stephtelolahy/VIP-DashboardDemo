//
//  ItemInteractor.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

protocol ItemInteractoring {
    func onTap()
}

protocol ItemPresenting {
    func present(_ item: DashboardItem)
}

struct ItemInteractor: ItemInteractoring {

    let item: DashboardItem
    let presenter: ItemPresenter

    init(item: DashboardItem, presenter: ItemPresenter) {
        self.item = item
        self.presenter = presenter
        presenter.present(item)
    }

    func onTap() {
        
    }

}
