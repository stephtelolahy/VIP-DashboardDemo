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

//        let dependencies: ViewProvider = ViewProviderManual.create()
        let dependencies: ViewProvider = ViewProviderSwinject.create()

        let dashboardView = dependencies.provideDashboardView()
        let dashboardViewController = UIHostingController(rootView: dashboardView)
        dashboardViewController.tabBarItem.title = "Dashboard"
        dashboardViewController.tabBarItem.image = UIImage(systemName: "folder")

        let settingsView = dependencies.provideSettingsView()
        let settingsViewController = UIHostingController(rootView: settingsView)
        settingsViewController.tabBarItem.title = "Settings"
        settingsViewController.tabBarItem.image = UIImage(systemName: "slider.horizontal.3")

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [dashboardViewController, settingsViewController]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }
}

