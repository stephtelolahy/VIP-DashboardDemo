//
//  SettingsView.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 11/03/2023.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var presenter: SettingsPresenter
    let interactor: SettingsInteractoring?

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("\(presenter.position)/\(presenter.count)")
                    .font(.system(size: 64))
                Button {
                    interactor?.onReorder()
                } label: {
                    Text("Reorder")
                }
                .buttonStyle(.borderedProminent)

            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = SettingsPresenter()
        SettingsView(presenter: presenter, interactor: nil)
    }
}
