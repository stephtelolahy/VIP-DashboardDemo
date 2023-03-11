//
//  DashboardService.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//
import Combine

protocol DashboardServicing {

    var dashboardItems: CurrentValueSubject<[DashboardItem], Never> { get }
}

struct DashboardService: DashboardServicing {

    let dashboardItems: CurrentValueSubject<[DashboardItem], Never> = .init([
        DashboardItem(name: "Item1"),
        DashboardItem(name: "Item2"),
        DashboardItem(name: "Item3"),
        DashboardItem(name: "Item4")
    ])
}
