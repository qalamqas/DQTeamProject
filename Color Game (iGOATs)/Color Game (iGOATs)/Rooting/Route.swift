//
//  Route.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import Foundation

enum Route: Hashable {
    case tabBar
    case aboutProgram
    case settings
    case userProfile
    case gameView(mode: Mode, difficulty: Difficulty)
}
