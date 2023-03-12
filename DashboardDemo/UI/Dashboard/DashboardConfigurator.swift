//
//  DashboardConfigurator.swift
//  DashboardDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//
import UIKit
import SwiftUI

protocol DashboardConfigurator {
    func dashboardViewController() -> UIViewController
    func detailsViewController(for item: DashboardItem) -> UIViewController
}

extension AppEnvironment: DashboardConfigurator {

    func dashboardViewController() -> UIViewController {
        let service: DashboardServicing = dashboardService
        let presenter = DashboardPresenter()
        var view = DashboardView(presenter: presenter)
        let viewController = UIHostingController(rootView: view)

        // configuring view
        let router = DashboardRouter(source: viewController, dependencies: self)
        view.interactor = DashboardInteractor(presenter: presenter, service: service, router: router)
        viewController.rootView = view

        return viewController
    }

    func detailsViewController(for item: DashboardItem) -> UIViewController {
        let presenter = ItemDetailsPresenter()
        let interactor = ItemDetailsInteractor(item: item, presenter: presenter)
        let view = ItemDetailsView(presenter: presenter, interactor: interactor)
        return UIHostingController(rootView: view)
    }
}
