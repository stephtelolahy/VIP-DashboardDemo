//
//  AppEnvironment.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//
import Swinject
import UIKit

struct AppEnvironment {
    static let shared: Self = .init()

    let container = Container() { container in
        container.register(DashboardServicing.self) { _ in
            DashboardService()
        }.inObjectScope(.container)
    }
}


extension AppEnvironment {

    func resolveDashboardViewController() -> UIViewController {
        let service: DashboardServicing = container.resolve(DashboardServicing.self)!
        let presenter = DashboardPresenter()
        let interactor = DashboardInteractor(presenter: presenter, service: service)
        return DashboardViewController(presenter: presenter, interactor: interactor)
    }
}
