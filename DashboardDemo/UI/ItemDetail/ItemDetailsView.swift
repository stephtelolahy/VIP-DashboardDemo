//
//  ItemDetailsView.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import SwiftUI

struct ItemDetailsView: View {
    @ObservedObject var presenter: ItemDetailsPresenter
    var interactor: ItemDetailsInteracting?

    var body: some View {
        Text(presenter.title)
    }
}

#if DEBUG
struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = ItemDetailsPresenter(title: "My item")
        ItemDetailsView(presenter: presenter)
    }
}
#endif
