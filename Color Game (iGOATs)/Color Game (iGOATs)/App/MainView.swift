//
//  MainView.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import SwiftUI

@main
struct InitView: App {
    
    @ObservedObject var router = Router.shared
    @StateObject var settingsViewModel = SettingsViewModel(router: Router.shared)
    @StateObject var gameViewModel = GameViewModel(mode: .colorMindGame, difficulty: .babyTime1, blindnessType: .blue_yellow, router: Router.shared)
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                TabBarAssembly().build()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .aboutProgram:
                            AboutProgramAssembly().build()
                        case .settings:
                            SettingsAssembly().build()
                        case .userProfile:
                            ProfileAssembly().build()
                        case .gameView(let mode, let difficulty, let blindnessType):
                            GameAssembly().build(for: mode, difficulty: difficulty, blindnessType: blindnessType)
                        case .tabBar:
                            TabBarAssembly().build()
                        }
                    }
                    .environmentObject(settingsViewModel)
            }
            .preferredColorScheme(.light)
            .environmentObject(settingsViewModel)
        }
    }
}

