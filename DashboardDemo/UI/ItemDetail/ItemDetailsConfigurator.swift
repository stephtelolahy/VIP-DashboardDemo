//
//  ItemDetailsConfigurator.swift
//  DashboardDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import UIKit
import SwiftUI

protocol ItemDetailsConfigurator {
    func detailsViewController(for item: DashboardItem) -> UIViewController
}

extension AppEnvironment: ItemDetailsConfigurator {
    func detailsViewController(for item: DashboardItem) -> UIViewController {
        let presenter = ItemDetailsPresenter()
        let interactor = ItemDetailsInteractor(item: item, presenter: presenter)
        let view = ItemDetailsView(presenter: presenter, interactor: interactor)
        return UIHostingController(rootView: view)
    }
}

