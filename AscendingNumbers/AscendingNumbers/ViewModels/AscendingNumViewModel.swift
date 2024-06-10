//
//  AscendingNumbersViewModel.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/3/24.
//

import UIKit

class AscendingNumViewModel {
    
    var ascendingNumModel: AscendingNumModel
        
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
}
