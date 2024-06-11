//
//  Restart.swift
//  Tumok
//
//  Created by John Yun on 6/10/24.
//

import UIKit
import Combine

class RestartViewController: UIViewController {
    
    var winnerPublisher: CurrentValueSubject<Int?, Never>?
    var winnerName: String?
    private var subscriptions = Set<AnyCancellable>()
    
    private let gameRestartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다시 하기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupBindings()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupNavigationBar(title: "게임 종료", leftButtonTitle: "돌아가기", leftButtonAction: #selector(leftButtonTapped))
        view.addSubview(gameRestartButton)
        view.addSubview(resultLabel)
        
        gameRestartButton.addTarget(self, action: #selector(gameRestartButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gameRestartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameRestartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: gameRestartButton.topAnchor, constant: -20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupBindings() {
        winnerPublisher?
            .sink { [weak self] _ in
                guard let self = self else { return }
                if let winnerName = self.winnerName {
                    self.resultLabel.text = "\(winnerName)의 승리입니다!"
                }
            }
            .store(in: &subscriptions)
    }
    
    @objc private func gameRestartButtonTapped() {
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
}
