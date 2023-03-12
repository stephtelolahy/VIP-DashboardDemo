//
//  DashboardPresenter.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//
import Combine

class DashboardPresenter: ObservableObject {
    @Published var items: [DashboardItem]

    init(items: [DashboardItem] = []) {
        self.items = items
    }
}

extension DashboardPresenter: DashboardPresentering {

    func presentItems(_ objects: [DashboardItem]) {
        items = objects
    }
}
