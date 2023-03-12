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
}

extension AppEnvironment: DashboardConfigurator {

    func dashboardViewController() -> UIViewController {
        let service: DashboardServicing = dashboardService
        let presenter = DashboardPresenter()
        var view = DashboardView(presenter: presenter)
        let viewController = UIHostingController(rootView: view)

        // configuring view
        let router = ItemDetailsRouter(source: viewController, dependencies: self)
        view.interactor = DashboardInteractor(presenter: presenter, service: service, router: router)
        viewController.rootView = view

        return viewController
    }
}
