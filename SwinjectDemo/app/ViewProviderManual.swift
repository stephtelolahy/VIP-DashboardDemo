//
//  ViewProviderManual.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import UIKit

struct ViewProviderManual {
    let dashboardService: DashboardServicing

    static func create() -> Self {
        ViewProviderManual(dashboardService: DashboardService())
    }
}

extension ViewProviderManual: ViewProvider {

    func provideDashboardViewController() -> UIViewController {
        let service: DashboardServicing = dashboardService
        let presenter = DashboardPresenter()
        let interactor = DashboardInteractor(presenter: presenter, service: service)
        return DashboardViewController(presenter: presenter, interactor: interactor)
    }
    
    func provideSettingsViewController() -> UIViewController {
        SettingsViewController()
    }
}
