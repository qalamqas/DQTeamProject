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
    @Published var columns = Array(repeating: GridItem(.fixed(60)), count: 4)
    var temp: Set<Color> = []
    var temp2: Set<Color> = []
    var tempArray: [Color] = []
    var tempArray2: [Color] = []
    
    @Published var shapeCount = 0 {
        didSet {
            print("shapeCount = \(shapeCount)")
        }
    }

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
        switch self.difficulty {
        case .babyTime1: shapeCount = 4; columns = Array(repeating: GridItem(.fixed(60)), count: 2)
        case .babyTime2: shapeCount = 9; columns = Array(repeating: GridItem(.fixed(60)), count: 3)
        case .easy1: shapeCount = 16; columns = Array(repeating: GridItem(.fixed(60)), count: 4)
        case .easy2: shapeCount = 20; columns = Array(repeating: GridItem(.fixed(60)), count: 4)
        case .easy3: shapeCount = 24; columns = Array(repeating: GridItem(.fixed(60)), count: 4)
        case .medium1: shapeCount = 16; columns = Array(repeating: GridItem(.fixed(60)), count: 4)
        case .medium2: shapeCount = 20; columns = Array(repeating: GridItem(.fixed(60)), count: 4)
        case .medium3: shapeCount = 24; columns = Array(repeating: GridItem(.fixed(60)), count: 4)
        case .hard1: shapeCount = 16; columns = Array(repeating: GridItem(.fixed(60)), count: 4)
        case .hard2: shapeCount = 20; columns = Array(repeating: GridItem(.fixed(60)), count: 4)
        case .hard3: shapeCount = 24; columns = Array(repeating: GridItem(.fixed(60)), count: 4)
        }
        
        self.ifCorrectAnswer = 0
        if self.mode == .colorBlindTest {
            colors = colorBlind(blindnessType: blindnessType)
        } else {
            colors = colorMind(difficulty: difficulty)
        }
    }
    
    func proceedUserInput(_ index: Int) {
        if isCorrect(index) {
            if difficulty != .hard3 {difficulty = difficulty.next()}
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
        var set0: Set<Color> = []
        var set1: Set<Color> = []
        var set2: Set<Color> = []
        var set3: Set<Color> = []
        var set4: Set<Color> = []
        let result: [Color]
 
        while set0.count < 12 {
            set0.insert(Color.random())
        }
        while set1.count < 12 {
            set1.insert(Color.randomYellow())
        }
        while set2.count < 12 {
            set2.insert(Color.randomRed())
        }
        while set3.count < 12 {
            set3.insert(Color.randomBlue())
        }
        while set4.count < 12 {
            set4.insert(Color.randomGreen())
        }
        
        switch difficulty {
        case .babyTime1: 
            tempArray = Array(set0.union(set1).union(set2).union(set3).union(set4));
            result = babyTime1(colors: tempArray)
        case .babyTime2: 
            tempArray = Array(set0.union(set1).union(set2).union(set3).union(set4));
            result = babyTime2(colors: tempArray)
        case .easy1: 
            tempArray = Array(set0.union(set1).union(set2).union(set3).union(set4));
            result = easy1(colors: tempArray)
        case .easy2: 
            tempArray = Array(set0.union(set1).union(set2).union(set3).union(set4));
            result = easy2(colors: tempArray)
        case .easy3: 
            tempArray = Array(set0.union(set1).union(set2).union(set3).union(set4));
            result = easy3(colors: tempArray)
        case .medium1: 
            tempArray = Array(set0.union(set1).union(set2).union(set3).union(set4));
            result = medium1(colors: tempArray)
        case .medium2: 
            tempArray = Array(set0.union(set1).union(set2).union(set3).union(set4));
            result = medium2(colors: tempArray)
        case .medium3: 
            tempArray = Array(set0.union(set1).union(set2).union(set3).union(set4));
            result = medium3(colors: tempArray)
        case .hard1: 
            tempArray = Array(set1.union(set2).union(set3));
            result = hard1(colors: tempArray)
        case .hard2: 
            tempArray = Array(set2.union(set3).union(set4));
            result = hard2(colors: tempArray)
        case .hard3: 
            tempArray = Array(set1.union(set4));
            result = hard3(colors: tempArray)
        }
        
        return result
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
    
    func babyTime1(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(4))
        temp.shuffle()
        temp[2] = temp[3]
        temp.shuffle()
        return temp
    }
    
    func babyTime2(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(9))
        temp.shuffle()
        temp[7] = temp[8]
        temp.shuffle()
        return temp
    }
    
    func easy1(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(16))
        temp.shuffle()
        temp[14] = temp[15]
        temp.shuffle()
        return temp
    }
    
    func easy2(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(20))
        temp.shuffle()
        temp[19] = temp[18]
        temp.shuffle()
        return temp
    }
    
    func easy3(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(24))
        temp.shuffle()
        temp[23] = temp[22]
        temp.shuffle()
        return temp
    }
    
    func medium1(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(16))
        temp.shuffle()
        temp[14] = temp[15]
        temp.shuffle()
        return temp
    }
    
    func medium2(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(20))
        temp.shuffle()
        temp[19] = temp[18]
        temp.shuffle()
        return temp
    }
    
    func medium3(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(24))
        temp.shuffle()
        temp[23] = temp[22]
        temp.shuffle()
        return temp
    }
    
    func hard1(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(16))
        temp.shuffle()
        temp[14] = temp[15]
        temp.shuffle()
        return temp
    }
    
    func hard2(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(20))
        temp.shuffle()
        temp[19] = temp[18]
        temp.shuffle()
        return temp
    }
    
    func hard3(colors: [Color]) -> [Color] {
        var temp = Array(colors.prefix(24))
        temp.shuffle()
        temp[23] = temp[22]
        temp.shuffle()
        return temp
    }

}
