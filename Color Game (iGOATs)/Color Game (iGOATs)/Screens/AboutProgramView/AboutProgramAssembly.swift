//
//  AboutProgramAssembly.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

final class AboutProgramAssembly {
    func build() -> AboutProgramView {
        let router = Router.shared
        let viewModel = AboutProgramViewModel(router: router)
        return AboutProgramView(viewModel: viewModel)
    }
}
