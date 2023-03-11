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

extension ViewProviderSwinject: ViewProvider {

    func provideDashboardViewController() -> UIViewController {
        let assembler = Assembler([
            ServiceAssembly(),
            DashboardAssembly()
        ], container: container)
        return assembler.resolver.resolve(DashboardViewController.self)!
    }

    func provideSettingsViewController() -> UIViewController {
        let viewcontroller = UIHostingController(rootView: SettingsView())
        viewcontroller.tabBarItem.title = "Settings"
        return viewcontroller
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
        let thePresenter = DashboardPresenter()
        container.register(DashboardPresenter.self, factory: { _ in
            thePresenter
        })
        container.register(DashboardPresentering.self, factory: { _ in
            thePresenter
        })
        container.autoregister(DashboardInteractoring.self, initializer: DashboardInteractor.init)
        container.autoregister(DashboardViewController.self, initializer: DashboardViewController.init)
    }
}
