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
    var subscriptions = Set<AnyCancellable>()
    
    // UI 요소 초기화
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
        title = "다시하기 화면"
        view.backgroundColor = .white
        
        // 네비게이션 바 커스텀 버튼 설정
        let leftButton = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton
        
        // UI 요소 추가
        view.addSubview(gameRestartButton)
        view.addSubview(resultLabel)
        
        // 버튼 액션 추가
        gameRestartButton.addTarget(self, action: #selector(gameRestartButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        // 제약 조건 설정
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
        // Combine 바인딩 설정
        winnerPublisher?
            .sink { [weak self] winner in
                self?.resultLabel.text = "Winner is Player \(winner ?? 0)"
            }
            .store(in: &subscriptions)
    }
    
    @objc private func leftButtonTapped() {
        // 커스텀 버튼 액션
        navigationController?.pushViewController(StartViewController(), animated: true)
    }
    
    @objc private func gameRestartButtonTapped() {
        // 게임 다시 시작 버튼 액션
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
}
