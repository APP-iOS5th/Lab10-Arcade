//
//  AscendingNumbersViewModel.swift
//  AscendingNumbers
//
//  Created by JIHYE SEOK on 6/3/24.
//

import UIKit

class AscendingNumViewModel {
    
    var ascendingNumModel: AscendingNumModel
    
    init(gridSize: Int) {
        self.ascendingNumModel = AscendingNumModel(gridSize: gridSize)
    }
    
    func checkNumber(_ number: Int) -> Bool {
        return ascendingNumModel.checkNumber(number)
    }
    
    func startGame() {
        ascendingNumModel.startGame()
    }
    
    func endGame() {
        ascendingNumModel.endGame()
    }
    
    var elapsedTime: TimeInterval? {
        return ascendingNumModel.elapsedTime
    }
    
    func selectGameSize(_ gridSize: Int) {
        ascendingNumModel = AscendingNumModel(gridSize: gridSize)
    }
}
