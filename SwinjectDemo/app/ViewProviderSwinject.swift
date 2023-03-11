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

struct ViewProviderSwinject {
    let container: Container

    static func create() -> Self {
        .init(container: Container())
    }
}

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(DashboardServicing.self, initializer: DashboardService.init)
            .inObjectScope(.container)
    }
}

class DashboardAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DashboardPresenter.self) { _ in DashboardPresenter() }
        container.register(DashboardPresentering.self) { r in r.resolve(DashboardPresenter.self)! }
        container.autoregister(DashboardInteractoring.self, initializer: DashboardInteractor.init)
        container.autoregister(DashboardViewController.self, initializer: DashboardViewController.init)
    }
}

extension ViewProviderSwinject: ViewProvider {

    func provideDashboardViewController() -> UIViewController {
        let childContainer = Container(parent: container)
        let assembler = Assembler([
            ServiceAssembly(),
            DashboardAssembly()
        ], container: childContainer)
        return assembler.resolver.resolve(DashboardViewController.self)!
    }

    func provideSettingsView() -> SettingsView {
        SettingsView()
    }
}
