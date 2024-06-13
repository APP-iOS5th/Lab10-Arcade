//
//  AscendingNumbersViewModel.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/3/24.
//

import UIKit

class AscendingNumViewModel {
    
    var ascendingNumModel: AscendingNumModel
    private var timer: Timer?
    
    deinit {
        stopTimer()
    }
    
    var numbers: [Int] {
        return ascendingNumModel.numbers
    }
    
    var gridSize: Int {
        return ascendingNumModel.gridSize
    }
    
    var currentNumber: Int {
        return ascendingNumModel.currentNumber
    }
    
    init(gridSize: Int) {
        self.ascendingNumModel = AscendingNumModel(gridSize: gridSize)
    }
    
    func checkNumber(_ number: Int) -> Bool {
        if ascendingNumModel.isCorrectNumber(number) {
            ascendingNumModel.incrementCurrentNumber()
            return true
        }
        return false
    }
    
    func resetGame() {
        ascendingNumModel.resetGame()
    }
    
    func startGame() {
        ascendingNumModel.startGame()
        startTimer()
    }
    
    func endGame() {
        ascendingNumModel.endGame()
        stopTimer()
    }
    
//    var elapsedTime: TimeInterval? {
//        return ascendingNumModel.elapsedTime
//    }
    var elapsedTime: TimeInterval {
            return ascendingNumModel.elapsedTime
        }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateTimer() {
        NotificationCenter.default.post(name: .timeUpdated, object: nil)
    }
    
    func getFormattedTimeElapsed() -> String {
        return ascendingNumModel.formatTimeInterval(elapsedTime)
    }
}

extension Notification.Name {
    static let timeUpdated = Notification.Name("timeUpdated")
}
