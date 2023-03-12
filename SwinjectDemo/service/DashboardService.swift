//
//  DashboardService.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//
import Combine

protocol DashboardServicing {

    var dashboardItems: CurrentValueSubject<[DashboardItem], Never> { get }

    func update(_ items: [DashboardItem])
}

struct DashboardService: DashboardServicing {

    let dashboardItems: CurrentValueSubject<[DashboardItem], Never> = .init((0..<3).map { DashboardItem(name: "Item\($0)") })

    func update(_ items: [DashboardItem]) {
        dashboardItems.send(items)
    }
}
