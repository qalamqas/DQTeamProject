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
    @State var timeRemaining = 240
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
//    private let columns = Array(repeating: GridItem(.fixed(60)), count: 2)
    var body: some View {        
        ZStack {
            BackgroundView()
            VStack {
                ZStack {
                    Image("WhiteSquare")
                        .resizable()
                        .frame(height: 515)
                        .cornerRadius(30)
                    VStack {
                        if viewModel.mode == .colorMindGame {
                            Text("Time: \(timeRemaining) sec")
                                .foregroundColor(Color(red: 1, green: 0.25, blue: 0.25))
                                .bold(true)
                                .onReceive(timer) { _ in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    }
                                }
                        }
                        Text("Mode: \(viewModel.mode.descriptionScreen)")
                            .bold()
                            //.padding(.bottom, 7)
                        if viewModel.mode == .colorMindGame { Text("Difficulty: \(viewModel.difficulty.description)")
                                .bold()
                            .padding(.bottom, 5)
                        }
                        if viewModel.mode == .colorBlindTest {Text("Blindness type: \(viewModel.blindnessType.description)")
                                .bold()
                            .padding(.bottom, 5)
                        }
                        
//                        Spacer()
//                        .frame(height: 30)
                        LazyVGrid(columns: viewModel.columns) {
                            
                            ForEach(0...viewModel.shapeCount - 1, id: \.self) { index in
                                Button("") {
                                    viewModel.proceedUserInput(index)
                                }
                                .buttonStyle(ColorButtonStyle(background: viewModel.colors[index], shapeType: viewModel.buttonShape, isBorder: false))
                                .overlay { if index == viewModel.pressedButtonIndex {
                                    switch viewModel.ifCorrectAnswer {
                                    case 0: Text("")
                                    case 1: Text("❤️")
                                    case 2: Text("💔")
                                    default: Text("")
                                    }
                                } else { Text("") }
                                }
                                .overlay {
                                    if viewModel.ifCorrectAnswer == 1 {
                                        if viewModel.colors[index] == viewModel.correctColor {
                                            Text("❤️")
                                        }
                                    }
                                }
                                .disabled(viewModel.ifCorrectAnswer == 1)
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
                .frame(width: 300, height: 350)
            }
        }
    }
}



//struct AboutProgram_Previews: PreviewProvider {
//    static var previews: some View {
//        GameAssembly().build(for: .colorMindGame, difficulty: .easy, blindnessType: .blue_yellow)
//    }
//}
