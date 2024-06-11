//
//  TumokModel.swift
//  LetsPlay
//
//  Created by John Yun on 6/11/24.
//

import Foundation

struct GameModel {
    var board: [[Int]]
    var currentPlayer: Int
    var playerName: [Int: String]
    
    init(boardSize: Int, player1Name: String, player2Name: String) {
        self.board = Array(repeating: Array(repeating: 0, count: boardSize), count: boardSize)
        self.currentPlayer = 1
        self.playerName = [1: player1Name, 2: player2Name]
    }
    
    mutating func resetGame(boardSize: Int) {
        self.board = Array(repeating: Array(repeating: 0, count: boardSize), count: boardSize)
        self.currentPlayer = 1
    }
    
    mutating func makeMove(at row: Int, col: Int) -> Bool {
        if board[row][col] == 0 {
            board[row][col] = currentPlayer
            return true
        }
        return false
    }
    
    func checkWin(row: Int, col: Int) -> Bool {
        return checkDirection(row: row, col: col, dRow: 0, dCol: 1) ||
        checkDirection(row: row, col: col, dRow: 1, dCol: 0) ||
        checkDirection(row: row, col: col, dRow: 1, dCol: 1) ||
        checkDirection(row: row, col: col, dRow: 1, dCol: -1)
    }
    
    func checkDirection(row: Int, col: Int, dRow: Int, dCol: Int) -> Bool {
        let player = board[row][col]
        let totalInDirection = countSameStoneInDirection(row: row, col: col, dRow: dRow, dCol: dCol, player: player)
        let totalInOppositeDirection = countSameStoneInDirection(row: row, col: col, dRow: -dRow, dCol: -dCol, player: player)
        
        let totalStones = totalInDirection + totalInOppositeDirection - 1
        
        return totalStones >= 5
    }
    
    func countSameStoneInDirection(row: Int, col: Int, dRow: Int, dCol: Int, player: Int) -> Int {
        var count = 1
        var r = row + dRow
        var c = col + dCol
        while r >= 0 && r < board.count && c >= 0 && c < board[r].count && board[r][c] == player {
            count += 1
            r += dRow
            c += dCol
        }
        return count
    }
}
