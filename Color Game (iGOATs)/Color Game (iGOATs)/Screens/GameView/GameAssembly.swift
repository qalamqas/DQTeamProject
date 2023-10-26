//
//  GameAssembly.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

final class GameAssembly {
    func build() -> GameView {
        let router = Router.shared
        let viewModel = GameViewModel(router: router)
        return GameView(viewModel: viewModel)
    }
}
