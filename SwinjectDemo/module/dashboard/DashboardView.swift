//
//  DashboardView.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var presenter: DashboardPresenter
    let interactor: DashboardInteractoring?

    var body: some View {
        NavigationView {
            List(presenter.items, id: \.self) { item in
                Text(item)
            }
            .navigationTitle("Dashboard")
        }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = DashboardPresenter(items: ["Item1", "Item2", "Item3"])
        DashboardView(presenter: presenter, interactor: nil)
    }
}
