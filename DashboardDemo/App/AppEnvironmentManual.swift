//
//  DIContainerManual.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import UIKit
import SwiftUI

struct AppEnvironmentManual {
    let dashboardService: DashboardServicing

    static func create() -> Self {
        .init(dashboardService: DashboardService())
    }
}

extension AppEnvironmentManual: ViewProvider {

    func dashboardViewController() -> UIViewController {
        let service: DashboardServicing = dashboardService
        let presenter = DashboardPresenter()
        var view = DashboardView(presenter: presenter)
        let viewController = UIHostingController(rootView: view)

        // configuring view
        let router = Router(source: viewController, dependencies: self)
        view.interactor = DashboardInteractor(presenter: presenter, service: service, router: router)
        viewController.rootView = view

        return viewController
    }

    func settingsViewController() -> UIViewController {
        let service: DashboardServicing = dashboardService
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor(presenter: presenter, service: service)
        let view = SettingsView(presenter: presenter, interactor: interactor)
        return UIHostingController(rootView: view)
    }

    func detailsViewController(for item: DashboardItem) -> UIViewController {
        let presenter = ItemDetailsPresenter()
        let interactor = ItemDetailsInteractor(item: item, presenter: presenter)
        let view = ItemDetailsView(presenter: presenter, interactor: interactor)
        return UIHostingController(rootView: view)
    }
}
