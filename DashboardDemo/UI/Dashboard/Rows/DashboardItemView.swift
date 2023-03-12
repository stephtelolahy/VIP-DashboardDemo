//
//  DashboardItemView.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import SwiftUI

struct DashboardItemView: View {
    let item: DashboardItem
    var action: (() -> Void)?

    var body: some View {
        HStack {
            Text(item.rawValue)
            Spacer()
            Button {
                action?()
            } label: {
                Image(systemName: "info.circle")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

#if DEBUG
struct DashboardItemView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardItemView(item: .item1)
    }
}
#endif
