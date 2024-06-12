//
//  TumokRestartView.swift
//  LetsPlay
//
//  Created by John Yun on 6/11/24.
//

import UIKit
import Combine

class RestartViewController: UIViewController {
    
    var winnerPublisher: CurrentValueSubject<Int?, Never>?
    var winnerName: String?
    private var subscriptions = Set<AnyCancellable>()
    
    private var gameRestartButton: UIButton!
    
    private var resultLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        setBackground()
        
        gameRestartButton = customButton(title: "다시하기")
        gameRestartButton.addTarget(self, action: #selector(gameRestartButtonTapped), for: .touchUpInside)
        view.addSubview(gameRestartButton)
        
        setDescription(title: resultLabel, body: "전장의 지배자 \(winnerName!)!")
        
        setupNavigationBar(title: "게임 종료", leftButtonTitle: "돌아가기", leftButtonAction: #selector(leftButtonTappedToStart))
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gameRestartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameRestartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150)
        ])
    }
    
    private func setupBindings() {
        winnerPublisher?
            .sink { [weak self] _ in
                guard let self = self else { return }
                if let winnerName = self.winnerName {
                    resultLabel = "\(winnerName)의 승리입니다!"
                }
            }
            .store(in: &subscriptions)
    }
    
    @objc private func gameRestartButtonTapped() {
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
}
