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

private class ItemAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ItemDetailsPresenter.self) { _ in ItemDetailsPresenter() }
        container.register(ItemDetailsPresenting.self) { r in r.resolve(ItemDetailsPresenter.self)! }
        container.register(ItemDetailsInteractor.self) { r, item in ItemDetailsInteractor(item: item, presenter: r.resolve(ItemDetailsPresenting.self)!) }
        container.register(ItemDetailsInteracting.self) { r in r.resolve(ItemDetailsInteractor.self)! }
        container.autoregister(ItemDetailsView.self, initializer: ItemDetailsView.init)
    }
}


extension AppEnvironmentSwinject: ViewProvider {

    /// Issues using swinject
    /// - Error prone
    /// - Complex resolving router
    /// - Complex passing arguments

    func dashboardViewController() -> UIViewController {
        let assembler = Assembler([
            DashboardAssembly()
        ], container: container)
        let view = assembler.resolver.resolve(DashboardView.self)!
        let viewController = UIHostingController(rootView: view)
        return viewController
    }

    func settingsViewController() -> UIViewController {
        let assembler = Assembler([
            SettingsAssembly()
        ], container: container)
        let view = assembler.resolver.resolve(SettingsView.self)!
        return UIHostingController(rootView: view)
    }

    func detailsViewController(for item: DashboardItem) -> UIViewController {
        let assembler = Assembler([
            ItemAssembly()
        ], container: container)
        let view = assembler.resolver.resolve(ItemDetailsView.self)!
        return UIHostingController(rootView: view)
    }
}
