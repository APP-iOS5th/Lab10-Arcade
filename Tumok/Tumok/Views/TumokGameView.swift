//
//  GameView.swift
//  Tumok
//
//  Created by John Yun on 6/5/24.
//

import UIKit
import Combine

class GameViewController: UIViewController {
    
    var board: [[UIButton]] = []
    var currentPlayer: Int = 1
    let boardSize = 9
    var winnerSubject = CurrentValueSubject<Int?, Never>(nil)
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupBoard()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        let leftButton = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    private func setupBoard() {
        clearBoard()
        
        let buttonSize = view.frame.width / CGFloat(boardSize)
        for i in 0..<boardSize {
            var row: [UIButton] = []
            for j in 0..<boardSize {
                let button = createBoardButton(row: i, col: j, size: buttonSize)
                view.addSubview(button)
                row.append(button)
            }
            board.append(row)
        }
    }
    
    private func clearBoard() {
        for row in board {
            for button in row {
                button.removeFromSuperview()
            }
        }
        board.removeAll()
    }
    
    private func createBoardButton(row: Int, col: Int, size: CGFloat) -> UIButton {
        let button = UIButton(frame: CGRect(x: CGFloat(col) * size, y: CGFloat(row) * size + 100, width: size, height: size))
        button.backgroundColor = .lightGray
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.tag = row * boardSize + col
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func leftButtonTapped() {
        navigationController?.pushViewController(StartViewController(), animated: true)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let row = sender.tag / boardSize
        let col = sender.tag % boardSize
        
        if sender.backgroundColor == .lightGray {
            updateBoardState(button: sender, row: row, col: col)
            if checkWin(row: row, col: col) {
                winnerSubject.send(currentPlayer == 1 ? 2 : 1)
                navigateToRestartViewController()
            }
        }
    }
    
    private func updateBoardState(button: UIButton, row: Int, col: Int) {
        if currentPlayer == 1 {
            button.backgroundColor = .black
            currentPlayer = 2
        } else {
            button.backgroundColor = .white
            currentPlayer = 1
        }
    }
    
    private func navigateToRestartViewController() {
        let restartViewController = RestartViewController()
        restartViewController.winnerPublisher = winnerSubject
        navigationController?.pushViewController(restartViewController, animated: true)
    }
    
    private func checkWin(row: Int, col: Int) -> Bool {
        return checkDirection(row: row, col: col, dRow: 0, dCol: 1) ||
        checkDirection(row: row, col: col, dRow: 1, dCol: 0) ||
        checkDirection(row: row, col: col, dRow: 1, dCol: 1) ||
        checkDirection(row: row, col: col, dRow: 1, dCol: -1)
    }
    
    private func checkDirection(row: Int, col: Int, dRow: Int, dCol: Int) -> Bool {
        var count = 1
        let color = board[row][col].backgroundColor
        
        count += countSameColorInDirection(row: row, col: col, dRow: dRow, dCol: dCol, color: color)
        count += countSameColorInDirection(row: row, col: col, dRow: -dRow, dCol: -dCol, color: color)
        
        return count >= 5
    }
    
    private func countSameColorInDirection(row: Int, col: Int, dRow: Int, dCol: Int, color: UIColor?) -> Int {
        var count = 0
        var r = row + dRow
        var c = col + dCol
        while r >= 0 && r < boardSize && c >= 0 && c < boardSize && board[r][c].backgroundColor == color {
            count += 1
            r += dRow
            c += dCol
        }
        return count
    }
    
    private func resetGame() {
        currentPlayer = 1
        setupBoard()
    }
}
