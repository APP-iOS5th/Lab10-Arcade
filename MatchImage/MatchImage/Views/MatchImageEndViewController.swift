//
//  MatchImageEndViewController.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-07.
//

import UIKit

class MatchImageEndViewController: UIViewController {
    let backgroundImage = BackgroundImage().backgroundImage
    let gameInfoContainer = MatchImageInformation().gameInfoContainer
    let gameTitle = MatchImageInformation().gameTitle
    let gameDescription = MatchImageInformation().gameDescription
    let gamePlayTime = MatchImageInformation().gamePlayTime
    let restartButton = CustomButton().button
    
    var playTime = ""
    var difficulty = "쉬움"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "게임 종료"
        
        let navigationBarButtonItem = UIBarButtonItem(title: "시작 화면", style: .plain, target: self, action: #selector(goToStart))
        navigationItem.setLeftBarButton(navigationBarButtonItem, animated: true)
        
        // bring saved matrix
        if let savedMatrix =
//            UserDefaults.value(forKey: "matrix") as? [Int] {
            UserDefaults.standard.array(forKey: "matrix") as? [Int] {
            switch savedMatrix {
            case [3,2]:
                difficulty = "쉬움"
            case [3,4]:
                difficulty = "보통"
            case [3,6]:
                difficulty = "어려움"
            default:
                difficulty = "쉬움"
            }
        }
        
        gameDescription.text = "난이도: \(difficulty)\n\n플레이 시간"
        gamePlayTime.text = playTime
        
        restartButton.setTitle("Restart", for: .normal)
        restartButton.addAction(UIAction { [weak self] _ in
            let matchImageGameViewController = MatchImageGameViewController()
            self?.navigationController?.pushViewController(matchImageGameViewController, animated: true)
        }, for: .touchUpInside)
        setupLayout()
    }
    
    private func setupLayout() {
        gameInfoContainer.addSubview(gameTitle)
        gameInfoContainer.addSubview(gameDescription)
        gameInfoContainer.addSubview(gamePlayTime)
        view.addSubview(backgroundImage)
        view.addSubview(gameInfoContainer)
        view.addSubview(restartButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
            restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            restartButton.widthAnchor.constraint(equalToConstant: 150),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func goToStart() {
        let startViewController = MatchImageStartViewController()
        self.navigationController?.pushViewController(startViewController, animated: true)
    }
}
