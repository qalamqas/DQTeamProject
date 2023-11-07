//
//  ProfileViewModel.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 26.10.2023.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
}

extension UserDefaults {
    static let playerNameKey = "PlayerName"
    static let profileImageKey = "ProfileImage"
    
    func setPlayerName(_ name: String) {
        set(name, forKey: UserDefaults.playerNameKey)
    }
    
    func getPlayerName() -> String? {
        return string(forKey: UserDefaults.playerNameKey)
    }
    
    func setProfileImage(_ image: Data) {
        set(image, forKey: UserDefaults.profileImageKey)
    }
    
    func getProfileImage() -> Data? {
        return data(forKey: UserDefaults.profileImageKey)
    }
}
