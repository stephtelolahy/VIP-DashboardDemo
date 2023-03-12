//
//  AppDelegate.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let dependencies: ViewProvider = ViewProviderManual.create()
//        let dependencies: ViewProvider = ViewProviderSwinject.create()

        let tabBarController = UITabBarController()
        tabBarController.setup(dashboard: dependencies.provideDashboardViewController(),
                               settings: dependencies.provideSettingsViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }
}

private extension UITabBarController {

    func setup(dashboard: UIViewController, settings: UIViewController) {
        let dashboardNav = UINavigationController(rootViewController: dashboard)
        dashboardNav.tabBarItem.title = "Dashboard"
        dashboardNav.tabBarItem.image = UIImage(systemName: "folder")

        let settingsNav = UINavigationController(rootViewController: settings)
        settingsNav.tabBarItem.title = "Settings"
        settingsNav.tabBarItem.image = UIImage(systemName: "slider.horizontal.3")

        self.viewControllers = [
            dashboardNav,
            settingsNav
        ]
    }
}
