//
//  SettingsView.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var presenter: SettingsPresenter
    var interactor: SettingsInteractoring?

    var body: some View {
        VStack(spacing: 30) {
            Text(presenter.status)
            Button {
                interactor?.onReorder()
            } label: {
                Text("Reorder")
            }
            .buttonStyle(.borderedProminent)

        }
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = SettingsPresenter(status: "A - B - C")
        SettingsView(presenter: presenter)
    }
}
#endif
