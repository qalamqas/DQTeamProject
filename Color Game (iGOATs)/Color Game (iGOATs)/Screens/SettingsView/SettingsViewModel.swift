//
//  SettingsViewModel.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    private let router: Router
    @Published var gamesPlayed: Int {
        didSet {
            UserDefaults.standard.set(gamesPlayed, forKey: "gamesPlayed")
            UserDefaults.standard.synchronize()
        }
    }
    
    init(router: Router) {
           self.gamesPlayed = UserDefaults.standard.integer(forKey: "gamesPlayed")
           self.router = router
       }
}
