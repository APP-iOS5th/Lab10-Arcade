//
//  AscendingNumModel.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/4/24.
//

import Foundation

struct AscendingNumModel {
    let gridSize: Int
    var numbers: [Int]
    var currentIndex = 0
    var startTime: Date?
    var endTime: Date?
    
    init(gridSize: Int) {
        self.gridSize = gridSize
        self.numbers = Array(1...gridSize*gridSize).shuffled()
    }
    
    mutating func checkNumber(_ number: Int) -> Bool {
        guard currentIndex < numbers.count else { return false }
        
        if numbers[currentIndex] == number {
            currentIndex += 1
            return true
        } else {
            return false
        }
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
