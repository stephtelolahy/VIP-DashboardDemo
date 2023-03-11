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

    let dashboardItems: CurrentValueSubject<[DashboardItem], Never> = .init((0..<5).map { DashboardItem(name: "Item\($0)") })
}
