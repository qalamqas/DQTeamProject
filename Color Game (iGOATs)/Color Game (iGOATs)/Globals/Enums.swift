//
//  Enums.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation
import SwiftUI

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
    case babyTime1
    case babyTime2
    case easy1
    case easy2
    case easy3
    case medium1
    case medium2
    case medium3
    case hard1
    case hard2
    case hard3
    
    var description: String {
        switch self {
        case .babyTime1, .babyTime2:
            return "Baby plays"
        case .easy1, .easy2, .easy3:
            return "Easy"
        case .medium1, .medium2, .medium3:
            return "Medium"
        case .hard1, .hard2, .hard3:
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

enum ShapeType {
    case heart
    case square
    case circle
}

