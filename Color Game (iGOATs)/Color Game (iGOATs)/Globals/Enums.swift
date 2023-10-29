//
//  Enums.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

enum Mode: CaseIterable {
    case colorMindGame
    case colorBlindTest
}

enum Difficulty: CaseIterable {
    case babyTime
    case easy
    case medium
    case hard
}

enum BlindnessType: CaseIterable {
    case red_green
    case blue_yellow
}

