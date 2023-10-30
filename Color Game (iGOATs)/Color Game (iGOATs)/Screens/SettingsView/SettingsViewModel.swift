//
//  SettingsViewModel.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
}
