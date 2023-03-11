//
//  ViewProviderSwinject.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//
import Swinject
import SwinjectAutoregistration
import UIKit

struct ViewProviderSwinject {
    let container: Container

    static func create() -> Self {
        let container = Container()
        return ViewProviderSwinject(container: container)
    }
}

extension ViewProviderSwinject: ViewProvider {

    func provideDashboardViewController() -> UIViewController {
        let assembler: Assembler = Assembler([ServiceAssembly(), DashboardAssembly()], container: container)
        return assembler.resolver.resolve(DashboardViewController.self)!
    }

    func provideSettingsViewController() -> UIViewController {
        fatalError()
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
        container.autoregister(DashboardPresentering.self, initializer: DashboardPresenter.init)
        container.autoregister(DashboardInteractoring.self, initializer: DashboardInteractor.init)
    }
}
