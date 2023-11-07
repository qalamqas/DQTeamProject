//
//  SettingsViewAssembly.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

final class SettingsAssembly {
    func build() -> SettingsView {
        let router = Router.shared
        let viewModel = SettingsViewModel(router: router)
        return SettingsView(viewModel: viewModel)
    }
}
