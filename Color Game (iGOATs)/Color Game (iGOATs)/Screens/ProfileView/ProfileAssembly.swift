//
//  ProfileAssembly.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

final class ProfileAssembly {
    func build() -> ProfileView {
        let router = Router.shared
        let viewModel = ProfileViewModel(router: router)
        let gameViewModel = GameViewModel(mode: .colorMindGame, difficulty: .babyTime1, blindnessType: .blue_yellow, router: router)
        return ProfileView(viewModel: viewModel, gameViewModel: gameViewModel)
    }
}
