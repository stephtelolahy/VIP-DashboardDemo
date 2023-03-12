//
//  ViewProviderSwinject.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//
import Swinject
import SwinjectAutoregistration
import UIKit
import SwiftUI

struct AppEnvironmentSwinject {
    let container: Container
    
    static func create() -> Self {
        .init(container: Container() { container in
            registerSharedServices(container)
        })
    }
    
    static func registerSharedServices(_ container: Container) {
        container.register(DashboardServicing.self) { _ in
            DashboardService()
        }
        .inObjectScope(.container)
    }
}

private class DashboardAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DashboardPresenter.self) { _ in DashboardPresenter() }
        container.register(DashboardPresentering.self) { r in r.resolve(DashboardPresenter.self)! }
        container.autoregister(DashboardInteractoring.self, initializer: DashboardInteractor.init)
        container.autoregister(DashboardView.self, initializer: DashboardView.init)
    }
}

private class SettingsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SettingsPresenter.self) { _ in SettingsPresenter() }
        container.register(SettingsPresentering.self) { r in r.resolve(SettingsPresenter.self)! }
        container.autoregister(SettingsInteractoring.self, initializer: SettingsInteractor.init)
        container.autoregister(SettingsView.self, initializer: SettingsView.init)
    }
}

extension AppEnvironmentSwinject: ViewProvider {
    
//    func provideDashboardView() -> DashboardView {
//        let assembler = Assembler([
//            DashboardAssembly()
//        ], container: container)
//        return assembler.resolver.resolve(DashboardView.self)!
//    }
    func dashboardViewController() -> UIViewController {
        fatalError()
    }
    
//    func provideSettingsView() -> SettingsView {
//        let assembler = Assembler([
//            SettingsAssembly()
//        ], container: container)
//        return assembler.resolver.resolve(SettingsView.self)!
//    }

    func settingsViewController() -> UIViewController {
        fatalError()
    }

    func itemDetailsViewController(_ item: DashboardItem) -> UIViewController {
        fatalError()
    }
}
