//
//  AscendingNumModel.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/4/24.
//

import Foundation

struct AscendingNumModel {
    var numbers: [Int]
    var gridSize: Int
//    var currentNumber: Int
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
}
