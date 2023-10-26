//
//  GameModel.swift
//  Color Game (iGOATs)
//
//  Created by Каламкас on 24.10.2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var colors: [Color] = []
    @Published var level: Int = 1
    private let router: Router
    
    init(router: Router) {
        //colors = generateRandom(level: level)
        self.router = router
        colors = colorBlind(mode: level)
    }
    
    private func isCorrect(_ index: Int) -> Bool {
        colors.filter { $0 == colors[index] }.count > 1
    }
    
    func proceedUserInput(_ index: Int) {
        if isCorrect(index) {
            if level < 10 {level += 1} else { return }
            withAnimation(.bouncy(duration: 0.2, extraBounce: 0.2)) {
                colors = colorBlind(mode: level)
            }
        } else {
            // Делаем что-то если юзеер ошибся
        }
    }
    
//    func proceedUserInput(_ index: Int) {
//        if isCorrect(index) {
//            if level < 10 {level += 1} else { return }
//            withAnimation(.bouncy(duration: 0.2, extraBounce: 0.2)) {
//                colors = generateRandom(level: level)
//            }
//        } else {
//            // Делаем что-то если юзеер ошибся
//        }
//    }
    
//    func generateRandom(level: Int) -> [Color] {
//        var temp: Set<Color> = []
//        var tempArray: [Color] = []
//
//        while temp.count < 16 {
//            temp.insert(Color(red: .random(in: 0.1...0.9),
//                              green: .random(in: 0.1...0.9),
//                              blue: .random(in: 0.1...0.9)))
//        }
//
//        tempArray = Array(temp)
//        tempArray[14] = tempArray[15]
//        tempArray.shuffle()
//        return tempArray
//    }
    
    func colorBlind(mode: Int) -> [Color] {
        var temp: Set<Color> = []
        var temp2: Set<Color> = []
        var tempArray: [Color] = []
        var tempArray2: [Color] = []
        
        switch mode {
        case 1:
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
            return tempArray
//        case 2:
//            while temp.count < 16 {
//                temp.insert(Color(red: .random(in: 0.1...0.9),
//                                  green: .random(in: 0.1...0.9),
//                                  blue: .random(in: 0.1...0.9)))
//            }
//
//            tempArray = Array(temp)
//            tempArray[14] = tempArray[15]
//            tempArray.shuffle()
//            return tempArray
        default: return []
            }
    }
    
    
}

