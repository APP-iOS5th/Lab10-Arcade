//
//  AscendingNumModel.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/4/24.
//

import UIKit

enum Games: String, CaseIterable {
    case tumok = "튜목"
    case matchImage = "짝꿍 찾기"
    case ascendingNum = "순서대로 얍얍"
    case rockSissorPaper = "가위바위보"
    
    func viewController() -> UIViewController {
        switch self {
        case .tumok:
            return StartViewController()
        case . matchImage:
            return MatchImageStartViewController()
        case .ascendingNum:
            return AscendingNumStartViewController()
        case .rockSissorPaper:
            return RockPaperScissorsViewController()
        }
    }
}

struct AscendingNumModel {
    var numbers: [Int]
    var gridSize: Int
    var startTime: Date?
    var endTime: Date?
    private(set) var currentNumber: Int
    
    init(gridSize: Int) {
        self.gridSize = gridSize
        self.numbers = Array(1...(gridSize * gridSize)).shuffled()
        self.currentNumber = 1
    }
    
    func isCorrectNumber(_ number: Int) -> Bool {
        return number == currentNumber
    }
    
    mutating func incrementCurrentNumber() {
        currentNumber += 1
    }
    
    mutating func resetGame() {
        self.numbers = Array(1...(gridSize * gridSize)).shuffled()
        self.currentNumber = 1
    }
    
    mutating func startGame() {
        startTime = Date()
    }
    
    mutating func endGame() {
        endTime = Date()
    }
    
    var elapsedTime: TimeInterval? {
        guard let start = startTime, let end = endTime else { return nil }
        return end.timeIntervalSince(start)
    }
}
