//
//  ViewController.swift
//  MatchImage
//
//  Created by Jungjin Park on 2024-06-03.
//

import UIKit

class MatchImageStartViewController: UIViewController {
    let backgroundImage = BackgroundImage().backgroundImage
    let gameInfoContainer = MatchImageInformation().gameInfoContainer
    let gameTitle = MatchImageInformation().gameTitle
    let gameDescription = MatchImageInformation().gameDescription
    let startButton = CustomButton().button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        self.title = "Start Page"
        
        gameDescription.text = "도전!\n 최단 시간에 그림 쌍을 맞춰 보세요."
        startButton.setTitle("STRAT", for: .normal)
        
        setupLayout()
    }
    
    private func setupLayout() {
        gameInfoContainer.addSubview(gameTitle)
        gameInfoContainer.addSubview(gameDescription)
        view.addSubview(backgroundImage)
        view.addSubview(gameInfoContainer)
        view.addSubview(startButton)
        
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
            gameDescription.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 30),
            gameDescription.leadingAnchor.constraint(equalTo: gameInfoContainer.leadingAnchor, constant: 40),
            gameDescription.trailingAnchor.constraint(equalTo: gameInfoContainer.trailingAnchor, constant: -40),
            gameDescription.bottomAnchor.constraint(equalTo: gameInfoContainer.bottomAnchor, constant: -30),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
