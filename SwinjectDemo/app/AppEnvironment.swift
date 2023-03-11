//
//  AppEnvironment.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//
import Swinject

struct AppEnvironment {
    static let shared: Self = .init()

    let container = Container() { container in
        container.register(DashboardServicing.self) { _ in
            DashboardService()
        }.inObjectScope(.container)
    }
}


extension AppEnvironment {
}
