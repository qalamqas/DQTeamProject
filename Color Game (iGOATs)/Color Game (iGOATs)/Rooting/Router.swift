//
//  Router.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import SwiftUI

final class Router: ObservableObject {
    static let shared = Router()
    
    @Published var path = [Route]()
    
    func showTabBar() {
        path.append(.tabBar)
    }
    
    func showAboutProgram() {
        path.append(.aboutProgram)
    }
    
    func showSettings() {
        path.append(.settings)
    }
    
    func showProfile() {
        path.append(.userProfile)
    }
    
    func showGameView(mode: Mode, difficulty: Difficulty, blindnessType: BlindnessType) {
        path.append(.gameView(mode: mode, difficulty: difficulty, blindnessType: blindnessType))
    }

}
