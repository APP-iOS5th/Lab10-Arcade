//
//  GameView.swift
//  Tumok
//
//  Created by John Yun on 6/5/24.
//

import UIKit
import Combine

class GameViewController: UIViewController {
    
    private var board: [[UIButton]] = []
    private let boardSize = 9
    private var viewModel: GameViewModel!
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GameViewModel(boardSize: boardSize, player1Name: "Tuna", player2Name: "Mandu")
        setupView()
        setupBoard()
        bindViewModel()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupNavigationBar(title: "튜 목", leftButtonTitle: "돌아가기", leftButtonAction: #selector(leftButtonTapped))
    }
    
    private func setupBoard() {
        clearBoard()
        
        let buttonSize = view.frame.width / CGFloat(boardSize)
        for i in 0..<boardSize {
            var row: [UIButton] = []
            for j in 0..<boardSize {
                let button = createStone(row: i, col: j, size: buttonSize)
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
    
    private func createStone(row: Int, col: Int, size: CGFloat) -> UIButton {
        let button = UIButton(frame: CGRect(x: CGFloat(col) * size, y: CGFloat(row) * size + 100, width: size, height: size))
        button.backgroundColor = UIColor(named: "tumokColor")
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.tag = row * boardSize + col
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    private func bindViewModel() {
        viewModel.winnerSubject
            .sink { [weak self] winner in
                guard let self = self, let winner = winner else { return }
                let restartViewController = RestartViewController()
                restartViewController.winnerPublisher = self.viewModel.winnerSubject
                restartViewController.winnerName = self.viewModel.winnerName()
                self.navigationController?.pushViewController(restartViewController, animated: true)
            }
            .store(in: &subscriptions)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let row = sender.tag / boardSize
        let col = sender.tag % boardSize
        
        if sender.backgroundColor == UIColor(named: "tumokColor") {
            updateBoardState(button: sender, row: row, col: col)
            if viewModel.makeMove(at: row, col: col) {
                updateBoard()
                title = "튜 목 - \(viewModel.currentPlayerName()) 차례"
            }
        }
    }
    
    private func updateBoardState(button: UIButton, row: Int, col: Int) {
        if viewModel.currentPlayer() == 1 {
            button.setBackgroundImage(UIImage(named: "pepe"), for: .normal)
        } else {
            button.setBackgroundImage(UIImage(named: "mandu"), for: .normal)
        }
        button.backgroundColor = .clear
    }
    
    private func updateBoard() {
        for i in 0..<boardSize {
            for j in 0..<boardSize {
                let button = board[i][j]
                switch viewModel.board()[i][j] {
                case 1:
                    button.setBackgroundImage(UIImage(named: "pepe"), for: .normal)
                case 2:
                    button.setBackgroundImage(UIImage(named: "mandu"), for: .normal)
                default:
                    button.setBackgroundImage(nil, for: .normal)
                    button.backgroundColor = UIColor(named: "tumokColor")
                }
            }
        }
    }
}
