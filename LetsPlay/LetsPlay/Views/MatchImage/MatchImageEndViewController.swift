//
//  MatchImageEndViewController.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-07.
//

import UIKit

class MatchImageEndViewController: UIViewController {
    let gameInfoContainer = MatchImageInformation().gameInfoContainer
    let gameTitle = MatchImageInformation().gameTitle
    let gameDescription = MatchImageInformation().gameDescription
    let gamePlayTime = MatchImageInformation().gamePlayTime
    private var restartButton: UIButton!
    
    var difficulty = "쉬움"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "짝꿍 찾기"
        
        let navigationBarButtonItem = UIBarButtonItem(title: "게임목록", style: .plain, target: self, action: #selector(leftButtonTappedToList))
        navigationItem.setLeftBarButton(navigationBarButtonItem, animated: true)
        switch SharedData.shared.matchImageGame.matrix {
            case [3,2]:
                difficulty = "쉬움"
            case [3,4]:
                difficulty = "보통"
            case [3,6]:
                difficulty = "어려움"
            default:
                difficulty = "쉬움"
        }
        
        gameDescription.text = "난이도: \(difficulty)\n\n플레이 시간"
        gamePlayTime.text = SharedData.shared.matchImageGame.playedTime
        
        setBackground()
        restartButton = customButton(title: "RESTART")
        restartButton.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            if let navigationController = navigationController {
                let startViewController = MatchImageStartViewController()
                let viewController = ViewController()

                    navigationController.setViewControllers([viewController, startViewController], animated: true)
            }
            
        }, for: .touchUpInside)
        setupLayout()
    }
    
    private func setupLayout() {
        gameInfoContainer.addSubview(gameTitle)
        gameInfoContainer.addSubview(gameDescription)
        gameInfoContainer.addSubview(gamePlayTime)
        view.addSubview(gameInfoContainer)
        view.addSubview(restartButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            gameInfoContainer.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150),
            gameInfoContainer.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            gameInfoContainer.widthAnchor.constraint(equalToConstant: 298),
            gameInfoContainer.heightAnchor.constraint(equalToConstant: 208),
            gameTitle.topAnchor.constraint(equalTo: gameInfoContainer.topAnchor, constant: 30),
            gameTitle.centerXAnchor.constraint(equalTo: gameInfoContainer.centerXAnchor),
            gameDescription.leadingAnchor.constraint(equalTo: gameInfoContainer.leadingAnchor, constant: 40),
            gameDescription.trailingAnchor.constraint(equalTo: gameInfoContainer.trailingAnchor, constant: -40),
            gamePlayTime.topAnchor.constraint(equalTo: gameDescription.bottomAnchor),
            gamePlayTime.leadingAnchor.constraint(equalTo: gameInfoContainer.leadingAnchor, constant: 40),
            gamePlayTime.trailingAnchor.constraint(equalTo: gameInfoContainer.trailingAnchor, constant: -40),
            gamePlayTime.bottomAnchor.constraint(equalTo: gameInfoContainer.bottomAnchor, constant: -30),
        ])
    }
}
