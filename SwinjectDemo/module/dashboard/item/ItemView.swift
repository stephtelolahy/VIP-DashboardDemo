//
//  ItemView.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import SwiftUI

struct ItemView: View {
    let item: DashboardItem

    var body: some View {
        HStack {
            Text(item.rawValue)
            Spacer()
            Image(systemName: "info.circle")
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ItemView(item: .item1)
            ItemView(item: .item2)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
