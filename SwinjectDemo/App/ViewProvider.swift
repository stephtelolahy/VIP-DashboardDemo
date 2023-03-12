//
//  ViewProvider.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import UIKit

protocol ViewProvider {
    func dashboardViewController() -> UIViewController
    func settingsViewController() -> UIViewController
    func itemDetailsViewController(_ item: DashboardItem) -> UIViewController
}
