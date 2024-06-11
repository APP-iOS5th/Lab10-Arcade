//
//  TumokViewModel.swift
//  Tumok
//
//  Created by John Yun on 6/11/24.
//

import Foundation
import Combine

class GameViewModel {
    @Published private(set) var gameModel: GameModel
    let winnerSubject = CurrentValueSubject<Int?, Never>(nil)
    
    init(boardSize: Int, player1Name: String, player2Name: String) {
        self.gameModel = GameModel(boardSize: boardSize, player1Name: player1Name, player2Name: player2Name)
    }
    
    func resetGame() {
        gameModel.resetGame(boardSize: gameModel.board.count)
    }
    
    func makeMove(at row: Int, col: Int) -> Bool {
        if gameModel.makeMove(at: row, col: col) {
            if gameModel.checkWin(row: row, col: col) {
                winnerSubject.send(gameModel.board[row][col])
                return true
            }
            
            gameModel.currentPlayer = gameModel.currentPlayer == 1 ? 2 : 1
            return true
        }
        return false
    }
    
    func currentPlayer() -> Int {
        return gameModel.currentPlayer
    }
    
    func currentPlayerName() -> String {
        return gameModel.playerName[gameModel.currentPlayer] ?? "Unknown"
    }
    
    func winnerName() -> String {
        guard let winner = winnerSubject.value else { return "No Winner" }
        return gameModel.playerName[winner] ?? "Unknown"
    }
    
    func board() -> [[Int]] {
        return gameModel.board
    }
}
