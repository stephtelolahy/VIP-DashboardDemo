//
//  MainViewController.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import UIKit

class MainViewController: UITabBarController {

    init(dependencies: ViewProvider) {
        super.init(nibName: nil, bundle: nil)

        let dashboard = dependencies.dashboardViewController()
        let dashboardNavController = UINavigationController(rootViewController: dashboard)
        dashboardNavController.tabBarItem.title = "Dashboard"
        dashboardNavController.tabBarItem.image = UIImage(systemName: "folder")

        let settings = dependencies.settingsViewController()
        let settingsNavController = UINavigationController(rootViewController: settings)
        settingsNavController.tabBarItem.title = "Settings"
        settingsNavController.tabBarItem.image = UIImage(systemName: "slider.horizontal.3")

        viewControllers = [
            dashboardNavController,
            settingsNavController
        ]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
