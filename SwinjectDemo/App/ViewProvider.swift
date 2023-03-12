//
//  ViewProvider.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import UIKit
import SwiftUI

protocol ViewProvider {
    func provideDashboardViewController() -> UIViewController
    func provideSettingsViewController() -> UIViewController
    func provideItemDetailsView(_ item: DashboardItem) -> ItemDetailsView
}
