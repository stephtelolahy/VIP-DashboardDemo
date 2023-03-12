//
//  DashboardView.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var presenter: DashboardPresenter
    var interactor: DashboardInteractoring?

    var body: some View {
        List(presenter.items, id: \.self) { item in
            rowView(for: item)
        }
    }

    func rowView(for item: DashboardItem) -> some View {
        DashboardItemView(item: item) {
            interactor?.onSelect(item: item)
        }
    }
}

#if DEBUG
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [DashboardItem] = [.item1, .item2, .item3]
        let presenter = DashboardPresenter(items: data)
        DashboardView(presenter: presenter)
    }
}
#endif
