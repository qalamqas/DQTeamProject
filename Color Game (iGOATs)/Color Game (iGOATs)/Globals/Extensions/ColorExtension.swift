//
//  ColorExtension.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import Foundation
import SwiftUI

extension Color {
    static func random() -> Color {
        Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
