//
//  TabBarConfigurator.swift
//  DashboardDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import UIKit

typealias TabBarConfigurator = DashboardConfigurator & SettingsConfigurator

extension UITabBarController {
    
    func configure(with configurator: TabBarConfigurator) -> UITabBarController {
        let dashboard = configurator.dashboardViewController()
        let dashboardNavController = UINavigationController(rootViewController: dashboard)
        dashboardNavController.tabBarItem.title = "Dashboard"
        dashboardNavController.tabBarItem.image = UIImage(systemName: "folder")
        
        let settings = configurator.settingsViewController()
        let settingsNavController = UINavigationController(rootViewController: settings)
        settingsNavController.tabBarItem.title = "Settings"
        settingsNavController.tabBarItem.image = UIImage(systemName: "slider.horizontal.3")
        
        viewControllers = [
            dashboardNavController,
            settingsNavController
        ]
        
        return self
    }
}
