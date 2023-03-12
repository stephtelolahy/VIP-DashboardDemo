//
//  DashboardRouter.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//
import UIKit

protocol DashboardRouting {
    func toItemDetail(_ item: DashboardItem)
}

extension Router: DashboardRouting {
    func toItemDetail(_ item: DashboardItem) {
        let viewController = dependencies.itemDetailsViewController(item)
        source?.navigationController?.pushViewController(viewController, animated: true)
    }
}
