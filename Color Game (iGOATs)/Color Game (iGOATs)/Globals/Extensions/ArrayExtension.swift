//
//  ArrayExtension.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import Foundation

extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}
