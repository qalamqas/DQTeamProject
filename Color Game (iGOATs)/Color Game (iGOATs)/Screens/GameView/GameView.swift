//
//  GameView.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    
    @State var heartSelected = false
    @State var squareSelected = true
    @State var circleSelected = false
    
    private let columns = Array(repeating: GridItem(.fixed(60)), count: 4)
    
    var body: some View {
        LazyVStack {
            Text("Mode: \(viewModel.mode.description)")
                .bold()
                .padding(.bottom, 25)
            
            LazyVGrid(columns: columns) {
                ForEach(0...15, id: \.self) { index in
                    Button("") {
                        viewModel.proceedUserInput(index)
                    }
                    .buttonStyle(ColorButtonStyle(background: viewModel.colors[index], shapeType: viewModel.buttonShape, isBorder: false))
                }
            }
            LazyHStack {
                Button(action: {
                    heartSelected.toggle()
                    squareSelected = false
                    circleSelected = false
                    viewModel.buttonShape = .heart
                }) {
                    Image(systemName: heartSelected ? "heart.fill" : "heart")
                }
                Button(action: {
                    squareSelected.toggle()
                    heartSelected = false
                    circleSelected = false
                    viewModel.buttonShape = .square
                }) {
                    Image(systemName: squareSelected ? "square.fill" : "square")
                }
                Button(action: {
                    circleSelected.toggle()
                    heartSelected = false
                    squareSelected = false
                    viewModel.buttonShape = .circle
                }) {
                    Image(systemName: circleSelected ? "circle.fill" : "circle")
                }
            }
        }
    }
}

//#Preview {
//    GameAssembly().build(for: .colorMindGame, difficulty: .easy, blindnessType: .blue_yellow)
//}
