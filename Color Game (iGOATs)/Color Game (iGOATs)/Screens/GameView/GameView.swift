//
//  GameView.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    @ObservedObject var ViewModel: GameViewModel
    
    @State var heartSelected = false
    @State var squareSelected = true
    @State var circleSelected = false
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            LazyVStack {
                Text("Mode: \(gameViewModel.mode.descriptionScreen)")
                    .bold()
                    .font(.title)
                
                if gameViewModel.mode == .colorMindGame { Text("Difficulty: \(gameViewModel.difficulty.description)")
                        .bold()
                        .padding(.bottom, 5)
                }
                if gameViewModel.mode == .colorBlindTest { Text("Blindness type: \(gameViewModel.blindnessType.description)")
                        .bold()
                        .padding(.bottom, 5)
                }
                VStack() {
                    Text("Round: \(gameViewModel.wonRounds)")
                        .font(.headline)
                    if gameViewModel.mode == .colorMindGame {
                        Text("Time: \(gameViewModel.timeRemaining) sec")
                            .foregroundColor(Color(red: 1, green: 0.25, blue: 0.25))
                            .bold(true)
                            .onReceive(gameViewModel.timer) { _ in
                                if !gameViewModel.isTimeFrozen {
                                    if gameViewModel.timeRemaining > 0 {
                                        gameViewModel.timeRemaining -= 1
                                    }
                                    else if gameViewModel.timeRemaining == 0 {
                                        gameViewModel.timer = Timer.publish(every: .infinity, on: .main, in: .common).autoconnect()
                                        gameViewModel.showAlert(
                                            title: "Time's Up!",
                                            message: "Choose an option",
                                            primaryActionTitle: "Restart",
                                            secondaryActionTitle: "Main Menu",
                                            primaryAction: {
                                                gameViewModel.restartGame()
                                            },
                                            secondaryAction: {
                                                gameViewModel.returnToMainMenu()
                                            }
                                        )
                                    }
                                }
                            }
                    }
                    Text("Streak: \(gameViewModel.streak)")
                    LazyVGrid(columns: gameViewModel.columns) {
                        
                        ForEach(0...gameViewModel.shapeCount - 1, id: \.self) { index in
                            Button("") {
                                gameViewModel.proceedUserInput(index)
                            }
                            .buttonStyle(ColorButtonStyle(background: gameViewModel.colors[index], shapeType: gameViewModel.buttonShape, isBorder: false))
                            .overlay { if index == gameViewModel.pressedButtonIndex {
                                switch gameViewModel.ifCorrectAnswer {
                                case 0: Text("")
                                case 1: Text("❤️")
                                case 2: Text("💔")
                                default: Text("")
                                }
                            } else { Text("") }
                            }
                            .overlay {
                                if gameViewModel.ifCorrectAnswer == 1 {
                                    if gameViewModel.colors[index] == gameViewModel.correctColor {
                                        Text("❤️")
                                    }
                                }
                            }
                            .disabled(gameViewModel.ifCorrectAnswer == 1)
                        }
                    }
                    HStack {
                        HStack {
                            Button(action: {
                                heartSelected.toggle()
                                squareSelected = false
                                circleSelected = false
                                gameViewModel.buttonShape = .heart
                            }) {
                                Image(systemName: heartSelected ? "heart.fill" : "heart")
                            }
                            Button(action: {
                                squareSelected.toggle()
                                heartSelected = false
                                circleSelected = false
                                gameViewModel.buttonShape = .square
                            }) {
                                Image(systemName: squareSelected ? "square.fill" : "square")
                            }
                            Button(action: {
                                circleSelected.toggle()
                                heartSelected = false
                                squareSelected = false
                                gameViewModel.buttonShape = .circle
                            }) {
                                Image(systemName: circleSelected ? "circle.fill" : "circle")
                                
                            }
                        }
                        HStack {
                            ForEach(0..<gameViewModel.numberOfLives, id: \.self) { _ in
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color.red)
                            }
                        }
                        .padding()
                    }
                }
                .background(
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    })
            }
        }
        .alert(item: $gameViewModel.alert) { alert in
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
