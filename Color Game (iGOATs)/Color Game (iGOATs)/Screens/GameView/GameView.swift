//
//  GameView.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel

    private let columns = Array(repeating: GridItem(.fixed(60)), count: 4)
    
    var body: some View {
        VStack {
            Text("Mode: \(viewModel.mode.descriptionScreen)")
                .bold()
                .padding(.bottom, 7)
            if viewModel.mode == .colorMindGame { Text("Difficalty: \(viewModel.difficulty.description)")
                    .bold()
                .padding(.bottom, 7)}
            if viewModel.mode == .colorBlindTest {Text("Blindness type: \(viewModel.blindnessType.description)")
                    .bold()
                .padding(.bottom, 7)}

            LazyVGrid(columns: columns) {
                ForEach(0...15, id: \.self) { index in
                    Button("") {
                        viewModel.proceedUserInput(index)
                    }
                    .buttonStyle(ColorButtonStyle(background: viewModel.colors[index]))
                    .overlay{
                        if viewModel.correctAnswer {
                            Text("❤️")} else {
                                Text("💔")
                            }
                    }
                }
            }
        }
    }
}

//#Preview {
//    GameAssembly().build(for: .colorMindGame, difficulty: .easy, blindnessType: .blue_yellow)
//}
