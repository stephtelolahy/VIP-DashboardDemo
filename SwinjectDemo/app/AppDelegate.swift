//
//  AppDelegate.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        let dashboardViewController = DashboardViewController()
        let settingsViewController = SettingsViewController()
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [dashboardViewController, settingsViewController]

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }
}

