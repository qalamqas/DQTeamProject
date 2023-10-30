//
//  GameModel.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import SwiftUI
import AVFoundation

class GameViewModel: ObservableObject {
    private let router: Router
    
    private var gameView: GameView?
    
    @State private var player: AVAudioPlayer?
    
    @Published var colors: [Color] = []
    @Published var mode: Mode
    @Published var difficulty: Difficulty
    @Published var blindnessType: BlindnessType
    @Published var isBorder: Bool = false
    @Published var buttonShape: ShapeType = .square
    @Published var ifCorrectAnswer = 0
    @Published var correctButtonIndex: Int?
    
    init(mode: Mode, difficulty: Difficulty, blindnessType: BlindnessType, router: Router) {
        self.router = router
        self.mode = mode
        self.difficulty = difficulty
        self.blindnessType = blindnessType
        
        print("MODE: \(mode)")
        print("DIFFICULTY: \(difficulty)")
        print("BLINDNESS_TYPE: \(blindnessType)")
        
        startGame()
    }
    
    private func isCorrect(_ index: Int) -> Bool {
        let answer = Bool(colors.filter { $0 == colors[index] }.count > 1)
        if  answer {
            ifCorrectAnswer = 1} else {
                ifCorrectAnswer = 2 }
        correctButtonIndex = index
        return answer
    }
    
    func startGame() {
        startRound()
    }
    
    func startRound() {
        self.ifCorrectAnswer = 0
        if self.mode == .colorBlindTest {
            colors = colorBlind(blindnessType: blindnessType)
        } else {
            colors = colorMind(difficulty: difficulty)
        }
    }
    
    func proceedUserInput(_ index: Int) {
        if isCorrect(index) {
            if difficulty != .hard {difficulty = difficulty.next()}
            AudioServicesPlaySystemSound(1109)
            withAnimation(.bouncy(duration: 0.2, extraBounce: 0.2)) {
                startRound()
                print("MODE: \(mode)")
                print("DIFFICULTY: \(difficulty)")
                print("BLINDNESS_TYPE: \(blindnessType)")
            }
        } else {
            AudioServicesPlaySystemSound(1100)
        }
    }
    
    func colorMind(difficulty: Difficulty) -> [Color] {
        var temp: Set<Color> = []
        var tempArray: [Color] = []
        
        while temp.count < 16 {
            temp.insert(Color(red: .random(in: 0.1...0.9),
                              green: .random(in: 0.1...0.9),
                              blue: .random(in: 0.1...0.9)))
        }
        
        tempArray = Array(temp)
        tempArray[14] = tempArray[15]
        tempArray.shuffle()
        return tempArray
    }
    
    func colorBlind(blindnessType: BlindnessType) -> [Color] {
        var temp: Set<Color> = []
        var temp2: Set<Color> = []
        var tempArray: [Color] = []
        var tempArray2: [Color] = []
        
        switch blindnessType {
        case .red_green:
            while temp.count < 9 {
                temp.insert(Color(red: .random(in: 0.6...0.9),
                                  green: .random(in: 0.1...0.3),
                                  blue: .random(in: 0.2...0.33)))
            }
            
            tempArray = Array(temp)
            tempArray[6] = tempArray[7]
            
            while temp2.count < 9 {
                temp2.insert(Color(red: .random(in: 0.1...0.4),
                                   green: .random(in: 0.5...0.9),
                                   blue: .random(in: 0.2...0.5)))
            }
            
            tempArray2 = Array(temp2)
            tempArray2[6] = tempArray2[7]
            for i in 0...7 {
                tempArray.append(tempArray2[i])
            }
            tempArray.shuffle()
            return tempArray
            
        case .blue_yellow:
            while temp.count < 9 {
                temp.insert(Color(red: .random(in: 0.1...0.4),
                                  green: .random(in: 0.1...0.4),
                                  blue: .random(in: 0.6...1)))
            }
            
            tempArray = Array(temp)
            tempArray[6] = tempArray[7]
            
            while temp2.count < 9 {
                temp2.insert(Color(red: .random(in: 0.9...1),
                                   green: .random(in: 0.6...0.9),
                                   blue: .random(in: 0.0...0.5)))
            }
            
            tempArray2 = Array(temp2)
            tempArray2[6] = tempArray2[7]
            for i in 0...7 {
                tempArray.append(tempArray2[i])
            }
             tempArray.shuffle()
             return tempArray
            }
    }
    
    func changeForm() {
        if let gameView = gameView {
            if gameView.heartSelected {
                buttonShape = .heart
                isBorder = true
            } else if gameView.squareSelected {
                buttonShape = .square
                isBorder = true 
            } else if gameView.circleSelected {
                buttonShape = .circle
                isBorder = true
            } else {
                isBorder = false
            }
        }
    }
}
