//
//  GameAssembly.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

final class GameAssembly {
    func build(for mode: Mode, difficulty: Difficulty, blindnessType: BlindnessTypes) -> GameView {
        let router = Router.shared
        let viewModel = GameViewModel(mode: mode, difficulty: difficulty, blindnessType: blindnessType, router: router)
        return GameView(viewModel: viewModel)
    }
}
