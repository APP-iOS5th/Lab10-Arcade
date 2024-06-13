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
        
        gameRestartButton = customButton(title: "RESTART")
        gameRestartButton.addTarget(self, action: #selector(gameRestartButtonTapped), for: .touchUpInside)
        view.addSubview(gameRestartButton)
        
        setDescription(title: resultLabel, body: "전장의 지배자 \(winnerName!)!")
        
        setupNavigationBar(title: "튜 목", leftButtonTitle: "게임목록", leftButtonAction: #selector(leftButtonTappedToList))
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gameRestartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
        navigationController?.setViewControllers([ViewController(), StartViewController()], animated: true)
    }
}
