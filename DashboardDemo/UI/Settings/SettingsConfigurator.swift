//
//  SettingsConfigurator.swift
//  DashboardDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import UIKit
import SwiftUI

protocol SettingsConfigurator {
    func settingsViewController() -> UIViewController
}

extension AppEnvironment: SettingsConfigurator {
    
    func settingsViewController() -> UIViewController {
        let service: DashboardServicing = dashboardService
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor(presenter: presenter, service: service)
        let view = SettingsView(presenter: presenter, interactor: interactor)
        return UIHostingController(rootView: view)
    }
}
