//
//  ContentView.swift
//  Color Game (iGOATs)
//
//  Created by Bekpayev Dias on 03.10.2023.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @State private var mode: Mode = .colorMindGame
    @State private var difficulty: Difficulty = .easy
    @State private var blindnessType: BlindnessTypes = .blue_yellow
    
    var body: some View {
        NavigationView {
            LazyVStack {
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                    .frame(height: 5)
                
                Text("Challenge your color vision.")
                Spacer()
                    .frame(height: 40)
                
                Button(action: {
                    mode = mode.next()
                }) {
                    HStack{
                        Spacer()
                        VStack {
                            Text(self.modeText(for: mode))
                                .font(.headline)
                                .fixedSize(horizontal: true, vertical: true)
                            Text(self.modeDescription(for: mode))
                                .fixedSize(horizontal: true, vertical: true)
                        }
                        Spacer()
                        Text(">")
                        Spacer()
                            .frame(width: 60)
                    }
                }
                .frame(width: 350, height: 80)
                .background(.gray)
                .foregroundColor(.black)
                .cornerRadius(20)
                
                Button(action: {
                    difficulty = difficulty.next()
                }) {
                    HStack {
                        Spacer()
                        VStack {
                            Text(self.difficultyText(for: difficulty))
                                .font(.headline)
                                .fixedSize(horizontal: true, vertical: true)
                            Text(self.difficultyDescription(for: difficulty))
                                .fixedSize(horizontal: true, vertical: true)
                        }
                        Spacer()
                        Text(">")
                        Spacer()
                            .frame(width: 60)
                    }
                }
                .frame(width: 350, height: 80)
                .background(.gray)
                .foregroundColor(.black)
                .cornerRadius(20)
                
                Button(action: {
                    blindnessType = blindnessType.next()
                }) {
                    HStack {
                        Spacer()
                        VStack {
                            Text(self.blindnessTypeText(for: blindnessType))
                                .font(.headline)
                                .fixedSize(horizontal: true, vertical: true)
                            Text(self.blindnessTypeDescription(for: blindnessType))
                                .fixedSize(horizontal: true, vertical: true)
                        }
                        Spacer()
                        Text(">")
                        Spacer()
                            .frame(width: 60)
                    }
                }
                .frame(width: 350, height: 80)
                .background(.gray)
                .foregroundColor(.black)
                .cornerRadius(20)
                
                
                Button(action: {
                    Router.shared.showGameView(mode: mode, difficulty: difficulty, blindnessType: blindnessType)
                }) {
                    HStack{
                        Text("GO")
                    }
                }
                .buttonStyle(.borderedProminent)
                .frame(width: 350, height: 70)
                .cornerRadius(20)
            }
        }
    }
    
    
    private func modeText(for mode: Mode) -> String {
        switch mode {
        case .colorMindGame:
            return "Game mode"
        case .colorBlindTest:
            return "Colorblind testing mode"
        }
    }
    
    private func modeDescription(for mode: Mode) -> String {
        switch mode {
        case .colorMindGame:
            return "Improve your Colormind"
        case .colorBlindTest:
            return "Find out if you are colorblind"
        }
    }
    
    private func difficultyText(for difficulty: Difficulty) -> String {
        switch difficulty {
        case .babyTime: return "Babytime"
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
    }
    
    private func difficultyDescription(for difficalty: Difficulty) -> String {
        return "Choose difficalty level"
    }
    
    private func blindnessTypeText(for blindnessType: BlindnessTypes) -> String {
        switch blindnessType {
        case .blue_yellow: return "Blue-yellow"
        case .red_green:
            return "Red-green"
        }
    }
    
    private func blindnessTypeDescription(for blindnessType: BlindnessTypes) -> String {
        return "Choose blindness type"
    }
}
    
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsAssembly().build()
//    }
//}


