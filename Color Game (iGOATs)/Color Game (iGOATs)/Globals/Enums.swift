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

enum ShapeType {
    case heart
    case square
    case circle
}

