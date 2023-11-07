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
    @State private var difficulty: Difficulty = .easy1
    @State private var blindnessType: BlindnessType = .blue_yellow
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                LazyVStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(red: 0.988281, green: 0.855469, blue: 0.867188))
                    Spacer()
                        .frame(height: 5)
                    
                    Text("Challenge your color vision.")
                        .foregroundColor(Color(red: 0.988281, green: 0.855469, blue: 0.867188))
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
                                Text(mode.description)
                                    .fixedSize(horizontal: true, vertical: true)
                            }
                            Spacer()
                            Text(">")
                            Spacer()
                                .frame(width: 60)
                        }
                        }
                    }
                    .frame(width: 350, height: 80)
                    .background(.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    
                    Button(action: {
                        viewModel.difficulty = viewModel.difficulty.next()
                    }) {
                        HStack {
                            Spacer()
                            VStack {
                                Text(self.difficultyDescription(for: viewModel.difficulty))
                                    .font(.headline)
                                    .fixedSize(horizontal: true, vertical: true)
                                Text(viewModel.difficulty.description)
                                    .fixedSize(horizontal: true, vertical: true)
                            }
                            Spacer()
                            Text(">")
                            Spacer()
                                .frame(width: 60)
                        }
                    }
                    .frame(width: 350, height: 80)
                    .background(.mint)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .disabled(viewModel.mode == .colorBlindTest ? true : false)
                    .opacity(viewModel.mode == .colorBlindTest ? 0.25 : 1)
                    
                    Button(action: {
                        viewModel.blindnessType = viewModel.blindnessType.next()
                    }) {
                        HStack {
                            Spacer()
                            VStack {
                                Text(self.blindnessTypeText(for: viewModel.blindnessType))
                                    .font(.headline)
                                    .fixedSize(horizontal: true, vertical: true)
                                Text(self.blindnessTypeDescription(for: viewModel.blindnessType))
                                    .fixedSize(horizontal: true, vertical: true)
                            }
                            Spacer()
                            Text(">")
                            Spacer()
                                .frame(width: 60)
                        }
                    }
                    .frame(width: 350, height: 80)
                    .background(.green)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .disabled(viewModel.mode == .colorMindGame ? true : false)
                    .opacity(viewModel.mode == .colorMindGame ? 0.25 : 1)
                    
                    
                    Button(action: {
                        //settingsViewModel.gamesPlayed += 1
                        Router.shared.showGameView(mode: viewModel.mode, difficulty: viewModel.difficulty, blindnessType: viewModel.blindnessType)
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
    }
    
    private func modeText(for mode: Mode) -> String {
        switch mode {
        case .colorMindGame:
            return "Game mode"
        case .colorBlindTest:
            return "Colorblind testing mode"
        }
    }
    
//    private func difficultyText(for difficulty: Difficulty) -> String {
//        switch difficulty {
//        case .babyTime1, .babyTime2: return "Babytime"
//        case .easy1, .easy2, .easy3:
//            return "Easy"
//        case .medium1, .medium2, .medium3:
//            return "Medium"
//        case .hard1, .hard2, .hard3:
//            return "Hard"
//        }
//    }
    
    private func difficultyDescription(for difficulty: Difficulty) -> String {
        return "Choose difficulty level"
    }
    
    private func blindnessTypeText(for blindnessType: BlindnessType) -> String {
        switch blindnessType {
        case .blue_yellow: return "Blue-yellow"
        case .red_green:
            return "Red-green"
        }
    }
    
    private func blindnessTypeDescription(for blindnessType: BlindnessType) -> String {
        return "Choose blindness type"
    }
}
    
//struct Settings_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsAssembly().build()
//    }
//}


