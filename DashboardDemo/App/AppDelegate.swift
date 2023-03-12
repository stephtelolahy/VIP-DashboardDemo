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

        // First option: manual dependency resolving
        let dependencies: ViewProvider = AppEnvironmentManual.create()

        // Second option: swinject dependency resolving
//        let dependencies: ViewProvider = ViewProviderSwinject.create()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController(dependencies: dependencies)
        window?.makeKeyAndVisible()

        return true
    }
}
