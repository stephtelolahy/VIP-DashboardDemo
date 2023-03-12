//
//  DashboardRouter.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//
import UIKit
import SwiftUI

protocol DashboardRouting {
    func toItemDetail(_ item: DashboardItem)
}

extension Router: DashboardRouting {
    func toItemDetail(_ item: DashboardItem) {
        let view = dependencies.provideItemDetailsView(item)
        let viewController = UIHostingController(rootView: view)
        current?.present(viewController, animated: true)
    }
}
