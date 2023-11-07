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
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            LazyVStack {
                Text("Mode: \(viewModel.mode.descriptionScreen)")
                    .bold()
                    .font(.title)
                    .foregroundColor(Color(red: 0.988281, green: 0.855469, blue: 0.867188))
                
                if viewModel.mode == .colorMindGame { Text("Difficulty: \(viewModel.difficulty.description)")
                        .bold()
                        .padding(.bottom, 5)
                        .foregroundColor(Color(red: 0.988281, green: 0.855469, blue: 0.867188))
                }
                if viewModel.mode == .colorBlindTest { Text("Blindness type: \(viewModel.blindnessType.description)")
                        .bold()
                        .padding(.bottom, 5)
                        .foregroundColor(Color(red: 0.988281, green: 0.855469, blue: 0.867188))
                }
                VStack() {
                    Text("Round: \(viewModel.wonRounds)")
                        .font(.headline)
                    if viewModel.mode == .colorMindGame {
                        Text("Time: \(viewModel.timeRemaining) sec")
                            .foregroundColor(Color(red: 1, green: 0.25, blue: 0.25))
                            .bold(true)
                            .onReceive(viewModel.timer) { _ in
                                if !viewModel.isTimeFrozen {
                                    if viewModel.timeRemaining > 0 {
                                        viewModel.timeRemaining -= 1
                                    }
                                    else if viewModel.timeRemaining == 0 {
                                        viewModel.timer = Timer.publish(every: .infinity, on: .main, in: .common).autoconnect()
                                        viewModel.showAlert(
                                            title: "Time's Up!",
                                            message: "Choose an option",
                                            primaryActionTitle: "Restart",
                                            secondaryActionTitle: "Main Menu",
                                            primaryAction: {
                                                viewModel.restartGame()
                                            },
                                            secondaryAction: {
                                                viewModel.returnToMainMenu()
                                            }
                                        )
                                    }
                                }
                            }
                    }
                    Text("Streak: \(viewModel.streak)")
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
                    }
                    HStack {
                        HStack {
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
                        HStack {
                            ForEach(0..<viewModel.numberOfLives, id: \.self) { _ in
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color.red)
                            }
                        }
                        .padding()
                    }
                }

            }.frame(width: 300, height: 350)
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                primaryButton: .default(Text(alert.primaryActionTitle), action: alert.primaryAction),
                secondaryButton: .default(Text(alert.secondaryActionTitle), action: alert.secondaryAction)
            )
        }
    }
}






//struct AboutProgram_Previews: PreviewProvider {
//    static var previews: some View {
//        GameAssembly().build(for: .colorMindGame, difficulty: .babyTime1, blindnessType: .blue_yellow)
//    }
//}
