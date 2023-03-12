//
//  ItemDetailsRouter.swift
//  DashboardDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//
import UIKit

protocol ItemDetailsRouting {
    func toItemDetail(_ item: DashboardItem)
}

struct ItemDetailsRouter: ItemDetailsRouting {
    weak var source: UIViewController?
    let dependencies: ItemDetailsConfigurator

    func toItemDetail(_ item: DashboardItem) {
        let viewController = dependencies.detailsViewController(for: item)
        source?.navigationController?.pushViewController(viewController, animated: true)
    }
}

