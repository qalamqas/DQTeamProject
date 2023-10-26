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
            Text("Level: \(viewModel.level)")
                .bold()
                .padding(.bottom, 25)
            
            LazyVGrid(columns: columns) {
                ForEach(0...15, id: \.self) { index in
                    Button("") {
                        viewModel.proceedUserInput(index)
                    }
                    .buttonStyle(ColorButtonStyle(background: viewModel.colors[index]))
                }
            }
        }
    }
}

#Preview {
    GameAssembly().build()
}
