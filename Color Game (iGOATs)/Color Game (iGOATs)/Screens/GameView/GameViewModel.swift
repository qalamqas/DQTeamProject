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
    @Published var pressedButtonIndex: Int?
    @Published var correctColor: Color?
    var temp: Set<Color> = []
    var temp2: Set<Color> = []
    var tempArray: [Color] = []
    var tempArray2: [Color] = []
    
    init(mode: Mode, difficulty: Difficulty, blindnessType: BlindnessType, router: Router) {
        self.router = router
        self.mode = mode
        self.difficulty = difficulty
        self.blindnessType = blindnessType

        startGame()
    }
    
    private func isCorrect(_ index: Int) -> Bool {
        let answer = Bool(colors.filter { $0 == colors[index] }.count > 1)
        if  answer {
            ifCorrectAnswer = 1
            correctColor = colors[index]
        } else { ifCorrectAnswer = 2 }
        pressedButtonIndex = index
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.startRound()
                }
            }
        } else {
            AudioServicesPlaySystemSound(1100)
        }
    }
    
    func colorMind(difficulty: Difficulty) -> [Color] {
        var set1: Set<Color> = []
        var set2: Set<Color> = []
        var set3: Set<Color> = []
        var set4: Set<Color> = []
//        var tempArray: [Color] = []
        
        while set1.count < 4 {
            set1.insert(Color.randomYellow())
        }
        
        while set2.count < 4 {
            set2.insert(Color.randomRed())
        }
        
        while set3.count < 4 {
            set3.insert(Color.randomBlue())
        }
        
        while set4.count < 4 {
            set4.insert(Color.randomGreen())
        }

        tempArray = Array(set1.union(set2).union(set3).union(set4))
        tempArray[14] = tempArray[15]
        tempArray.shuffle()
        return tempArray
    }
    
    func colorBlind(blindnessType: BlindnessType) -> [Color] {
        switch blindnessType {
        case .red_green:
            while temp.count < 8 {
                temp.insert(Color.randomRed())
            }
            tempArray = Array(temp)
            tempArray[7] = tempArray[6]
            
            while temp2.count < 8 {
                temp2.insert(Color.randomGreen())
            }

            tempArray2 = Array(temp2)
            
            for i in 0...7 {
                tempArray.append(tempArray2[i])
            }
            tempArray.shuffle()
            return tempArray
            
        case .blue_yellow:
            while temp.count < 8 {
                temp.insert(Color.randomBlue())
            }
            tempArray = Array(temp)
            tempArray[7] = tempArray[6]
            
            while temp2.count < 8 {
                temp2.insert(Color.randomYellow())
            }

            tempArray2 = Array(temp2)
            
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
