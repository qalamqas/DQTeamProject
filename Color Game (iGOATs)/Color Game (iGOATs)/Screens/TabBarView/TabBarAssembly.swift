//
//  TabBarAssembly.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

final class TabBarAssembly {
    func build() -> TabBarView {
        let router = Router.shared
        let viewModel = TabBarViewModel(router: router)
        return TabBarView(viewModel: viewModel)
    }
}
