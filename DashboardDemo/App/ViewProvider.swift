//
//  ViewProvider.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import UIKit

/// Configuring VIP cycle by encapsulating creation of all instances and assigning them when needed
protocol ViewProvider {
    func dashboardViewController() -> UIViewController
    func settingsViewController() -> UIViewController
    func detailsViewController(for item: DashboardItem) -> UIViewController
}
