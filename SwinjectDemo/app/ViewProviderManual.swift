//
//  ViewProviderManual.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import UIKit
import SwiftUI

struct ViewProviderManual {
    let dashboardService: DashboardServicing

    static func create() -> Self {
        .init(dashboardService: DashboardService())
    }
}

extension ViewProviderManual: ViewProvider {

    func provideDashboardView() -> DashboardView {
        let service: DashboardServicing = dashboardService
        let presenter = DashboardPresenter()
        let interactor = DashboardInteractor(presenter: presenter, service: service)
        return DashboardView(presenter: presenter, interactor: interactor)
    }

    func provideSettingsView() -> SettingsView {
        let service: DashboardServicing = dashboardService
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor(presenter: presenter, service: service)
        return SettingsView(presenter: presenter, interactor: interactor)
    }
}
