//
//  Enums.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation
import SwiftUI

enum Mode: CaseIterable, CustomStringConvertible, Codable {
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

enum Difficulty: CaseIterable, Codable {
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
        case .babyTime1:
            return "Baby - 1"
        case .babyTime2:
            return "Baby - 2"
        case .easy1:
            return "Easy - 1"
        case .easy2:
            return "Easy - 2"
        case .easy3:
            return "Easy - 3"
        case .medium1:
            return "Medium - 1"
        case .medium2:
            return "Medium - 2"
        case .medium3:
            return "Medium - 3"
        case .hard1:
            return "Hard - 1"
        case .hard2:
            return "Hard - 2"
        case .hard3:
            return "Hard - 3"
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

