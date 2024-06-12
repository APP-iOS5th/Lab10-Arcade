//
//  TumokStartView.swift
//  LetsPlay
//
//  Created by John Yun on 6/11/24.
//

import UIKit

class StartViewController: UIViewController {
    
    private var gameStartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
    }
    
    private func setupView() {
        setBackground()
        
        gameStartButton = customButton(title: "게임 시작")
        gameStartButton.addTarget(self, action: #selector(gameStartButtonTapped), for: .touchUpInside)
        view.addSubview(gameStartButton)
        
        setupNavigationBar(title: "시작화면", leftButtonTitle: "게임목록", leftButtonAction: #selector(leftButtonTappedToList))
        setDescription(title: "튜 목", body: "페페돌 또는 만두돌을\n\n5개 연속으로 놓으면 승리합니다!")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gameStartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameStartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150)
        ])
    }
    
    @objc private func gameStartButtonTapped() {
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
    
}
