//
//  AscendingNumModel.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/4/24.
//

import UIKit

struct AscendingNumModel {
    var numbers: [Int]
    var gridSize: Int
    var startTime: Date?
    var endTime: Date?
    var isSelected: Bool
    private var timeElapsed: TimeInterval = 0
    private(set) var currentNumber: Int
    
    init(gridSize: Int) {
        self.gridSize = gridSize
        self.numbers = Array(1...(gridSize * gridSize)).shuffled()
        self.currentNumber = 1
        self.isSelected = false
    }
    
    func isCorrectNumber(_ number: Int) -> Bool {
        return number == currentNumber
    }
    
    mutating func incrementCurrentNumber() {
        currentNumber += 1
    }
    
    mutating func resetGame() {
        self.numbers = Array(1...(gridSize * gridSize)).shuffled()
        self.isSelected = false
        self.currentNumber = 1
    }
    
    mutating func startGame() {
        startTime = Date()
    }
    
    mutating func endGame() {
        endTime = Date()
    }
    
    var elapsedTime: TimeInterval {
        guard let start = startTime else { return timeElapsed }
        return Date().timeIntervalSince(start)
    }
    
    mutating func updateElapsedTime() {
        timeElapsed = elapsedTime
    }
    
    func formatTimeInterval(_ interval: TimeInterval) -> String {
        let minutes = Int(interval) / 60
        let seconds = Int(interval) % 60
        let milliseconds = Int((interval - TimeInterval(minutes * 60 + seconds)) * 100)
        return String(format: "%02d:%02d", seconds, milliseconds)
    }
    
}
