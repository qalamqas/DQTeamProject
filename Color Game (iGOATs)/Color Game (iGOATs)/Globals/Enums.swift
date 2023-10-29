//
//  Enums.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

enum Mode: CaseIterable, CustomStringConvertible {
    case colorMindGame
    case colorBlindTest
    
    var description: String {
        switch self {
        case .colorMindGame:
            return "Improve your Colormind"
        case .colorBlindTest:
            return "Find out if you are Colorblind"
        }
    }
    
    var descriptionScreen: String {
        switch self {
        case .colorMindGame:
            return "ColorMind test"
        case .colorBlindTest:
            return "Colorblind"
        }
    }
}

enum Difficulty: CaseIterable {
    case babyTime
    case easy
    case medium
    case hard
    
    var description: String {
        switch self {
        case .babyTime:
            return "Baby plays"
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
    }
}

enum BlindnessType: CaseIterable {
    case red_green
    case blue_yellow
    
    var description: String {
        switch self {
        case .red_green:
            return "Red-green"
        case .blue_yellow:
            return "Blue-yellow"
        }
    }
}

