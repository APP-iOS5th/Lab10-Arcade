//
//  ViewController.swift
//  Tumok
//
//  Created by John Yun on 6/5/24.
//

import UIKit

class StartViewController: UIViewController {
    private let gameStartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("게임 시작", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "시작화면"
        view.backgroundColor = .white
        view.addSubview(gameStartButton)
        
        NSLayoutConstraint.activate([
            gameStartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameStartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        gameStartButton.addTarget(self, action: #selector(gameStartButtonTapped), for: .touchUpInside)
    }
    
    @objc private func gameStartButtonTapped() {
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
}

